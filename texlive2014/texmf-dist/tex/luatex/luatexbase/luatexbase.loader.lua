-- 
--  This is file `luatexbase.loader.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-loader.dtx  (with options: `luamodule')
--  
--  See the aforementioned source file(s) for copyright and licensing information.
--  
luatexbase          = luatexbase or { }
local luatexbase    = luatexbase
kpse.set_program_name("luatex")
local print_included_path = false
if token then
  print_included_path = true
end
local lua_suffixes = {
  ".luc", ".luctex", ".texluc", ".lua", ".luatex", ".texlua",
}
local function ends_with(suffix, name)
    return name:sub(-suffix:len()) == suffix
end
local function basename(name)
  for _, suffix in ipairs(lua_suffixes) do
    if ends_with(suffix, name) then
      return name:sub(1, -(suffix:len()+1))
    end
  end
  return name
end
local function find_module_file(mod)
  local compat = basename(mod):gsub('%.', '/')
  return kpse.find_file(compat, 'lua') or kpse.find_file(mod, 'lua')
end
local package_loader_two
if not package.searchers then
  package.searchers = package.loaders
end
package_loader_two = package.searchers[2]
local function load_module(mod)
  local file = find_module_file(mod)
  if not file then
    local msg = "\n\t[luatexbase.loader] Search failed"
    local ret = package_loader_two(mod)
    if type(ret) == 'string' then
      return msg..ret
    elseif type(ret) == 'nil' then
      return msg
    else
      return ret
    end
  end
  local loader, error = loadfile(file)
  if not loader then
    return "\n\t[luatexbase.loader] Loading error:\n\t"..error
  end
  if print_included_path then
    texio.write_nl("("..file..")")
  end
  return loader
end
package.searchers[2] = load_module
-- 
--  End of File `luatexbase.loader.lua'.
