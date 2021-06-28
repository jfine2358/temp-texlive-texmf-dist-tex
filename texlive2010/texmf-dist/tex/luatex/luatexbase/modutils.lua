-- 
--  This is file `modutils.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-modutils.dtx  (with options: `luamodule')
--  
--  Written in 2009, 2010 by Manuel Pegourie-Gonnard and Elie Roux.
--  
--  This work is under the CC0 license.
--  See source file 'luatexbase-modutils.dtx' for details.
--  
module("luatexbase", package.seeall)
local modules = modules or {}
local requiredversions = {}
local function datetonumber(date)
    numbers = string.gsub(date, "(%d+)/(%d+)/(%d+)", "%1%2%3")
    return tonumber(numbers)
end
local function isdate(date)
    for _, _ in string.gmatch(date, "%d+/%d+/%d+") do
        return true
    end
    return false
end
local date, number = 1, 2
local function parse_version(version)
    if isdate(version) then
        return {type = date, version = datetonumber(version), orig = version}
    else
        return {type = number, version = tonumber(version), orig = version}
    end
end
local function module_error_int(mod, ...)
  error('Module '..mod..' error: '..string.format(...), 3)
end
function module_error(mod, ...)
  module_error_int(mod, ...)
end
function module_warning(mod, ...)
  texio.write_nl("Module "..mod.." warning: "..string.format(...))
end
function module_info(mod, ...)
  texio.write_nl(mod..": "..string.format(...))
end
function module_log(mod, ...)
  texio.write_nl('log', mod..": "..string.format(...))
end
function module_term(mod, ...)
  texio.write_nl('term', mod..": "..string.format(...))
end
local function err(...) module_error_int('luatexbase.modutils', ...) end
local function warn(...) module_warning('luatexbase.modutils', ...) end
function use_module(name)
    require(name)
    if not modules[name] then
        warn("Module didn't properly identified itself: %s", name)
    end
end
function require_module(name, version)
    if not version then
        return use_module(name)
    end
    luaversion = parse_version(version)
    if modules[name] then
        if luaversion.type == date then
            if datetonumber(modules[name].date) < luaversion.version then
                err("found module `%s' loaded in version %s, "
                .."but version %s was required",
                name, modules[name].date, version)
            end
        else
            if modules[name].version < luaversion.version then
                err("found module `%s' loaded in version %.02f, "
                .."but version %s was required",
                name, modules[name].version, version)
            end
        end
    else
        requiredversions[name] = luaversion
        use_module(name)
    end
end
function provides_module(mod)
    if not mod then
        err('cannot provide nil module')
        return
    end
    if not mod.version or not mod.name or not mod.date
    or not mod.description then
        err("invalid module registered: "
        .."fields name, version, date and description are mandatory")
        return
    end
    requiredversion = requiredversions[mod.name]
    if requiredversion then
        if requiredversion.type == date
        and requiredversion.version > datetonumber(mod.date) then
            err("loading module %s in version %s, "
            .."but version %s was required",
            mod.name, mod.date, requiredversion.orig)
        elseif requiredversion.type == number
        and requiredversion.version > mod.version then
            err("loading module %s in version %.02f, "
            .."but version %s was required",
            mod.name, mod.version, requiredversion.orig)
        end
    end
    modules[mod.name] = mod
    texio.write_nl('log', string.format("Lua module: %s %s v%.02f %s\n",
    mod.name, mod.date, mod.version, mod.description))
end
-- 
--  End of File `modutils.lua'.
