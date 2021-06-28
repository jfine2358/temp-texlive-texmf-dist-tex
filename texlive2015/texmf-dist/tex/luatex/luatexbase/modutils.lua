-- 
--  This is file `modutils.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-modutils.dtx  (with options: `luamodule')
--  
--  See the aforementioned source file(s) for copyright and licensing information.
--  
luatexbase          = luatexbase or { }
local luatexbase    = luatexbase
local string_gsub   = string.gsub
local modules = modules or {}
local function date_to_int(date)
    if date == '' then return -1 end
    local numbers = string_gsub(date, "(%d+)/(%d+)/(%d+)", "%1%2%3")
    return tonumber(numbers)
end
local function msg_format(msg_type, mod_name, ...)
  local cont = '('..mod_name..')' .. ('Module: '..msg_type):gsub('.', ' ')
  return 'Module '..mod_name..' '..msg_type..': '
    .. string.format(...):gsub('\n', '\n'..cont) .. '\n'
end
local function module_error_int(mod, ...)
  error(msg_format('error', mod, ...), 3)
end
local function module_error(mod, ...)
  module_error_int(mod, ...)
end
luatexbase.module_error = module_error
local function module_warning(mod, ...)
  for _, line in ipairs(msg_format('warning', mod, ...):explode('\n')) do
    texio.write_nl(line)
  end
end
luatexbase.module_warning = module_warning
local function module_info(mod, ...)
  for _, line in ipairs(msg_format('info', mod, ...):explode('\n')) do
    texio.write_nl(line)
  end
end
luatexbase.module_info = module_info
local function module_log(mod, msg, ...)
  texio.write_nl('log', mod..': '..msg:format(...))
end
luatexbase.module_log = module_log
local function errwarinf(name)
  return function(...) module_error_int(name, ...) end,
    function(...) module_warning(name, ...) end,
    function(...) module_info(name, ...) end,
    function(...) module_log(name, ...) end
end
luatexbase.errwarinf = errwarinf
local err, warn = errwarinf('luatexbase.modutils')
local function require_module(name, req_date)
    require(name)
    local info = modules[name]
    if not info then
        warn("module '%s' was not properly identified", name)
    elseif req_date and info.date then
        if date_to_int(info.date) < date_to_int(req_date) then
            warn("module '%s' required in version '%s'\n"
            .. "but found in version '%s'", name, req_date, info.date)
        end
    end
end
luatexbase.require_module = require_module
local function provides_module(info)
    if not (info and info.name) then
        err('provides_module: missing information')
    end
    texio.write_nl('log', string.format("Lua module: %s %s %s %s\n",
    info.name, info.date or '', info.version or '', info.description or ''))
    modules[info.name] = info
    return errwarinf(info.name)
end
luatexbase.provides_module = provides_module
local fastcopy
fastcopy = table.fastcopy or function(old)
    if old then
        local new = { }
        for k,v in next, old do
            if type(v) == "table" then
                new[k] = fastcopy(v)
            else
                new[k] = v
            end
        end
        local mt = getmetatable(old)
        if mt then
            setmetatable(new,mt)
        end
        return new
    else
        return { }
    end
end
local function get_module_info(name)
    local module_table = modules[name]
    if not module_table then
      return nil
    else
      return fastcopy(module_table)
    end
end
luatexbase.get_module_info = get_module_info
function get_module_version(name)
    local module_table = modules[name]
    if not module_table then
      return nil
    else
      return module_table.version
    end
end
luatexbase.get_module_version = get_module_version
function get_module_date(name)
    local module_table = modules[name]
    if not module_table then
      return nil
    else
      return module_table.date
    end
end
luatexbase.get_module_date = get_module_date
function get_module_date_int(name)
    local module_table = modules[name]
    if not module_table then
      return nil
    else
      return module_table.date and date_to_int(module_table.date)
    end
end
luatexbase.get_module_date_int = get_module_date_int
function is_module_loaded(name)
    if modules[name] then
        return true
    else
        return false
    end
end
luatexbase.is_module_loaded = is_module_loaded
provides_module({
  name        = 'luatexbase-modutils',
  date        = '2013/05/11',
  version     = 0.6,
  description = 'Module utilities for LuaTeX',
})
-- 
--  End of File `modutils.lua'.
