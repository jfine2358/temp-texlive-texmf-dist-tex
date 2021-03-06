if not modules then modules = { } end modules ['pack-rul'] = {
    version   = 1.001,
    comment   = "companion to pack-rul.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

--[[ldx--
<p>An explanation is given in the history document <t>mk</t>.</p>
--ldx]]--

-- we need to be careful with display math as it uses shifts

-- \framed[align={lohi,middle}]{$x$}
-- \framed[align={lohi,middle}]{$ $}
-- \framed[align={lohi,middle}]{\hbox{ }}
-- \framed[align={lohi,middle}]{\hbox{}}
-- \framed[align={lohi,middle}]{$\hskip2pt$}

local type = type

local hlist_code      = nodes.nodecodes.hlist
local vlist_code      = nodes.nodecodes.vlist
local box_code        = nodes.listcodes.box
local line_code       = nodes.listcodes.line
local equation_code   = nodes.listcodes.equation

local texsetdimen     = tex.setdimen
local texsetcount     = tex.setcount

local implement       = interfaces.implement

local nuts            = nodes.nuts

local getfield        = nuts.getfield
local setfield        = nuts.setfield
local getnext         = nuts.getnext
local getprev         = nuts.getprev
local getlist         = nuts.getlist
local setlist         = nuts.setlist
local getwhd          = nuts.getwhd
local getid           = nuts.getid
local getsubtype      = nuts.getsubtype
local getbox          = nuts.getbox
local getdir          = nuts.getdir
local setshift        = nuts.setshift
local setwidth        = nuts.setwidth
local getwidth        = nuts.getwidth

local hpack           = nuts.hpack
local traverse_id     = nuts.traverse_id
local list_dimensions = nuts.dimensions
local flush_node      = nuts.flush

local checkformath    = false

directives.register("framed.checkmath",function(v) checkformath = v end) -- experiment

-- beware: dir nodes and pseudostruts can end up on lines of their own

local function doreshapeframedbox(n)
    local box            = getbox(n)
    local noflines       = 0
    local nofnonzero     = 0
    local firstheight    = nil
    local lastdepth      = nil
    local lastlinelength = 0
    local minwidth       = 0
    local maxwidth       = 0
    local totalwidth     = 0
    local averagewidth   = 0
    local boxwidth       = getwidth(box)
    if boxwidth ~= 0 then -- and h.subtype == vlist_code
        local list = getlist(box)
        if list then
            local function check(n,repack)
                local width, height, depth = getwhd(n)
                if not firstheight then
                    firstheight = height
                end
                lastdepth = depth
                noflines  = noflines + 1
                local l   = getlist(n)
                if l then
                    if repack then
                        local subtype = getsubtype(n)
                        if subtype == box_code or subtype == line_code then
                            lastlinelength = list_dimensions(l,getdir(n))
                        else
                            lastlinelength = width
                        end
                    else
                        lastlinelength = width
                    end
                    if lastlinelength > maxwidth then
                        maxwidth = lastlinelength
                    end
                    if lastlinelength < minwidth or minwidth == 0 then
                        minwidth = lastlinelength
                    end
                    if lastlinelength > 0 then
                        nofnonzero = nofnonzero + 1
                    end
                    totalwidth = totalwidth + lastlinelength
                end
            end
            local hdone = false
            for h in traverse_id(hlist_code,list) do -- no dir etc needed
                check(h,true)
                hdone = true
            end
         -- local vdone = false
            for v in traverse_id(vlist_code,list) do -- no dir etc needed
                check(v,false)
             -- vdone = true
            end
            if not firstheight then
                -- done)
            elseif maxwidth ~= 0 then
                if hdone then
                    for h in traverse_id(hlist_code,list) do
                        local l = getlist(h)
                        if l then
                            local subtype = getsubtype(h)
                            if subtype == box_code or subtype == line_code then
                                local p = hpack(l,maxwidth,'exactly',getdir(h)) -- multiple return value
                                setfield(h,"glue_set",getfield(p,"glue_set"))
                                setfield(h,"glue_order",getfield(p,"glue_order"))
                                setfield(h,"glue_sign",getfield(p,"glue_sign"))
                                setlist(p)
                                flush_node(p)
                            elseif checkformath and subtype == equation_code then
                             -- display formulas use a shift
                                if nofnonzero == 1 then
                                    setshift(h,0)
                                end
                            end
                            setwidth(h,maxwidth)
                        end
                    end
                end
             -- if vdone then
             --     for v in traverse_id(vlist_code,list) do
             --         local width = getwidth(n)
             --         if width > maxwidth then
             --             setwidth(v,maxwidth)
             --         end
             --     end
             -- end
                setwidth(box,maxwidth)
                averagewidth = noflines > 0 and totalwidth/noflines or 0
            else -- e.g. empty math {$ $} or \hbox{} or ...
                setwidth(box,0)
            end
        end
    end
    texsetcount("global","framednoflines",noflines)
    texsetdimen("global","framedfirstheight",firstheight or 0) -- also signal
    texsetdimen("global","framedlastdepth",lastdepth or 0)
    texsetdimen("global","framedminwidth",minwidth)
    texsetdimen("global","framedmaxwidth",maxwidth)
    texsetdimen("global","framedaveragewidth",averagewidth)
end

local function doanalyzeframedbox(n)
    local box         = getbox(n)
    local noflines    = 0
    local firstheight = nil
    local lastdepth   = nil
    if getwidth(box) ~= 0 then
        local list = getlist(box)
        if list then
            local function check(n)
                local width, height, depth = getwhd(n)
                if not firstheight then
                    firstheight = height
                end
                lastdepth = depth
                noflines  = noflines + 1
            end
            for h in traverse_id(hlist_code,list) do
                check(h)
            end
            for v in traverse_id(vlist_code,list) do
                check(v)
            end
        end
    end
    texsetcount("global","framednoflines",noflines)
    texsetdimen("global","framedfirstheight",firstheight or 0)
    texsetdimen("global","framedlastdepth",lastdepth or 0)
end

implement { name = "doreshapeframedbox", actions = doreshapeframedbox, arguments = "integer" }
implement { name = "doanalyzeframedbox", actions = doanalyzeframedbox, arguments = "integer" }

local function maxboxwidth(box)
    local boxwidth = getwidth(box)
    if boxwidth == 0 then
        return 0
    end
    local list = getlist(box)
    if not list then
        return 0
    end
    if getid(box) == hlist_code then
        return boxwidth
    end
    local lastlinelength = 0
    local maxwidth       = 0
    local function check(n,repack)
        local l = getlist(n)
        if l then
            if repack then
                local subtype = getsubtype(n)
                if subtype == box_code or subtype == line_code then
                    lastlinelength = list_dimensions(l,getdir(n))
                else
                    lastlinelength = getwidth(n)
                end
            else
                lastlinelength = getwidth(n)
            end
            if lastlinelength > maxwidth then
                maxwidth = lastlinelength
            end
        end
    end
    for h in traverse_id(hlist_code,list) do -- no dir etc needed
        check(h,true)
    end
    for v in traverse_id(vlist_code,list) do -- no dir etc needed
        check(v,false)
    end
    return maxwidth
end

nodes.maxboxwidth = maxboxwidth

implement {
    name      = "themaxboxwidth",
    actions   = function(n) context("%rsp",maxboxwidth(getbox(n))) end, -- r = rounded
    arguments = "integer"
}
