-- 
--  This is file `attr.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-attr.dtx  (with options: `luamodule')
--  
--  See the aforementioned source file(s) for copyright and licensing information.
--  
--- locals
local copynode          = node.copy
local newnode           = node.new
local nodesubtype       = node.subtype
local nodetype          = node.id
local stringfind        = string.find
local stringformat      = string.format
local tableunpack       = unpack or table.unpack
local texiowrite_nl     = texio.write_nl
local texiowrite        = texio.write
--- luatex internal types
local whatsit_t         = nodetype"whatsit"
local user_defined_t    = nodesubtype"user_defined"
local unassociated      = "__unassociated"
luatexbase              = luatexbase or { }
local luatexbase        = luatexbase
local err, warning, info, log = luatexbase.provides_module({
    name          = "luatexbase-attr",
    version       = 0.6,
    date          = "2013/05/11",
    description   = "Attributes allocation for LuaTeX",
    author        = "Elie Roux, Manuel Pegourie-Gonnard and Philipp Gesang",
    copyright     = "Elie Roux, Manuel Pegourie-Gonnard and Philipp Gesang",
    license       = "CC0",
})
luatexbase.attributes   = luatexbase.attributes or { }
local attributes        = luatexbase.attributes
local new_attribute
local unset_attribute
local luatex_sty_counter = 'LuT@AllocAttribute'
if tex.count[luatex_sty_counter] then
  if tex.count[luatex_sty_counter] > -1 then
    error("luatexbase error: attribute 0 has already been set by \newattribute"
        .."macro from luatex.sty, not belonging to this package, this makes"
        .."luaotfload unusable. Please report to the maintainer of luatex.sty")
  else
    tex.count[luatex_sty_counter] = 0
  end
end
local last_alloc = 0
function new_attribute(name, silent)
    if last_alloc >= 65535 then
        if silent then
            return -1
        else
            error("No room for a new \\attribute", 1)
        end
    end
    local lsc = tex.count[luatex_sty_counter]
    if lsc and lsc > last_alloc then
      last_alloc = lsc
    end
    last_alloc = last_alloc + 1
    if lsc then
      tex.setcount('global', luatex_sty_counter, last_alloc)
    end
    attributes[name] = last_alloc
    unset_attribute(name)
    if not silent then
        log('luatexbase.attributes[%q] = %d', name, last_alloc)
    end
    return last_alloc
end
luatexbase.new_attribute = new_attribute
local unset_value = (luatexbase.luatexversion < 37) and -1 or -2147483647
function unset_attribute(name)
    tex.setattribute(attributes[name], unset_value)
end
luatexbase.unset_attribute = unset_attribute
luatexbase.get_unset_value = function () return unset_value end
--- cf. luatexref-t.pdf, sect. 8.1.4.25
local user_whatsits       = {    --- (package, (name, id hash)) hash
    __unassociated = { },        --- those without package name
}
local whatsit_ids         = { }  --- (id, (name * package)) hash
local whatsit_cap         = 2^53 --- Lua numbers are doubles
local current_whatsit     = 0
local anonymous_whatsits  = 0
local anonymous_prefix    = "anon"
--- string -> string -> int
local new_user_whatsit_id = function (name, package)
    if name then
        if not package then
            package = unassociated
        end
    else -- anonymous
        anonymous_whatsits = anonymous_whatsits + 1
        warning("defining anonymous user whatsit no. %d", anonymous_whatsits)
        warning("dear package authors, please name your whatsits!")
        package = unassociated
        name    = anonymous_prefix .. tostring(anonymous_whatsits)
    end

    local whatsitdata = user_whatsits[package]
    if not whatsitdata then
        whatsitdata             = { }
        user_whatsits[package]  = whatsitdata
    end

    local id = whatsitdata[name]
    if id then --- warning
        warning("replacing whatsit %s:%s (%d)", package, name, id)
    else --- new id
        current_whatsit     = current_whatsit + 1
        if current_whatsit >= whatsit_cap then
            warning("maximum of %d integral user whatsit ids reached",
                whatsit_cap)
            warning("further whatsit allocation may be inconsistent")
        end
        id                  = current_whatsit
        whatsitdata[name]   = id
        whatsit_ids[id]     = { name, package }
    end
    log("new user-defined whatsit %d (%s:%s)", id, package, name)
    return id
end
luatexbase.new_user_whatsit_id = new_user_whatsit_id
--- (string | node_t) -> string -> ((unit -> node_t) * int)
local new_user_whatsit = function (req, package)
    local id, whatsit
    if type(req) == "string" then
        id              = new_user_whatsit_id(req, package)
        whatsit         = newnode(whatsit_t, user_defined_t)
        whatsit.user_id = id
    elseif req.id == whatsit_t and req.subtype == user_defined_t then
        id      = req.user_id
        whatsit = copynode(req)
        if not whatsit_ids[id] then
            warning("whatsit id %d unregistered; "
                    .. "inconsistencies may arise", id)
        end
    end
    return function () return copynode(whatsit) end, id
end
luatexbase.new_user_whatsit         = new_user_whatsit
--- string -> string -> int
local get_user_whatsit_id = function (name, package)
    if not package then
        package = unassociated
    end
    return user_whatsits[package][name]
end
luatexbase.get_user_whatsit_id = get_user_whatsit_id
--- int | fun | node -> (string, string)
local get_user_whatsit_name = function (asked)
    local id
    if type(asked) == "number" then
        id = asked
    elseif type(asked) == "function" then
        --- node generator
        local n = asked()
        id = n.user_id
    else --- node
        id = asked.user_id
    end
    local metadata = whatsit_ids[id]
    if not metadata then -- unknown
        warning("whatsit id %d unregistered; inconsistencies may arise", id)
        return "", ""
    end
    return tableunpack(metadata)
end
luatexbase.get_user_whatsit_name = get_user_whatsit_name
--- string -> unit
local dump_registered_whatsits = function (asked_package)
    local whatsit_list = { }
    if asked_package then
        local whatsitdata = user_whatsits[asked_package]
        if not whatsitdata then
            error("(no user whatsits registered for package %s)",
                  asked_package)
            return
        end
        texiowrite_nl("(user whatsit allocation stats for " .. asked_package)
        for name, id in next, whatsitdata do
            whatsit_list[#whatsit_list+1] =
                stringformat("(%s:%s %d)", asked_package, name, id)
        end
    else
        texiowrite_nl("(user whatsit allocation stats")
        texiowrite_nl(stringformat(" ((total %d)\n  (anonymous %d))",
            current_whatsit, anonymous_whatsits))
        for package, whatsitdata in next, user_whatsits do
            for name, id in next, whatsitdata do
                whatsit_list[#whatsit_list+1] =
                    stringformat("(%s:%s %d)", package, name, id)
            end
        end
    end

    texiowrite_nl" ("
    --- in an attempt to be clever the texio.write* functions
    --- mess up line breaking, so concatenation is unusable ...
    local first = true
    for i=1, #whatsit_list do
        if first then
            first = false
        else -- indent
            texiowrite_nl"  "
        end
        texiowrite(whatsit_list[i])
    end
    texiowrite"))\n"
end
luatexbase.dump_registered_whatsits = dump_registered_whatsits
luatexbase.newattribute            = new_attribute
luatexbase.newuserwhatsit          = new_user_whatsit
luatexbase.newuserwhatsitid        = new_user_whatsit_id
luatexbase.getuserwhatsitid        = get_user_whatsit_id
luatexbase.getuserwhatsitname      = get_user_whatsit_name
luatexbase.dumpregisteredwhatsits  = dump_registered_whatsits
-- 
--  End of File `attr.lua'.
