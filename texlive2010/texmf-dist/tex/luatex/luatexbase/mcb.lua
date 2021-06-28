-- 
--  This is file `mcb.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-mcb.dtx  (with options: `lua')
--  
--  Copyright (C) 2009 by Elie Roux <elie.roux@telecom-bretagne.eu>
--  
--  This work is under the CC0 license.
--  See source file 'luatexbase-mcb.dtx' for details.
--  
module('luatexbase', package.seeall)
luatexbase.provides_module({
    name          = "luamcallbacks",
    version       = 0.2,
    date          = "2010/05/12",
    description   = "register several functions in a callback",
    author        = "Hans Hagen, Elie Roux and Manuel P^^c3^^a9gourie-Gonnard",
    copyright     = "Hans Hagen, Elie Roux and Manuel P^^c3^^a9gourie-Gonnard",
    license       = "CC0",
})
local log = log or function(...)
  luatexbase.module_log('luamcallbacks', string.format(...))
end
local info = info or function(...)
  luatexbase.module_info('luamcallbacks', string.format(...))
end
local warning = warning or function(...)
  luatexbase.module_warning('luamcallbacks', string.format(...))
end
local err = err or function(...)
  luatexbase.module_error('luamcallbacks', string.format(...))
end
local callbacklist = callbacklist or { }
local lua_callbacks_defaults = { }
local list = 1
local data = 2
local first = 3
local simple = 4
local callbacktypes = callbacktypes or {
  buildpage_filter = simple,
  token_filter = first,
  pre_output_filter = list,
  hpack_filter = list,
  process_input_buffer = data,
  mlist_to_hlist = list,
  vpack_filter = list,
  define_font = first,
  open_read_file = first,
  linebreak_filter = list,
  post_linebreak_filter = list,
  pre_linebreak_filter = list,
  start_page_number = simple,
  stop_page_number = simple,
  start_run = simple,
  show_error_hook = simple,
  stop_run = simple,
  hyphenate = simple,
  ligaturing = simple,
  kerning = data,
  find_write_file = first,
  find_read_file = first,
  find_vf_file = data,
  find_map_file = data,
  find_format_file = data,
  find_opentype_file = data,
  find_output_file = data,
  find_truetype_file = data,
  find_type1_file = data,
  find_data_file = data,
  find_pk_file = data,
  find_font_file = data,
  find_image_file = data,
  find_ocp_file = data,
  find_sfd_file = data,
  find_enc_file = data,
  read_sfd_file = first,
  read_map_file = first,
  read_pk_file = first,
  read_enc_file = first,
  read_vf_file = first,
  read_ocp_file = first,
  read_opentype_file = first,
  read_truetype_file = first,
  read_font_file = first,
  read_type1_file = first,
  read_data_file = first,
}
if luatexbase.luatexversion > 42 then
    callbacktypes["process_output_buffer"] = data
end
local internalregister = internalregister or callback.register
local function str_to_type(str)
    if str == 'list' then
        return list
    elseif str == 'data' then
        return data
    elseif str == 'first' then
        return first
    elseif str == 'simple' then
        return simple
    else
        return nil
    end
end
-- local
function listhandler (name)
    return function(head,...)
        local l = callbacklist[name]
        if l then
            local done = true
            for _, f in ipairs(l) do
                -- the returned value is either true or a new head plus true
                rtv1, rtv2 = f.func(head,...)
                if type(rtv1) == 'boolean' then
                    done = rtv1
                elseif type (rtv1) == 'userdata' then
                    head = rtv1
                end
                if type(rtv2) == 'boolean'  then
                    done = rtv2
                elseif type(rtv2) == 'userdata' then
                    head = rtv2
                end
                if done == false then
                    err("function \"%s\" returned false in callback '%s'",
                      f.description, name)
                end
            end
            return head, done
        else
            return head, false
        end
    end
end
local function datahandler (name)
    return function(data,...)
        local l = callbacklist[name]
        if l then
            for _, f in ipairs(l) do
                data = f.func(data,...)
            end
        end
        return data
    end
end
local function firsthandler (name)
    return function(...)
        local l = callbacklist[name]
        if l then
            local f = l[1].func
            return f(...)
        else
            return nil, false
        end
    end
end
local function simplehandler (name)
    return function(...)
        local l = callbacklist[name]
        if l then
            for _, f in ipairs(l) do
                f.func(...)
            end
        end
    end
end
function add_to_callback (name,func,description,priority)
    if type(func) ~= "function" then
        err("unable to add function, no proper function passed")
        return
    end
    if not name or name == "" then
        err("unable to add function, no proper callback name passed")
        return
    elseif not callbacktypes[name] then
        err("unable to add function, '%s' is not a valid callback", name)
        return
    end
    if not description or description == "" then
        err("unable to add function to '%s', no proper description passed",
          name)
        return
    end
    if priority_in_callback(name, description) ~= 0 then
        warning("function '%s' already registered in callback '%s'",
          description, name)
    end
    local l = callbacklist[name]
    if not l then
        l = {}
        callbacklist[name] = l
        if not lua_callbacks_defaults[name] then
            if callbacktypes[name] == list then
                internalregister(name, listhandler(name))
            elseif callbacktypes[name] == data then
                internalregister(name, datahandler(name))
            elseif callbacktypes[name] == simple then
                internalregister(name, simplehandler(name))
            elseif callbacktypes[name] == first then
                internalregister(name, firsthandler(name))
            else
                err("unknown callback type")
            end
        end
    end
    local f = {
        func = func,
        description = description,
    }
    priority = tonumber(priority)
    if not priority or priority > #l then
        priority = #l+1
    elseif priority < 1 then
        priority = 1
    end
    if callbacktypes[name] == first and (priority ~= 1 or #l ~= 0) then
        warning("several callbacks registered in callback '%s', "
        .."only the first function will be active.", name)
    end
    table.insert(l,priority,f)
    log("inserting function '%s' at position %s in callback list for '%s'",
      description, priority, name)
end
function remove_from_callback (name, description)
    if not name or name == "" then
        err("unable to remove function, no proper callback name passed")
        return
    elseif not callbacktypes[name] then
        err("unable to remove function, '%s' is not a valid callback", name)
        return
    end
    if not description or description == "" then
        err(
          "unable to remove function from '%s', no proper description passed",
          name)
        return
    end
    local l = callbacklist[name]
    if not l then
        err("no callback list for '%s'",name)
        return
    end
    for k,v in ipairs(l) do
        if v.description == description then
            table.remove(l,k)
            log("removing function '%s' from '%s'",description,name)
            if not next(l) then
              callbacklist[name] = nil
              if not lua_callbacks_defaults[name] then
                internalregister(name, nil)
              end
            end
            return
        end
    end
    warning("unable to remove function '%s' from '%s'",description,name)
end
function reset_callback (name)
    if not name or name == "" then
        err("unable to reset, no proper callback name passed")
        return
    elseif not callbacktypes[name] then
        err("reset error, '%s' is not a valid callback", name)
        return
    end
    if not lua_callbacks_defaults[name] then
        internalregister(name, nil)
    end
    local l = callbacklist[name]
    if l then
        log("resetting callback list '%s'",name)
        callbacklist[name] = nil
    end
end
function create_callback(name, ctype, default)
    if not name then
        err("unable to call callback, no proper name passed", name)
        return nil
    end
    if not ctype or not default then
        err("unable to create callback '%s': "
        .."callbacktype or default function not specified", name)
        return nil
    end
    if callbacktypes[name] then
        err("unable to create callback '%s', callback already exists", name)
        return nil
    end
    local temp = str_to_type(ctype)
    if not temp then
        err("unable to create callback '%s', type '%s' undefined", name, ctype)
        return nil
    end
    ctype = temp
    lua_callbacks_defaults[name] = default
    callbacktypes[name] = ctype
end
function call_callback(name, ...)
    if not name then
        err("unable to call callback, no proper name passed", name)
        return nil
    end
    if not lua_callbacks_defaults[name] then
        err("unable to call lua callback '%s', unknown callback", name)
        return nil
    end
    local l = callbacklist[name]
    local f
    if not l then
        f = lua_callbacks_defaults[name]
    else
        if callbacktypes[name] == list then
            f = listhandler(name)
        elseif callbacktypes[name] == data then
            f = datahandler(name)
        elseif callbacktypes[name] == simple then
            f = simplehandler(name)
        elseif callbacktypes[name] == first then
            f = firsthandler(name)
        else
            err("unknown callback type")
        end
    end
    return f(...)
end
function priority_in_callback (name, description)
    if not name or name == ""
            or not callbacktypes[name]
            or not description then
        return 0
    end
    local l = callbacklist[name]
    if not l then return 0 end
    for p, f in pairs(l) do
        if f.description == description then
            return p
        end
    end
    return 0
end
callback.register = function ()
err("function callback.register has been deleted by luamcallbacks, "
.."please use callback.add instead.")
end
-- 
--  End of File `mcb.lua'.
