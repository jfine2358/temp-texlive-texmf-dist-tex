if not modules then modules = { } end modules ['char-tex'] = {
    version   = 1.001,
    comment   = "companion to char-ini.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

local lpeg = lpeg
local tonumber, next, type = tonumber, next, type
local format, find, gmatch, match = string.format, string.find, string.gmatch, string.match
local utfchar, utfbyte = utf.char, utf.byte
local concat, tohash = table.concat, table.tohash
local P, C, R, S, V, Cs, Cc = lpeg.P, lpeg.C, lpeg.R, lpeg.S, lpeg.V, lpeg.Cs, lpeg.Cc

local lpegpatterns          = lpeg.patterns
local lpegmatch             = lpeg.match
local utfchartabletopattern = lpeg.utfchartabletopattern

local allocate              = utilities.storage.allocate
local mark                  = utilities.storage.mark

local context               = context
local commands              = commands

local characters            = characters
local texcharacters         = { }
characters.tex              = texcharacters
local utffilters            = characters.filters.utf

local is_character          = characters.is_character
local is_letter             = characters.is_letter
local is_command            = characters.is_command
local is_spacing            = characters.is_spacing
local is_mark               = characters.is_mark
local is_punctuation        = characters.is_punctuation

local data                  = characters.data  if not data then return end
local blocks                = characters.blocks

local trace_defining        = false  trackers.register("characters.defining", function(v) characters_defining = v end)

local report_defining       = logs.reporter("characters")

--[[ldx--
<p>In order to deal with 8-bit output, we need to find a way to go from <l n='utf'/> to
8-bit. This is handled in the <l n='luatex'/> engine itself.</p>

<p>This leaves us problems with characters that are specific to <l n='tex'/> like
<type>{}</type>, <type>$</type> and alike. We can remap some chars that tex input files
are sensitive for to a private area (while writing to a utility file) and revert then
to their original slot when we read in such a file. Instead of reverting, we can (when
we resolve characters to glyphs) map them to their right glyph there. For this purpose
we can use the private planes 0x0F0000 and 0x100000.</p>
--ldx]]--

local low     = allocate()
local high    = allocate()
local escapes = allocate()
local special = "~#$%^&_{}\\|" -- "~#$%{}\\|"

local private = {
    low     = low,
    high    = high,
    escapes = escapes,
}

utffilters.private = private

for ch in gmatch(special,".") do
    local cb
    if type(ch) == "number" then
        cb, ch = ch, utfchar(ch)
    else
        cb = utfbyte(ch)
    end
    if cb < 256 then
        escapes[ch] = "\\" .. ch
        low[ch] = utfchar(0x0F0000 + cb)
        if ch == "%" then
            ch = "%%" -- nasty, but we need this as in replacements (also in lpeg) % is interpreted
        end
        high[utfchar(0x0F0000 + cb)] = ch
    end
end

local tohigh = lpeg.replacer(low)   -- frozen, only for basic tex
local tolow  = lpeg.replacer(high)  -- frozen, only for basic tex

lpegpatterns.utftohigh = tohigh
lpegpatterns.utftolow  = tolow

function utffilters.harden(str)
    return lpegmatch(tohigh,str)
end

function utffilters.soften(str)
    return lpegmatch(tolow,str)
end

private.escape  = utf.remapper(escapes) -- maybe: ,"dynamic"
private.replace = utf.remapper(low)     -- maybe: ,"dynamic"
private.revert  = utf.remapper(high)    -- maybe: ,"dynamic"

--[[ldx--
<p>We get a more efficient variant of this when we integrate
replacements in collapser. This more or less renders the previous
private code redundant. The following code is equivalent but the
first snippet uses the relocated dollars.</p>

<typing>
[????x????] [$x$]
</typing>
--ldx]]--

-- using the tree-lpeg-mapper would be nice but we also need to deal with end-of-string
-- cases: "\"\i" and don't want "\relax" to be seen as \r e lax" (for which we need to mess
-- with spaces

local accentmapping = allocate {
    ['"'] = { [""] = "??",
        A = "??", a = "??",
        E = "??", e = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        O = "??", o = "??",
        U = "??", u = "??",
        Y = "??", y = "??",
    },
    ["'"] = { [""] = "??",
        A = "??", a = "??",
        C = "??", c = "??",
        E = "??", e = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        L = "??", l = "??",
        N = "??", n = "??",
        O = "??", o = "??",
        R = "??", r = "??",
        S = "??", s = "??",
        U = "??", u = "??",
        Y = "??", y = "??",
        Z = "??", z = "??",
    },
    ["."] = { [""] = "??",
        C = "??", c = "??",
        E = "??", e = "??",
        G = "??", g = "??",
        I = "??", i = "i", ["??"] = "i", ["\\i"] = "i",
        Z = "??", z = "??",
    },
    ["="] = { [""] = "??",
        A = "??", a = "??",
        E = "??", e = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        O = "??", o = "??",
        U = "??", u = "??",
    },
    ["H"] = { [""] = "??",
        O = "??", o = "??",
        U = "??", u = "??",
    },
    ["^"] = { [""] = "??",
        A = "??", a = "??",
        C = "??", c = "??",
        E = "??", e = "??",
        G = "??", g = "??",
        H = "??", h = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        J = "??", j = "??",
        O = "??", o = "??",
        S = "??", s = "??",
        U = "??", u = "??",
        W = "??", w = "??",
        Y = "??", y = "??",
    },
    ["`"] = { [""] = "`",
        A = "??", a = "??",
        E = "??", e = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        O = "??", o = "??",
        U = "??", u = "??",
        Y = "???", y = "???",
    },
    ["c"] = { [""] = "??",
        C = "??", c = "??",
        K = "??", k = "??",
        L = "??", l = "??",
        N = "??", n = "??",
        R = "??", r = "??",
        S = "??", s = "??",
        T = "??", t = "??",
    },
    ["k"] = { [""] = "??",
        A = "??", a = "??",
        E = "??", e = "??",
        I = "??", i = "??",
        U = "??", u = "??",
    },
    ["r"] = { [""] = "??",
        A = "??", a = "??",
        U = "??", u = "??",
    },
    ["u"] = { [""] = "??",
        A = "??", a = "??",
        E = "??", e = "??",
        G = "??", g = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        O = "??", o = "??",
        U = "??", u = "??",
        },
    ["v"] = { [""] = "??",
        C = "??", c = "??",
        D = "??", d = "??",
        E = "??", e = "??",
        L = "??", l = "??",
        N = "??", n = "??",
        R = "??", r = "??",
        S = "??", s = "??",
        T = "??", t = "??",
        Z = "??", z = "??",
        },
    ["~"] = { [""] = "??",
        A = "??", a = "??",
        I = "??", i = "??", ["??"] = "??", ["\\i"] = "??",
        N = "??", n = "??",
        O = "??", o = "??",
        U = "??", u = "??",
    },
}

texcharacters.accentmapping = accentmapping

local accent_map = allocate { -- incomplete
   ['~'] = "??" , --  ?? ???
   ['"'] = "??" , --  ?? ??
   ["`"] = "??" , --  ?? ??
   ["'"] = "??" , --  ?? ??
   ["^"] = "??" , --  ?? ??
    --  ?? ??
    --  ?? ??
    --  ?? ??
    --  ?? ???
    --  ?? ??
    --  ?? ??
    --  ?? ??
    --  ?? ???
    --  ?? ??
    --  ?? ??
    --  ?? ???
    --  ?? ???
}

-- local accents = concat(table.keys(accentmapping)) -- was _map

local function remap_accent(a,c,braced)
    local m = accentmapping[a]
    if m then
        local n = m[c]
        if n then
            return n
        end
    end
--     local m = accent_map[a]
--     if m then
--         return c .. m
--     elseif braced then -- or #c > 0
    if braced then -- or #c > 0
        return "\\" .. a .. "{" .. c .. "}"
    else
        return "\\" .. a .. " " .. c
    end
end

local commandmapping = allocate {
    ["aa"] = "??", ["AA"] = "???",
    ["ae"] = "??", ["AE"] = "??",
    ["cc"] = "??", ["CC"] = "??",
    ["i"]  = "??", ["j"]  = "??",
    ["ij"] = "??", ["IJ"] = "??",
    ["l"]  = "??", ["L"]  = "??",
    ["o"]  = "??", ["O"]  = "??",
    ["oe"] = "??", ["OE"] = "??",
    ["sz"] = "??", ["SZ"] = "SZ", ["ss"] = "??", ["SS"] = "??", -- uppercase: ???
}

texcharacters.commandmapping = commandmapping

local ligaturemapping = allocate {
    ["''"]  = "???",
    ["``"]  = "???",
    ["--"]  = "???",
    ["---"] = "???",
}

-- local achar    = R("az","AZ") + P("??") + P("\\i")
--
-- local spaces   = P(" ")^0
-- local no_l     = P("{") / ""
-- local no_r     = P("}") / ""
-- local no_b     = P('\\') / ""
--
-- local lUr      = P("{") * C(achar) * P("}")
--
-- local accents_1 = [["'.=^`~]]
-- local accents_2 = [[Hckruv]]
--
-- local accent   = P('\\') * (
--     C(S(accents_1)) * (lUr * Cc(true) + C(achar) * Cc(false)) + -- we need achar for ?? etc, could be sped up
--     C(S(accents_2)) *  lUr * Cc(true)
-- ) / remap_accent
--
-- local csname  = P('\\') * C(R("az","AZ")^1)
--
-- local command  = (
--     csname +
--     P("{") * csname * spaces * P("}")
-- ) / commandmapping -- remap_commands
--
-- local both_1 = Cs { "run",
--     accent  = accent,
--     command = command,
--     run     = (V("accent") + no_l * V("accent") * no_r + V("command") + P(1))^0,
-- }
--
-- local both_2 = Cs { "run",
--     accent  = accent,
--     command = command,
--     run     = (V("accent") + V("command") + no_l * ( V("accent") + V("command") ) * no_r + P(1))^0,
-- }
--
-- function texcharacters.toutf(str,strip)
--     if not find(str,"\\",1,true) then
--         return str
--     elseif strip then
--         return lpegmatch(both_1,str)
--     else
--         return lpegmatch(both_2,str)
--     end
-- end

local untex

local function toutfpattern()
    if not untex then
        local hash = { }
        for k, v in next, accentmapping do
            for kk, vv in next, v do
                if (k >= "a" and k <= "z") or (k >= "A" and k <= "Z") then
                    hash[ "\\"..k.." "..kk     ] = vv
                    hash["{\\"..k.." "..kk.."}"] = vv
                else
                    hash["\\" ..k     ..kk     ] = vv
                    hash["{\\"..k     ..kk.."}"] = vv
                end
                hash["\\" ..k.."{"..kk.."}" ] = vv
                hash["{\\"..k.."{"..kk.."}}"] = vv
            end
        end
        for k, v in next, commandmapping do
            hash["\\"..k.." "] = v
            hash["{\\"..k.."}"] = v
            hash["{\\"..k.." }"] = v
        end
        for k, v in next, ligaturemapping do
            hash[k] = v
        end
        untex = utfchartabletopattern(hash) / hash
    end
    return untex
end

texcharacters.toutfpattern = toutfpattern

local pattern = nil

local function prepare()
    pattern = Cs((toutfpattern() + P(1))^0)
    return pattern
end

function texcharacters.toutf(str,strip)
    if str == "" then
        return str
    elseif not find(str,"\\",1,true) then
        return str
 -- elseif strip then
    else
        return lpegmatch(pattern or prepare(),str)
    end
end

-- print(texcharacters.toutf([[\~{Z}]],true))
-- print(texcharacters.toutf([[\'\i]],true))
-- print(texcharacters.toutf([[\'{\i}]],true))
-- print(texcharacters.toutf([[\"{e}]],true))
-- print(texcharacters.toutf([[\" {e}]],true))
-- print(texcharacters.toutf([[{\"{e}}]],true))
-- print(texcharacters.toutf([[{\" {e}}]],true))
-- print(texcharacters.toutf([[{\l}]],true))
-- print(texcharacters.toutf([[{\l }]],true))
-- print(texcharacters.toutf([[\v{r}]],true))
-- print(texcharacters.toutf([[fo{\"o}{\ss}ar]],true))
-- print(texcharacters.toutf([[H{\'a}n Th\^e\llap{\raise 0.5ex\hbox{\'{\relax}}} Th{\'a}nh]],true))

function texcharacters.safechar(n) -- was characters.safechar
    local c = data[n]
    if c and c.contextname then
        return "\\" .. c.contextname
    else
        return utfchar(n)
    end
end

if not context or not commands then
    -- used in e.g. mtx-bibtex
    return
end

-- all kind of initializations

if not interfaces then return end

local implement     = interfaces.implement

local tex           = tex
local texsetlccode  = tex.setlccode
local texsetsfcode  = tex.setsfcode
local texsetcatcode = tex.setcatcode

local contextsprint = context.sprint
local ctxcatcodes   = catcodes.numbers.ctxcatcodes

local texsetmacro   = tokens.setters.macro
local texsetchar    = tokens.setters.char

function texcharacters.defineaccents()
    local ctx_dodefineaccentcommand = context.dodefineaccentcommand
    local ctx_dodefineaccent        = context.dodefineaccent
    local ctx_dodefinecommand       = context.dodefinecommand
    for accent, group in next, accentmapping do
        ctx_dodefineaccentcommand(accent)
        for character, mapping in next, group do
            ctx_dodefineaccent(accent,character,mapping)
        end
    end
    for command, mapping in next, commandmapping do
        ctx_dodefinecommand(command,mapping)
    end
end

implement { -- a waste of scanner but consistent
    name    = "defineaccents",
    actions = texcharacters.defineaccents
}

--[[ldx--
<p>Instead of using a <l n='tex'/> file to define the named glyphs, we
use the table. After all, we have this information available anyway.</p>
--ldx]]--

function commands.makeactive(n,name) -- not used
    contextsprint(ctxcatcodes,format("\\catcode%s=13\\unexpanded\\def %s{\\%s}",n,utfchar(n),name))
 -- context("\\catcode%s=13\\unexpanded\\def %s{\\%s}",n,utfchar(n),name)
end

local function to_number(s)
    local n = tonumber(s)
    if n then
        return n
    end
    return tonumber(match(s,'^"(.*)$'),16) or 0
end

implement {
    name      = "utfchar",
    actions   = { to_number, utfchar, contextsprint },
    arguments = "string"
}

implement {
    name      = "safechar",
    actions   = { to_number, texcharacters.safechar, contextsprint },
    arguments = "string"
}

implement {
    name      = "uchar",
    arguments = { "integer", "integer" },
    actions   = function(h,l)
        context(utfchar(h*256+l))
    end
}

tex.uprint = commands.utfchar

-- in contect we don't use lc and uc codes (in fact in luatex we should have a hf code)
-- so at some point we might drop this

-- The following get set at the TeX end:

local forbidden = tohash {
    0x000A0, -- zs nobreakspace            <self>
    0x000AD, -- cf softhyphen              <self>
 -- 0x00600, -- cf arabicnumber            <self>
 -- 0x00601, -- cf arabicsanah             <self>
 -- 0x00602, -- cf arabicfootnotemarker    <self>
 -- 0x00603, -- cf arabicsafha             <self>
 -- 0x00604, -- cf arabicsamvat            <self>
 -- 0x00605, -- cf arabicnumberabove       <self>
 -- 0x0061C, -- cf arabiclettermark        <self>
 -- 0x006DD, -- cf arabicendofayah         <self>
 -- 0x008E2, -- cf arabicdisputedendofayah <self>
    0x02000, -- zs enquad                  <self>
    0x02001, -- zs emquad                  <self>
    0x02002, -- zs enspace                 \kern .5\emwidth
    0x02003, -- zs emspace                 \hskip \emwidth
    0x02004, -- zs threeperemspace         <self>
    0x02005, -- zs fourperemspace          <self>
    0x02006, -- zs sixperemspace           <self>
    0x02007, -- zs figurespace             <self>
    0x02008, -- zs punctuationspace        <self>
    0x02009, -- zs breakablethinspace      <self>
    0x0200A, -- zs hairspace               <self>
    0x0200B, -- cf zerowidthspace          <self>
    0x0200C, -- cf zwnj                    <self>
    0x0200D, -- cf zwj                     <self>
    0x0202F, -- zs narrownobreakspace      <self>
    0x0205F, -- zs medspace                \textormathspace +\medmuskip 2
 -- 0x03000, -- zs ideographicspace        <self>
 -- 0x0FEFF, -- cf zerowidthnobreakspace   \penalty \plustenthousand \kern \zeropoint
}

local csletters = characters.csletters -- also a signal that we have initialized
local activated = { }
local sfmode    = "unset" -- unset, traditional, normal
local block_too = false

directives.register("characters.blockstoo",function(v) block_too = v end)

-- If this is something that is not documentwide and used a lot, then we
-- need a more clever approach (trivial but not now).

local function setuppersfcodes(v,n)
    if sfstate ~= "unset" then
        report_defining("setting uppercase sf codes to %a",n)
        for u, chr in next, data do
            if chr.category == "lu" then
                texsetsfcode(u,n)
            end
        end
    end
    sfstate = v
end

directives.register("characters.spaceafteruppercase",function(v)
    if v == "traditional" then
        setuppersfcodes(v,999)
    elseif v == "normal" then
        setuppersfcodes(v,1000)
    end
end)

if not csletters then

    csletters            = allocate()
    characters.csletters = csletters

    report_defining("setting up character related codes and commands")

    if sfstate == "unset" then
        sfstate = "traditional"
    end

    local traditional = sfstate == "traditional"

    for u, chr in next, data do -- will move up
        local fallback = chr.fallback
        if fallback then
            contextsprint("{\\catcode",u,"=13\\unexpanded\\gdef ",utfchar(u),"{\\checkedchar{",u,"}{",fallback,"}}}")
            activated[#activated+1] = u
        else
            local contextname = chr.contextname
            local category    = chr.category
            local isletter    = is_letter[category]
            if contextname then
                if is_character[category] then
                    if chr.unicodeslot < 128 then
                        if isletter then
                            local c = utfchar(u)
                            texsetmacro(contextname,c)
                            csletters[c] = u
                        else
                            texsetchar(contextname,u)
                        end
                    else
                        local c = utfchar(u)
                        texsetmacro(contextname,c)
                        if isletter and u >= 32 and u <= 65536 then
                            csletters[c] = u
                        end
                    end
                    --
                    if isletter then
                        local lc = chr.lccode
                        local uc = chr.uccode
                        if not lc then
                            chr.lccode = u
                            lc = u
                        elseif type(lc) == "table" then
                            lc = u
                        end
                        if not uc then
                            chr.uccode = u
                            uc = u
                        elseif type(uc) == "table" then
                            uc = u
                        end
                        texsetlccode(u,lc,uc)
                        if traditional and category == "lu" then
                            texsetsfcode(code,999)
                        end
                    end
                    --
                elseif is_command[category] and not forbidden[u] then
                 -- contextsprint("{\\catcode",u,"=13\\unexpanded\\gdef ",utfchar(u),"{\\",contextname,"}}")
                 -- activated[#activated+1] = u
                    local c = utfchar(u)
                    texsetmacro(contextname,c)
                elseif is_mark[category] then
                    texsetlccode(u,u,u) -- for hyphenation
                end
         -- elseif isletter and u >= 32 and u <= 65536 then
            elseif isletter then
                csletters[utfchar(u)] = u
                --
                local lc, uc = chr.lccode, chr.uccode
                if not lc then
                    chr.lccode = u
                    lc = u
                elseif type(lc) == "table" then
                    lc = u
                end
                if not uc then
                    chr.uccode = u
                    uc = u
                elseif type(uc) == "table" then
                    uc = u
                end
                texsetlccode(u,lc,uc)
                if traditional and category == "lu" then
                    texsetsfcode(code,999)
                end
                --
            elseif is_mark[category] then
                --
                texsetlccode(u,u,u) -- for hyphenation
                --
            end
        end
    end

    if blocks_too then
        -- this slows down format generation by over 10 percent
        for k, v in next, blocks do
            if v.catcode == "letter" then
                local first = v.first
                local last  = v.last
                local gaps  = v.gaps
                if first and last then
                    for u=first,last do
                        csletters[utfchar(u)] = u
                        --
                     -- texsetlccode(u,u,u) -- self self
                        --
                    end
                end
                if gaps then
                    for i=1,#gaps do
                        local u = gaps[i]
                        csletters[utfchar(u)] = u
                        --
                     -- texsetlccode(u,u,u) -- self self
                        --
                    end
                end
            end
        end
    end

    if storage then
        storage.register("characters/csletters", csletters, "characters.csletters")
    end

else
    mark(csletters)

end

lpegpatterns.csletter = utfchartabletopattern(csletters)

-- todo: get rid of activated
-- todo: move first loop out ,merge with above

function characters.setlettercatcodes(cct)
    if trace_defining then
        report_defining("assigning letter catcodes to catcode table %a",cct)
    end
    local saved = tex.catcodetable
    tex.catcodetable = cct
    texsetcatcode(0x200C,11) -- non-joiner
    texsetcatcode(0x200D,11) -- joiner
    for c, u in next, csletters do
        texsetcatcode(u,11)
    end
 -- for u, chr in next, data do
 --     if not chr.fallback and is_letter[chr.category] and u >= 32 and u <= 65536 then
 --         texsetcatcode(u,11)
 --     end
 --     local range = chr.range
 --     if range then
 --         for i=1,range.first,range.last do -- tricky as not all are letters
 --             texsetcatcode(i,11)
 --         end
 --     end
 -- end
 -- for k, v in next, blocks do
 --     if v.catcode == "letter" then
 --         for u=v.first,v.last do
 --             texsetcatcode(u,11)
 --         end
 --     end
 -- end
    tex.catcodetable = saved
end

function characters.setactivecatcodes(cct)
    local saved = tex.catcodetable
    tex.catcodetable = cct
    for i=1,#activated do
        local u = activated[i]
        texsetcatcode(u,13)
        if trace_defining then
            report_defining("character %U (%s) is active in set %a",u,data[u].description,cct)
        end
    end
    tex.catcodetable = saved
end

--[[ldx--
<p>Setting the lccodes is also done in a loop over the data table.</p>
--ldx]]--

-- function characters.setcodes() -- we could loop over csletters
--     if trace_defining then
--         report_defining("defining lc and uc codes")
--     end
--     local traditional = sfstate == "traditional" or sfstate == "unset"
--     for code, chr in next, data do
--         local cc = chr.category
--         if is_letter[cc] then
--             local range = chr.range
--             if range then
--                 for i=range.first,range.last do
--                     texsetlccode(i,i,i) -- self self
--                 end
--             else
--                 local lc, uc = chr.lccode, chr.uccode
--                 if not lc then
--                     chr.lccode, lc = code, code
--                 elseif type(lc) == "table" then
--                     lc = code
--                 end
--                 if not uc then
--                     chr.uccode, uc = code, code
--                 elseif type(uc) == "table" then
--                     uc = code
--                 end
--                 texsetlccode(code,lc,uc)
--                 if traditional and cc == "lu" then
--                     texsetsfcode(code,999)
--                 end
--             end
--         elseif is_mark[cc] then
--             texsetlccode(code,code,code) -- for hyphenation
--         end
--     end
--     if traditional then
--         sfstate = "traditional"
--     end
-- end

-- tex

implement {
    name      = "chardescription",
    arguments = "integer",
    actions   = function(slot)
        local d = data[slot]
        if d then
            context(d.description)
        end
    end,
}

-- xml

characters.activeoffset = 0x10000 -- there will be remapped in that byte range

function commands.remapentity(chr,slot) -- not used
    contextsprint(format("{\\catcode%s=13\\xdef%s{\\string%s}}",slot,utfchar(slot),chr))
end

-- xml.entities = xml.entities or { }
--
-- storage.register("xml/entities",xml.entities,"xml.entities") -- this will move to lxml
--
-- function characters.setmkiventities()
--     local entities = xml.entities
--     entities.lt  = "<"
--     entities.amp = "&"
--     entities.gt  = ">"
-- end
--
-- function characters.setmkiientities()
--     local entities = xml.entities
--     entities.lt  = utfchar(characters.activeoffset + utfbyte("<"))
--     entities.amp = utfchar(characters.activeoffset + utfbyte("&"))
--     entities.gt  = utfchar(characters.activeoffset + utfbyte(">"))
-- end

implement { name = "setlettercatcodes", scope = "private", actions = characters.setlettercatcodes, arguments = "integer" }
implement { name = "setactivecatcodes", scope = "private", actions = characters.setactivecatcodes, arguments = "integer" }
--------- { name = "setcharactercodes", scope = "private", actions = characters.setcodes }

-- experiment (some can move to char-ini.lua)

local function overload(c,u,code,codes)
    local c = tonumber(c)
    if not c then
        return
    end
    local u = utilities.parsers.settings_to_array(u)
    local n = #u
    if n == 0 then
        return
    end
    local t = nil
    if n == 1 then
        t = tonumber(u[1])
    else
        t = { }
        for i=1,n do
            t[#t+1] = tonumber(u[i])
        end
    end
    if t then
        data[c][code] = t
        characters[codes][c] = nil
    end
end

interfaces.implement {
    name      = "overloaduppercase",
    arguments = "2 strings",
    actions   = function(c,u)
        overload(c,u,"uccode","uccodes")
    end
}

interfaces.implement {
    name      = "overloadlowercase",
    arguments = "2 strings",
    actions   = function(c,u)
        overload(c,u,"lccode","lccodes")
    end
}
