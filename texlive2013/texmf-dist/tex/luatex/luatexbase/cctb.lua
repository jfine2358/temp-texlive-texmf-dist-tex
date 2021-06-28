-- 
--  This is file `cctb.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatexbase-cctb.dtx  (with options: `luamodule')
--  
--  See the aforementioned source file(s) for copyright and licensing information.
--  
luatexbase                  = luatexbase or { }
local luatexbase            = luatexbase
luatexbase.provides_module({
    name          = "luatexbase-cctb",
    version       = 0.6,
    date          = "2013/05/11",
    description   = "Catcodetable allocation for LuaTeX",
    author        = "Heiko Oberdiek, Elie Roux and Manuel Pegourie-Gonnard",
    copyright     = "Heiko Oberdiek, Elie Roux and Manuel Pegourie-Gonnard",
    license       = "CC0",
})
luatexbase.catcodetables    = luatexbase.catcodetables or { }
local catcodetables         = luatexbase.catcodetables
local function catcodetabledef_from_tex(name, number)
    catcodetables[name] = tonumber(number)
end
luatexbase.catcodetabledef_from_tex = catcodetabledef_from_tex
local function catcodetable_do_shortcuts()
    local cat = catcodetables
    cat['latex']                = cat.CatcodeTableLaTeX
    cat['latex-package']        = cat.CatcodeTableLaTeXAtLetter
    cat['latex-atletter']       = cat.CatcodeTableLaTeXAtLetter
    cat['ini']                  = cat.CatcodeTableIniTeX
    cat['expl3']                = cat.CatcodeTableExpl
    cat['expl']                 = cat.CatcodeTableExpl
    cat['string']               = cat.CatcodeTableString
    cat['other']                = cat.CatcodeTableOther
end
luatexbase.catcodetable_do_shortcuts = catcodetable_do_shortcuts
-- 
--  End of File `cctb.lua'.
