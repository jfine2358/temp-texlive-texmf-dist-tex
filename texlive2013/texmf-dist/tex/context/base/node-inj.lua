if not modules then modules = { } end modules ['node-inj'] = {
    version   = 1.001,
    comment   = "companion to node-ini.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files",
}

-- This is very experimental (this will change when we have luatex > .50 and
-- a few pending thingies are available. Also, Idris needs to make a few more
-- test fonts. Btw, future versions of luatex will have extended glyph properties
-- that can be of help. Some optimizations can go away when we have faster machines.

local next = next
local utfchar = utf.char

local trace_injections = false  trackers.register("nodes.injections", function(v) trace_injections = v end)

local report_injections = logs.reporter("nodes","injections")

local attributes, nodes, node = attributes, nodes, node

fonts                    = fonts
local fontdata           = fonts.hashes.identifiers

nodes.injections         = nodes.injections or { }
local injections         = nodes.injections

local nodecodes          = nodes.nodecodes
local glyph_code         = nodecodes.glyph
local nodepool           = nodes.pool
local newkern            = nodepool.kern

local traverse_id        = node.traverse_id
local insert_node_before = node.insert_before
local insert_node_after  = node.insert_after

local a_kernpair = attributes.private('kernpair')
local a_ligacomp = attributes.private('ligacomp')
local a_markbase = attributes.private('markbase')
local a_markmark = attributes.private('markmark')
local a_markdone = attributes.private('markdone')
local a_cursbase = attributes.private('cursbase')
local a_curscurs = attributes.private('curscurs')
local a_cursdone = attributes.private('cursdone')

-- This injector has been tested by Idris Samawi Hamid (several arabic fonts as well as
-- the rather demanding Husayni font), Khaled Hosny (latin and arabic) and Kaj Eigner
-- (arabic, hebrew and thai) and myself (whatever font I come across). I'm pretty sure
-- that this code is not 100% okay but examples are needed to figure things out.

function injections.installnewkern(nk)
    newkern = nk or newkern
end

local cursives = { }
local marks    = { }
local kerns    = { }

-- Currently we do gpos/kern in a bit inofficial way but when we have the extra fields in
-- glyphnodes to manipulate ht/dp/wd explicitly I will provide an alternative; also, we
-- can share tables.

-- For the moment we pass the r2l key ... volt/arabtype tests .. idris: this needs
-- checking with husayni (volt and fontforge).

function injections.setcursive(start,nxt,factor,rlmode,exit,entry,tfmstart,tfmnext)
    local dx, dy = factor*(exit[1]-entry[1]), factor*(exit[2]-entry[2])
    local ws, wn = tfmstart.width, tfmnext.width
    local bound = #cursives + 1
    start[a_cursbase] = bound
    nxt[a_curscurs] = bound
    cursives[bound] = { rlmode, dx, dy, ws, wn }
    return dx, dy, bound
end

function injections.setpair(current,factor,rlmode,r2lflag,spec,tfmchr)
    local x, y, w, h = factor*spec[1], factor*spec[2], factor*spec[3], factor*spec[4]
    -- dy = y - h
    if x ~= 0 or w ~= 0 or y ~= 0 or h ~= 0 then
        local bound = current[a_kernpair]
        if bound then
            local kb = kerns[bound]
            -- inefficient but singles have less, but weird anyway, needs checking
            kb[2], kb[3], kb[4], kb[5] = (kb[2] or 0) + x, (kb[3] or 0) + y, (kb[4] or 0)+ w, (kb[5] or 0) + h
        else
            bound = #kerns + 1
            current[a_kernpair] = bound
            kerns[bound] = { rlmode, x, y, w, h, r2lflag, tfmchr.width }
        end
        return x, y, w, h, bound
    end
    return x, y, w, h -- no bound
end

function injections.setkern(current,factor,rlmode,x,tfmchr)
    local dx = factor*x
    if dx ~= 0 then
        local bound = #kerns + 1
        current[a_kernpair] = bound
        kerns[bound] = { rlmode, dx }
        return dx, bound
    else
        return 0, 0
    end
end

function injections.setmark(start,base,factor,rlmode,ba,ma,index) -- ba=baseanchor, ma=markanchor
    local dx, dy = factor*(ba[1]-ma[1]), factor*(ba[2]-ma[2])     -- the index argument is no longer used but when this
    local bound = base[a_markbase]                    -- fails again we should pass it
    local index = 1
    if bound then
        local mb = marks[bound]
        if mb then
         -- if not index then index = #mb + 1 end
            index = #mb + 1
            mb[index] = { dx, dy, rlmode }
            start[a_markmark] = bound
            start[a_markdone] = index
            return dx, dy, bound
        else
            report_injections("possible problem, %U is base mark without data (id %a)",base.char,bound)
        end
    end
--     index = index or 1
    index = index or 1
    bound = #marks + 1
    base[a_markbase] = bound
    start[a_markmark] = bound
    start[a_markdone] = index
    marks[bound] = { [index] = { dx, dy, rlmode } }
    return dx, dy, bound
end

local function dir(n)
    return (n and n<0 and "r-to-l") or (n and n>0 and "l-to-r") or "unset"
end

local function trace(head)
    report_injections("begin run")
    for n in traverse_id(glyph_code,head) do
        if n.subtype < 256 then
            local kp = n[a_kernpair]
            local mb = n[a_markbase]
            local mm = n[a_markmark]
            local md = n[a_markdone]
            local cb = n[a_cursbase]
            local cc = n[a_curscurs]
            local char = n.char
            report_injections("font %s, char %U, glyph %c",char,n.font,char)
            if kp then
                local k = kerns[kp]
                if k[3] then
                    report_injections("  pairkern: dir %a, x %p, y %p, w %p, h %p",dir(k[1]),k[2],k[3],k[4],k[5])
                else
                    report_injections("  kern: dir %a, dx %p",dir(k[1]),k[2])
                end
            end
            if mb then
                report_injections("  markbase: bound %a",mb)
            end
            if mm then
                local m = marks[mm]
                if mb then
                    local m = m[mb]
                    if m then
                        report_injections("  markmark: bound %a, index %a, dx %p, dy %p",mm,md,m[1],m[2])
                    else
                        report_injections("  markmark: bound %a, missing index",mm)
                    end
                else
                    m = m[1]
                    report_injections("  markmark: bound %a, dx %p, dy %p",mm,m and m[1],m and m[2])
                end
            end
            if cb then
                report_injections("  cursbase: bound %a",cb)
            end
            if cc then
                local c = cursives[cc]
                report_injections("  curscurs: bound %a, dir %a, dx %p, dy %p",cc,dir(c[1]),c[2],c[3])
            end
        end
    end
    report_injections("end run")
end

-- todo: reuse tables (i.e. no collection), but will be extra fields anyway
-- todo: check for attribute

-- We can have a fast test on a font being processed, so we can check faster for marks etc
-- but I'll make a context variant anyway.

function injections.handler(head,where,keep)
    local has_marks, has_cursives, has_kerns = next(marks), next(cursives), next(kerns)
    if has_marks or has_cursives then
        if trace_injections then
            trace(head)
        end
        -- in the future variant we will not copy items but refs to tables
        local done, ky, rl, valid, cx, wx, mk, nofvalid = false, { }, { }, { }, { }, { }, { }, 0
        if has_kerns then -- move outside loop
            local nf, tm = nil, nil
            for n in traverse_id(glyph_code,head) do -- only needed for relevant fonts
                if n.subtype < 256 then
                    nofvalid = nofvalid + 1
                    valid[nofvalid] = n
                    if n.font ~= nf then
                        nf = n.font
                        tm = fontdata[nf].resources.marks
                    end
                    if tm then
                        mk[n] = tm[n.char]
                    end
                    local k = n[a_kernpair]
                    if k then
                        local kk = kerns[k]
                        if kk then
                            local x, y, w, h = kk[2] or 0, kk[3] or 0, kk[4] or 0, kk[5] or 0
                            local dy = y - h
                            if dy ~= 0 then
                                ky[n] = dy
                            end
                            if w ~= 0 or x ~= 0 then
                                wx[n] = kk
                            end
                            rl[n] = kk[1] -- could move in test
                        end
                    end
                end
            end
        else
            local nf, tm = nil, nil
            for n in traverse_id(glyph_code,head) do
                if n.subtype < 256 then
                    nofvalid = nofvalid + 1
                    valid[nofvalid] = n
                    if n.font ~= nf then
                        nf = n.font
                        tm = fontdata[nf].resources.marks
                    end
                    if tm then
                        mk[n] = tm[n.char]
                    end
                end
            end
        end
        if nofvalid > 0 then
            -- we can assume done == true because we have cursives and marks
            local cx = { }
            if has_kerns and next(ky) then
                for n, k in next, ky do
                    n.yoffset = k
                end
            end
            -- todo: reuse t and use maxt
            if has_cursives then
                local p_cursbase, p = nil, nil
                -- since we need valid[n+1] we can also use a "while true do"
                local t, d, maxt = { }, { }, 0
                for i=1,nofvalid do -- valid == glyphs
                    local n = valid[i]
                    if not mk[n] then
                        local n_cursbase = n[a_cursbase]
                        if p_cursbase then
                            local n_curscurs = n[a_curscurs]
                            if p_cursbase == n_curscurs then
                                local c = cursives[n_curscurs]
                                if c then
                                    local rlmode, dx, dy, ws, wn = c[1], c[2], c[3], c[4], c[5]
                                    if rlmode >= 0 then
                                        dx = dx - ws
                                    else
                                        dx = dx + wn
                                    end
                                    if dx ~= 0 then
                                        cx[n] = dx
                                        rl[n] = rlmode
                                    end
                                --  if rlmode and rlmode < 0 then
                                        dy = -dy
                                --  end
                                    maxt = maxt + 1
                                    t[maxt] = p
                                    d[maxt] = dy
                                else
                                    maxt = 0
                                end
                            end
                        elseif maxt > 0 then
                            local ny = n.yoffset
                            for i=maxt,1,-1 do
                                ny = ny + d[i]
                                local ti = t[i]
                                ti.yoffset = ti.yoffset + ny
                            end
                            maxt = 0
                        end
                        if not n_cursbase and maxt > 0 then
                            local ny = n.yoffset
                            for i=maxt,1,-1 do
                                ny = ny + d[i]
                                local ti = t[i]
                                ti.yoffset = ny
                            end
                            maxt = 0
                        end
                        p_cursbase, p = n_cursbase, n
                    end
                end
                if maxt > 0 then
                    local ny = n.yoffset
                    for i=maxt,1,-1 do
                        ny = ny + d[i]
                        local ti = t[i]
                        ti.yoffset = ny
                    end
                    maxt = 0
                end
                if not keep then
                    cursives = { }
                end
            end
            if has_marks then
                for i=1,nofvalid do
                    local p = valid[i]
                    local p_markbase = p[a_markbase]
                    if p_markbase then
                        local mrks = marks[p_markbase]
                        local nofmarks = #mrks
                        for n in traverse_id(glyph_code,p.next) do
                            local n_markmark = n[a_markmark]
                            if p_markbase == n_markmark then
                                local index = n[a_markdone] or 1
                                local d = mrks[index]
                                if d then
                                    local rlmode = d[3]
                                    if rlmode and rlmode >= 0 then
                                        -- new per 2010-10-06, width adapted per 2010-02-03
                                        -- we used to negate the width of marks because in tfm
                                        -- that makes sense but we no longer do that so as a
                                        -- consequence the sign of p.width was changed
                                        local k = wx[p]
                                        if k then
                                            -- brill roman: A\char"0300 (but ugly anyway)
                                            n.xoffset = p.xoffset - p.width + d[1] - k[2] -- was + p.width
                                        else
                                            -- lucida: U\char"032F (default+mark)
                                            n.xoffset = p.xoffset - p.width + d[1] -- 01-05-2011
                                        end
                                    else
                                        local k = wx[p]
                                        if k then
                                            n.xoffset = p.xoffset - d[1] - k[2]
                                        else
                                            n.xoffset = p.xoffset - d[1]
                                        end
                                    end
                                    if mk[p] then
                                        n.yoffset = p.yoffset + d[2]
                                    else
                                        n.yoffset = n.yoffset + p.yoffset + d[2]
                                    end
                                    if nofmarks == 1 then
                                        break
                                    else
                                        nofmarks = nofmarks - 1
                                    end
                                end
                            else
                                -- KE: there can be <mark> <mkmk> <mark> sequences in ligatures
                            end
                        end
                    end
                end
                if not keep then
                    marks = { }
                end
            end
            -- todo : combine
            if next(wx) then
                for n, k in next, wx do
                 -- only w can be nil (kernclasses), can be sped up when w == nil
                    local x, w = k[2] or 0, k[4]
                    if w then
                        local rl = k[1] -- r2l = k[6]
                        local wx = w - x
                        if rl < 0 then	-- KE: don't use r2l here
                            if wx ~= 0 then
                                insert_node_before(head,n,newkern(wx))
                            end
                            if x ~= 0 then
                                insert_node_after (head,n,newkern(x))
                            end
                        else
                            if x ~= 0 then
                                insert_node_before(head,n,newkern(x))
                            end
                            if wx ~= 0 then
                                insert_node_after(head,n,newkern(wx))
                            end
                        end
                    elseif x ~= 0 then
                        -- this needs checking for rl < 0 but it is unlikely that a r2l script
                        -- uses kernclasses between glyphs so we're probably safe (KE has a
                        -- problematic font where marks interfere with rl < 0 in the previous
                        -- case)
                        insert_node_before(head,n,newkern(x))
                    end
                end
            end
            if next(cx) then
                for n, k in next, cx do
                    if k ~= 0 then
                        local rln = rl[n]
                        if rln and rln < 0 then
                            insert_node_before(head,n,newkern(-k))
                        else
                            insert_node_before(head,n,newkern(k))
                        end
                    end
                end
            end
            if not keep then
                kerns = { }
            end
            return head, true
        elseif not keep then
            kerns, cursives, marks = { }, { }, { }
        end
    elseif has_kerns then
        if trace_injections then
            trace(head)
        end
        for n in traverse_id(glyph_code,head) do
            if n.subtype < 256 then
                local k = n[a_kernpair]
                if k then
                    local kk = kerns[k]
                    if kk then
                        local rl, x, y, w = kk[1], kk[2] or 0, kk[3], kk[4]
                        if y and y ~= 0 then
                            n.yoffset = y -- todo: h ?
                        end
                        if w then
                            -- copied from above
                         -- local r2l = kk[6]
                            local wx = w - x
                            if rl < 0 then  -- KE: don't use r2l here
                                if wx ~= 0 then
                                    insert_node_before(head,n,newkern(wx))
                                end
                                if x ~= 0 then
                                    insert_node_after (head,n,newkern(x))
                                end
                            else
                                if x ~= 0 then
                                    insert_node_before(head,n,newkern(x))
                                end
                                if wx ~= 0 then
                                    insert_node_after(head,n,newkern(wx))
                                end
                            end
                        else
                            -- simple (e.g. kernclass kerns)
                            if x ~= 0 then
                                insert_node_before(head,n,newkern(x))
                            end
                        end
                    end
                end
            end
        end
        if not keep then
            kerns = { }
        end
        return head, true
    else
        -- no tracing needed
    end
    return head, false
end
