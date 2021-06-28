--
-- This is file `texnegar-ini.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- texnegar.dtx  (with options: `texnegar-ini-lua')
--
-- Copyright (C) 2020-2021 Hossein Movahhedian
--
-- It may be distributed and/or modified under the LaTeX Project Public License,
-- version 1.3c or higher (your choice). The latest version of
-- this license is at: http://www.latex-project.org/lppl.txt
--
-- texnegar_ini        = texnegar_ini or {}
-- local texnegar_ini  = texnegar_ini
-- texnegar_ini.module = {
--     name            = "texnegar_ini",
--     version         = "0.1e",
--     date            = "2021-02-09",
--     description     = "Full implementation of kashida feature in XeLaTex and LuaLaTeX",
--     author          = "Hossein Movahhedian",
--     copyright       = "Hossein Movahhedian",
--     license         = "LPPL v1.3c"
-- }
--
-- -- ^^A%%  texnegar-lua.dtx -- part of TEXNEGAR <bitbucket.org/dma8hm1334/texnegar>
-- local err, warn, info, log = luatexbase.provides_module(texnegar_ini.module)
-- texnegar_ini.log     = log  or (function (s) luatexbase.module_info("texnegar_ini", s)    end)
-- texnegar_ini.warning = warn or (function (s) luatexbase.module_warning("texnegar_ini", s) end)
-- texnegar_ini.error   = err  or (function (s) luatexbase.module_error("texnegar_ini", s)   end)

c_true_bool  = token.create("c_true_bool")

l_texnegar_color_bool                 = token.create("l_texnegar_color_bool")

if  l_texnegar_color_bool.mode == c_true_bool.mode then
    color_tbl = color_tbl or {}
    for item in l_texnegar_color_rgb_tl:gmatch("([^,%s]+)") do
        table.insert(color_tbl, item)
    end
end

dofile(kpse.find_file("texnegar-luatex-kashida.lua"))
--
--
-- End of file `texnegar-ini.lua'.
