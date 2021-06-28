--
-- This is file `lua-ul.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- lua-ul.dtx  (with options: `luacode')
-- 
-- Copyright (C) 2020 by Marcel Krueger
--
-- This file may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either
-- version 1.3c of this license or (at your option) any later
-- version. The latest version of this license is in:
--
-- http://www.latex-project.org/lppl.txt
--
-- and version 1.3 or later is part of all distributions of
-- LaTeX version 2005/12/01 or later.
local hlist_t = node.id'hlist'
local vlist_t = node.id'vlist'
local kern_t = node.id'kern'
local glue_t = node.id'glue'

local char_given = token.command_id'char_given'

local underlineattrs = {}
local underline_types = {}
local saved_values = {}
local function new_underline_type()
  for i=1,#underlineattrs do
    local attr = underlineattrs[i]
    saved_values[i] = tex.attribute[attr]
    tex.attribute[attr] = -0x7FFFFFFF
  end
  local b = token.scan_list()
  for i=1,#underlineattrs do
    tex.attribute[underlineattrs[i]] = saved_values[i]
  end
  local lead = b.head
  if not lead.leader then
    tex.error("Leader required", {"An underline type has to \z
      be defined by leader. You should use one of the", "commands \z
      \\leaders, \\cleaders, or \\xleader, or \\gleaders here."})
  else
    if lead.next then
    tex.error("Too many nodes", {"An underline type can only be \z
        defined by a single leaders specification,", "not by \z
        multiple nodes. Maybe you supplied an additional glue?",
        "Anyway, the additional nodes will be ignored"})
    end
    table.insert(underline_types, lead)
    b.head = lead.next
    node.flush_node(b)
  end
  token.put_next(token.new(#underline_types, char_given))
end
local function set_underline()
  local j
  for i=1,#underlineattrs do
    local attr = underlineattrs[i]
    if tex.attribute[attr] == -0x7FFFFFFF then
      j = attr
      break
    end
  end
  if not j then
    j = luatexbase.new_attribute(
        "luaul" .. tostring(#underlineattrs+1))
    underlineattrs[#underlineattrs+1] = j
  end
  tex.attribute[j] = token.scan_int()
end
local function reset_underline()
  local reset_all = token.scan_keyword'*'
  local j
  for i=1,#underlineattrs do
    local attr = underlineattrs[i]
    if tex.attribute[attr] ~= -0x7FFFFFFF then
      if reset_all then
        tex.attribute[attr] = -0x7FFFFFFF
      else
        j = attr
      end
    end
  end
  if not j then
    if not reset_all then
      tex.error("No underline active", {"You tried to disable \z
            underlining but underlining was not active",
            "in the first place. Maybe you wanted to ensure that \z
            no underling can be active anymore?", "Then you should \z
            append a *."})
    end
    return
  end
  tex.attribute[j] = -0x7FFFFFFF
end
local functions = lua.get_functions_table()
local set_lua = token.set_lua
local new_underline_type_func =
    luatexbase.new_luafunction"luaul.new_underline_type"
local set_underline_func =
    luatexbase.new_luafunction"luaul.set_underline_func"
local reset_underline_func =
    luatexbase.new_luafunction"luaul.reset_underline_func"
set_lua("LuaULNewUnderlineType", new_underline_type_func)
set_lua("LuaULSetUnderline", set_underline_func, "protected")
set_lua("LuaULResetUnderline", reset_underline_func, "protected")
functions[new_underline_type_func] = new_underline_type
functions[set_underline_func] = set_underline
functions[reset_underline_func] = reset_underline

local add_underline_h
local function add_underline_v(head, attr)
  for n in node.traverse(head) do
    if head.id == hlist_t then
      add_underline_h(n, attr)
    elseif head.id == vlist_t then
      add_underline_v(n.head, attr)
    end
  end
end
function add_underline_h(head, attr)
  local used = false
  node.slide(head.head)
  local last_value
  local first
  for n in node.traverse(head.head) do
    local new_value = node.has_attribute(n, attr)
    if n.id == hlist_t then
      new_value = nil
      add_underline_h(n, attr)
    elseif n.id == vlist_t then
      new_value = nil
      add_underline_v(n.head, attr)
    elseif n.id == kern_t and n.subtype == 0 then
      if n.next and not node.has_attribute(n.next, attr) then
        new_value = nil
      else
        new_value = last_value
      end
    elseif n.id == glue_t and (
        n.subtype == 8 or
        n.subtype == 9 or
        n.subtype == 15 or
    false) then
      new_value = nil
    end
    if last_value ~= new_value then
      if last_value then
        local width = node.rangedimensions(head, first, n)
        local kern = node.new(kern_t)
        kern.kern = -width
        local lead = node.copy(underline_types[last_value])
        lead.width = width
        head.head = node.insert_before(head.head, first, lead)
        node.insert_after(head, lead, kern)
      end
      if new_value then
        first = n
      end
      last_value = new_value
    end
  end
  if last_value then
    local width = node.rangedimensions(head, first)
    local kern = node.new(kern_t)
    kern.kern = -width
    local lead = node.copy(underline_types[last_value])
    lead.width = width
    head.head = node.insert_before(head.head, first, lead)
    node.insert_after(head, lead, kern)
  end
end
local function filter(b, loc, prev, mirror)
  for i = 1, #underlineattrs do
    add_underline_v(b, underlineattrs[i])
  end
  return true
end
require'pre_append_to_vlist_filter'
luatexbase.add_to_callback('pre_append_to_vlist_filter',
                           filter, 'add underlines to list')
-- 
--
-- End of file `lua-ul.lua'.
