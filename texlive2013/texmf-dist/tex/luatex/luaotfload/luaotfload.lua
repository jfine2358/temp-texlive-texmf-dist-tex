-- 
--  This is file `luaotfload.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luaotfload.dtx  (with options: `lua')
--  This is a generated file.
--  
--  Copyright (C) 2009-2013
--       by  Elie Roux      <elie.roux@telecom-bretagne.eu>
--       and Khaled Hosny   <khaledhosny@eglug.org>
--       and Philipp Gesang <philipp.gesang@alumni.uni-heidelberg.de>
--  
--       Home:      https://github.com/lualatex/luaotfload
--       Support:   <lualatex-dev@tug.org>.
--  
--  This work is under the GPL v2.0 license.
--  
--  This work consists of the main source file luaotfload.dtx
--  and the derived files
--      luaotfload.sty, luaotfload.lua
--  
luaotfload                  = luaotfload or {}
local luaotfload            = luaotfload

config                            = config or { }
config.luaotfload                 = config.luaotfload or { }
------.luaotfload.resolver        = config.luaotfload.resolver         or "normal"
config.luaotfload.resolver        = config.luaotfload.resolver         or "cached"
config.luaotfload.definer         = config.luaotfload.definer          or "patch"
config.luaotfload.compatibility   = config.luaotfload.compatibility    or false
config.luaotfload.loglevel        = config.luaotfload.loglevel  or 1
config.luaotfload.color_callback  = config.luaotfload.color_callback   or "pre_linebreak_filter"
--luaotfload.prefer_merge     = config.luaotfload.prefer_merge or true

luaotfload.module = {
    name          = "luaotfload",
    version       = 2.2,
    date          = "2013/05/23",
    description   = "OpenType layout system.",
    author        = "Elie Roux & Hans Hagen",
    copyright     = "Elie Roux",
    license       = "GPL v2.0"
}

local luatexbase       = luatexbase

local setmetatable     = setmetatable
local type, next       = type, next

local kpsefind_file    = kpse.find_file
local lfsisfile        = lfs.isfile

local add_to_callback, create_callback =
      luatexbase.add_to_callback, luatexbase.create_callback
local reset_callback, call_callback =
      luatexbase.reset_callback, luatexbase.call_callback

local dummy_function = function () end

local error, warning, info, log =
    luatexbase.provides_module(luaotfload.module)

luaotfload.error        = error
luaotfload.warning      = warning
luaotfload.info         = info
luaotfload.log          = log


local luatex_version = 76

if tex.luatexversion < luatex_version then
    warning("LuaTeX v%.2f is old, v%.2f is recommended.",
             tex.luatexversion/100,
             luatex_version   /100)
    --- we install a fallback for older versions as a safety
    if not node.end_of_math then
        local math_t          = node.id"math"
        local traverse_nodes  = node.traverse_id
        node.end_of_math = function (n)
            for n in traverse_nodes(math_t, n.next) do
                return n
            end
        end
    end
end


local fl_prefix = "luaotfload" -- “luatex” for luatex-plain
local loadmodule = function (name)
    require(fl_prefix .."-"..name)
end

local Cs, P, lpegmatch = lpeg.Cs, lpeg.P, lpeg.match

local p_dot, p_slash = P".",  P"/"
local p_suffix       = (p_dot * (1 - p_dot - p_slash)^1 * P(-1)) / ""
local p_removesuffix = Cs((p_suffix + 1)^1)

local find_vf_file = function (name)
    local fullname = kpsefind_file(name, "ovf")
    if not fullname then
        --fullname = kpsefind_file(file.removesuffix(name), "ovf")
        fullname = kpsefind_file(lpegmatch(p_removesuffix, name), "ovf")
    end
    if fullname then
        log("loading virtual font file %s.", fullname)
    end
    return fullname
end


local starttime = os.gettimeofday()

local trapped_register  = callback.register
callback.register       = dummy_function


do
    local new_attribute    = luatexbase.new_attribute
    local the_attributes   = luatexbase.attributes

    attributes = attributes or { }

    attributes.private = function (name)
        local attr   = "luaotfload@" .. name --- used to be: “otfl@”
        local number = the_attributes[attr]
        if not number then
            number = new_attribute(attr)
        end
        return number
    end
end


local context_environment = { }

local push_namespaces = function ()
    log("push namespace for font loader")
    local normalglobal = { }
    for k, v in next, _G do
        normalglobal[k] = v
    end
    return normalglobal
end

local pop_namespaces = function (normalglobal, isolate)
    if normalglobal then
        local _G = _G
        local mode = "non-destructive"
        if isolate then mode = "destructive" end
        log("pop namespace from font loader -- " .. mode)
        for k, v in next, _G do
            if not normalglobal[k] then
                context_environment[k] = v
                if isolate then
                    _G[k] = nil
                end
            end
        end
        for k, v in next, normalglobal do
            _G[k] = v
        end
        -- just to be sure:
        setmetatable(context_environment,_G)
    else
        log("irrecoverable error during pop_namespace: no globals to restore")
        os.exit()
    end
end

luaotfload.context_environment  = context_environment
luaotfload.push_namespaces      = push_namespaces
luaotfload.pop_namespaces       = pop_namespaces

local our_environment = push_namespaces()


tex.attribute[0] = 0


loadmodule"merged.lua"
---loadmodule"font-odv.lua" --- <= Devanagari support from Context

if fonts then

    if not fonts._merge_loaded_message_done_ then
        --- a program talking first person -- HH sure believes in strong AI ...
        log[[“I am using the merged version of 'luaotfload.lua' here. If]]
        log[[ you run into problems or experience unexpected behaviour,]]
        log[[ and if you have ConTeXt installed you can try to delete the]]
        log[[ file 'luaotfload-font-merged.lua' as I might then use the]]
        log[[ possibly updated libraries. The merged version is not]]
        log[[ supported as it is a frozen instance. Problems can be]]
        log[[ reported to the ConTeXt mailing list.”]]
    end
    fonts._merge_loaded_message_done_ = true

else--- the loading sequence is known to change, so this might have to
    --- be updated with future updates!
    --- do not modify it though unless there is a change to the merged
    --- package!
    loadmodule("l-lua.lua")
    loadmodule("l-lpeg.lua")
    loadmodule("l-function.lua")
    loadmodule("l-string.lua")
    loadmodule("l-table.lua")
    loadmodule("l-io.lua")
    loadmodule("l-file.lua")
    loadmodule("l-boolean.lua")
    loadmodule("l-math.lua")
    loadmodule("util-str.lua")
    loadmodule('luatex-basics-gen.lua')
    loadmodule('data-con.lua')
    loadmodule('luatex-basics-nod.lua')
    loadmodule('font-ini.lua')
    loadmodule('font-con.lua')
    loadmodule('luatex-fonts-enc.lua')
    loadmodule('font-cid.lua')
    loadmodule('font-map.lua')
    loadmodule('luatex-fonts-syn.lua')
    loadmodule('luatex-fonts-tfm.lua')
    loadmodule('font-oti.lua')
    loadmodule('font-otf.lua')
    loadmodule('font-otb.lua')
    loadmodule('node-inj.lua')
    loadmodule('font-ota.lua')
    loadmodule('font-otn.lua')
    loadmodule('font-otp.lua')--- since 2013-04-23
    loadmodule('luatex-fonts-lua.lua')
    loadmodule('font-def.lua')
    loadmodule('luatex-fonts-def.lua')
    loadmodule('luatex-fonts-ext.lua')
    loadmodule('luatex-fonts-cbk.lua')
end --- non-merge fallback scope


pop_namespaces(our_environment, false)-- true)

log("fontloader loaded in %0.3f seconds", os.gettimeofday()-starttime)


if normal_expand_path ~= nil then
    kpse.expand_path = normal_expand_path
    phantom_kpse     = nil
end


callback.register = trapped_register


add_to_callback("pre_linebreak_filter",
                nodes.simple_font_handler,
                "luaotfload.node_processor",
                1)
add_to_callback("hpack_filter",
                nodes.simple_font_handler,
                "luaotfload.node_processor",
                1)
add_to_callback("find_vf_file",
                find_vf_file, "luaotfload.find_vf_file")

loadmodule"lib-dir.lua"    --- required by luaofload-database.lua
loadmodule"override.lua"   --- “luat-ovr”

logs.set_loglevel(config.luaotfload.loglevel)

loadmodule"loaders.lua"    --- “font-pfb” new in 2.0, added 2011
loadmodule"database.lua"   --- “font-nms”
loadmodule"colors.lua"     --- “font-clr”


local request_resolvers   = fonts.definers.resolvers
local formats             = fonts.formats
formats.ofm               = "type1"


local resolvefile = fonts.names.crude_file_lookup
--local resolvefile = fonts.names.crude_file_lookup_verbose

function request_resolvers.file(specification)
    local name    = resolvefile(specification.name)
    local suffix  = file.suffix(name)
    if formats[suffix] then
        specification.forced  = suffix
        specification.name    = file.removesuffix(name)
    else
        specification.name = name
    end
end


--request_resolvers.anon = request_resolvers.name


local type1_formats = { "tfm", "ofm", }

request_resolvers.anon = function (specification)
    local name = specification.name
    for i=1, #type1_formats do
        local format = type1_formats[i]
        if resolvers.findfile(name, format) then
            specification.name = file.addsuffix(name, format)
            return
        end
    end
    --- under some weird circumstances absolute paths get
    --- passed to the definer; we have to catch them
    --- before the name: resolver misinterprets them.
    name = specification.specification
    local exists, _ = lfsisfile(name)
    if exists then --- garbage; we do this because we are nice,
                   --- not because it is correct
        logs.names_report("log", 1, "load", "file “%s” exists", name)
        logs.names_report("log", 1, "load",
          "... overriding borked anon: lookup with path: lookup")
        specification.name = name
        request_resolvers.path(specification)
        return
    end
    request_resolvers.name(specification)
end


request_resolvers.path = function (specification)
    local name       = specification.name
    local exists, _  = lfsisfile(name)
    if not exists then -- resort to file: lookup
        logs.names_report("log", 1, "load",
          "path lookup of “%s” unsuccessful, falling back to file:",
          name)
        request_resolvers.file(specification)
    else
      local suffix = file.suffix(name)
      if formats[suffix] then
        specification.forced  = suffix
        specification.name    = file.removesuffix(name)
      else
        specification.name = name
      end
    end
end


create_callback("luaotfload.patch_font", "simple", dummy_function)


local read_font_file = fonts.definers.read

--- spec -> size -> id -> tmfdata
local patch_defined_font = function (specification, size, id)
    local tfmdata = read_font_file(specification, size, id)
    if type(tfmdata) == "table" and tfmdata.shared then
        --- We need to test for the “shared” field here
        --- or else the fontspec capheight callback will
        --- operate on tfm fonts.
        call_callback("luaotfload.patch_font", tfmdata)
    end
    return tfmdata
end

reset_callback("define_font")


local font_definer = config.luaotfload.definer

if font_definer == "generic"  then
  add_to_callback("define_font",
                  fonts.definers.read,
                  "luaotfload.define_font",
                  1)
elseif font_definer == "patch"  then
  add_to_callback("define_font",
                  patch_defined_font,
                  "luaotfload.define_font",
                  1)
end

loadmodule"features.lua"    --- contains what was “font-ltx” and “font-otc”
loadmodule"extralibs.lua"   --- load additional Context libraries
loadmodule"auxiliary.lua"   --- additionaly high-level functionality (new)

-- vim:tw=71:sw=4:ts=4:expandtab

-- 
--  End of File `luaotfload.lua'.
