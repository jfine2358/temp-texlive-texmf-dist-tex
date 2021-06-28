-- 
--  This is file `fontspec.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  fontspec.dtx  (with options: `lua')
--  
--    _________________________________________
--    The fontspec package for XeLaTeX/LuaLaTeX
--    (C) 2004--2014    Will Robertson and Khaled Hosny
--  
--    License information appended.
--  
--  


fontspec          = fontspec or {}
local fontspec    = fontspec
fontspec.module   = {
    name          = "fontspec",
    version       = "2.3c",
    date          = "2013/05/20",
    description   = "Advanced font selection for LuaLaTeX.",
    author        = "Khaled Hosny, Philipp Gesang",
    copyright     = "Khaled Hosny, Philipp Gesang",
    license       = "LPPL"
}

local err, warn, info, log = luatexbase.provides_module(fontspec.module)

fontspec.log     = log
fontspec.warning = warn
fontspec.error   = err

function fontspec.sprint (...)
    tex.sprint(luatexbase.catcodetables['latex-package'], ...)
end
local check_script   = luaotfload.aux.provides_script
local check_language = luaotfload.aux.provides_language
local check_feature  = luaotfload.aux.provides_feature
local function tempswatrue()  fontspec.sprint([[\@tempswatrue]])  end
local function tempswafalse() fontspec.sprint([[\@tempswafalse]]) end
function fontspec.check_ot_script(fnt, script)
    if check_script(font.id(fnt), script) then
        tempswatrue()
    else
        tempswafalse()
    end
end
function fontspec.check_ot_lang(fnt, lang, script)
    if check_language(font.id(fnt), script, lang) then
        tempswatrue()
    else
        tempswafalse()
    end
end
function fontspec.check_ot_feat(fnt, feat, lang, script)
    for _, f in ipairs { "+trep", "+tlig", "+anum" } do
        if feat == f then
            tempswatrue()
            return
        end
    end
    if check_feature(font.id(fnt), script, lang, feat) then
        tempswatrue()
    else
        tempswafalse()
    end
end
local get_math_dimension = luaotfload.aux.get_math_dimension
function fontspec.mathfontdimen(fnt, str)
    local mathdimens = get_math_dimension(fnt, str)
    if mathdimens then
        fontspec.sprint(mathdimens)
        fontspec.sprint("sp")
    else
        fontspec.sprint("0pt")
    end
end
--  
--  Copyright 2004--2014 Will Robertson <wspr81@gmail.com>
--  Copyright 2009--2013   Khaled Hosny <khaledhosny@eglug.org>
--  
--  Distributable under the LaTeX Project Public License,
--  version 1.3c or higher (your choice). The latest version of
--  this license is at: http://www.latex-project.org/lppl.txt
--  
--  This work is "maintained" by Will Robertson.
--  
--  This work consists of this file fontspec.dtx
--            and the derived files fontspec.sty,
--                                  fontspec.lua,
--                                  fontspec.cfg,
--                                  fontspec-xetex.sty,
--                                  fontspec-luatex.sty,
--                                  fontspec-patches.sty,
--                                  fontspec-example.tex,
--                              and fontspec.pdf.
--  
-- 
--  End of file `fontspec.lua'.
