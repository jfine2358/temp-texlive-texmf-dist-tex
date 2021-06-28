#!/usr/bin/env texlua
--------------------------------------------------------------------------------
--         FILE:  rst_directives.lua
--        USAGE:  called by rst_parser.lua
--  DESCRIPTION:  Complement to the reStructuredText parser
--       AUTHOR:  Philipp Gesang (Phg), <megas.kapaneus@gmail.com>
--      CHANGED:  2011-08-28 13:47:00+0200
--------------------------------------------------------------------------------
--

local helpers = helpers or thirddata and thirddata.rst_helpers

--------------------------------------------------------------------------------
-- Directives for use with |substitutions|
--------------------------------------------------------------------------------

local rst_directives     = { }
thirddata.rst_directives = rst_directives
local rst_context        = thirddata.rst

local stringstrip = string.strip
local fmt         = string.format

rst_directives.anonymous = 0
rst_directives.images        = {}
rst_directives.images.done   = {}
rst_directives.images.values = {}


rst_directives.images.keys = {
    ["width"]   = "width",
    ["size"]    = "width",
    ["caption"] = "caption",
    ["alt"]     = "caption",
    ["scale"]   = "scale",
}

rst_directives.images.values.scale = function (orig)
    -- http://wiki.contextgarden.net/Reference/en/useexternalfigure
    -- scale=1000 is original size; to get 72%, use scale=720.
    return tonumber(orig) * 1000
end

rst_directives.images.values.width = {
    ["fit"]    = "\\hsize",
    ["hsize"]  = "\\hsize",
    ["broad"]  = "\\hsize",
    ["normal"] = "local",
    ["normal"] = "local",
}

-- we won't allow passing arbitrary setups to context
rst_directives.images.permitted_setups = {
    "width", "scale"
}

local function img_setup (properties)
    local result = ""
    for _, prop in next, rst_directives.images.permitted_setups do
        if properties[prop] then
            result = result .. prop .. "=" .. properties[prop] .. ","
        end
    end
    if result ~= "" then
        result = "[" .. result .. "]"
    end
    return result
end

rst_directives.image = function(name, data)
    local inline_parser = rst_context.inline_parser
    local properties = {}
    local anon = false
    local rd = rst_directives
    if not data then -- this makes the “name” argument optional
        data = name
        rd.anonymous = rd.anonymous + 1
        anon = true -- indicates a nameless picture
        name = "anonymous" .. rd.anonymous
    end
    properties.caption = name
    --properties.width = "\\local"

    local processed = "" -- stub; TODO do something useful with optional dimension specifications
    if type(data) == "table" then -- should always be true
        local p = helpers.patterns
        for _, str in ipairs(data) do
            local key, val
            key, val = p.colon_keyval:match(str)
            local rdi = rst_directives.images
            if key and val then
                key = rdi.keys[key] -- sanitize key expression
                if     type(rdi.values[key]) == "table" then
                    val = rdi.values[key][val]
                elseif type(rdi.values[key]) == "function" then
                    val = rdi.values[key](val)
                end
                properties[key] = val
            else
                processed = processed .. (str and str ~= "" and stringstrip(str))
            end
        end
    end
    properties.setup = img_setup(properties) or ""
    data = processed
    processed = nil
    local img = ""
    local images_done = rd.images.done
    if not anon then
        if not images_done[name] then
            img = img .. fmt([[

\useexternalfigure[%s][%s][]
]], name, data)
        images_done[name] = true
        end
        img = img .. fmt([[
\def\RSTsubstitution%s{%%
  \placefigure[here]{%s}{\externalfigure[%s]%s}
}
]], name, rst_context.escape(inline_parser:match(properties.caption)), name, properties.setup)
    else -- image won't be referenced but used instantly
        img = img .. fmt([[

\placefigure[here]{%s}{\externalfigure[%s]%s}
]], rst_context.escape(inline_parser:match(properties.caption)), data, properties.setup)
    end
    return img
end

rst_directives.caution = function(raw)
    local inline_parser = rst_context.inline_parser
    rst_context.addsetups("dbend")
    rst_context.addsetups("caution")
    local text 
    local first = true
    for _, line in ipairs(raw) do
        if not helpers.patterns.spacesonly:match(line) then
            if first then
                text =  line
                first = false
            else
                text = text .. " " .. line
            end
        end
    end
    text = rst_context.escape(helpers.string.wrapat(inline_parser:match(text))) 
    return fmt([[
\startRSTcaution
%s
\stopRSTcaution
]], text)
end

rst_directives.danger = function(raw)
    local inline_parser = rst_context.inline_parser
    rst_context.addsetups("dbend")
    rst_context.addsetups("danger")
    local text 
    local first = true
    for _, line in ipairs(raw) do
        if not helpers.patterns.spacesonly:match(line) then
            if first then
                text =  line
                first = false
            else
                text = text .. " " .. line
            end
        end
    end
    text = rst_context.escape(helpers.string.wrapat(inline_parser:match(text))) 
    return fmt([[
\startRSTdanger
%s
\stopRSTdanger
]], text)
end

-- http://docutils.sourceforge.net/docs/ref/rst/directives.html
rst_directives.DANGER = function(addendum)
    local result = ""
    for _,str in ipairs(addendum) do
        result = result .. (stringstrip(str))
    end
    return fmt([[

%% The Rabbit of Caerbannog
\startlinecorrection
\blank[force,big]
\framed[frame=on,
        corner=round,
        rulethickness=5pt,
        align=middle,
        width=\hsize,
        frameoffset=.5em,
        backgroundoffset=1em,
        background=color,
        backgroundcolor=red,
        foreground=color,
        foregroundcolor=black]{%%
  \language[en-gb]\tfb\bf
  Follow only if ye be men of valour, for the entrance to this cave is guarded
  by a creature so foul, so cruel that no man yet has fought with it and lived.
  Bones of full fifty men lie strewn about its lair. So, brave knights, if you
  do doubt your courage or your strength, come no further, for death awaits you
  all with nasty, big, pointy teeth.%%
  \blank[force,big]
  %s%%
}
\blank[force,big]
\stoplinecorrection
]], result)
end

rst_directives.mp = function(name, data)
    local mpcode = fmt([[
\startreusableMPgraphic{%s}
%s
\stopreusableMPgraphic
]], name, data)
    mpcode = mpcode .. fmt([[
\def\RSTsubstitution%s{%%
  \reuseMPgraphic{%s}%%
}
]], name, name)
    return mpcode
end

rst_directives.ctx = function(name, data)
    local ctx = fmt([[

\startbuffer[%s]
%s\stopbuffer
\def\RSTsubstitution%s{%%
  \getbuffer[%s]%%
}
]], name, data, name, name)
    return ctx
end

rst_directives.lua = function(name, data)
    local luacode = fmt([[

\startbuffer[%s]
\startluacode
%s
\stopluacode
\stopbuffer
\def\RSTsubstitution%s{%%
  \getbuffer[%s]%%
}
]], name, data, name, name)
    return luacode
end

--------------------------------------------------------------------------------
--- Experimental math directive
--------------------------------------------------------------------------------

rst_directives.math = function (name, data)
    data = data or name
    local formula
    if type(data) == "table" then
        local last, i = table.maxn(data), 1
        while i <= last do
            local line = stringstrip(data[i])
            if line and line ~= "" then
                formula = formula and formula .. " " .. line or line
            end
            i = i + 1
        end
    end
    return fmt([[
\startformula
%s
\stopformula
]], formula)
end

--------------------------------------------------------------------------------
--- End math directive
--------------------------------------------------------------------------------

rst_directives.replace = function(name, data)
    return fmt([[

\def\RSTsubstitution%s{%s}
]], name, data)
end

