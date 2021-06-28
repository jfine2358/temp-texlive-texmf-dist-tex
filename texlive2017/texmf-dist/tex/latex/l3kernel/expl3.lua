--
-- This is file `expl3.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- l3luatex.dtx  (with options: `package,lua')
-- 
-- EXPERIMENTAL CODE
-- 
-- Do not distribute this file without also distributing the
-- source files specified above.
-- 
-- Do not distribute a modified version of this file.
-- 
-- File: l3luatex.dtx Copyright (C) 2010-2017 The LaTeX3 Project
l3kernel = l3kernel or { }
local tex_setcatcode    = tex.setcatcode
local tex_sprint        = tex.sprint
local tex_write         = tex.write
local unicode_utf8_char = unicode.utf8.char
local function strcmp (A, B)
  if A == B then
    tex_write("0")
  elseif A < B then
    tex_write("-1")
  else
    tex_write("1")
  end
end
l3kernel.strcmp = strcmp
local charcat_table = l3kernel.charcat_table or 1
local function charcat (charcode, catcode)
  tex_setcatcode(charcat_table, charcode, catcode)
  tex_sprint(charcat_table, unicode_utf8_char(charcode))
end
l3kernel.charcat = charcat
