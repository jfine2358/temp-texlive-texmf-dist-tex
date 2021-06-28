--
-- This is file `texnegar.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- texnegar.dtx  (with options: `texnegar-lua')
--
-- Copyright (C) 2020-2021 Hossein Movahhedian
--
-- It may be distributed and/or modified under the LaTeX Project Public License,
-- version 1.3c or higher (your choice). The latest version of
-- this license is at: http://www.latex-project.org/lppl.txt
--
-- texnegar          = texnegar or {}
-- local texnegar    = texnegar
-- texnegar.module   = {
--     name          = "texnegar",
--     version       = "0.1e",
--     date          = "2021-02-09",
--     description   = "Full implementation of kashida feature in XeLaTex and LuaLaTeX",
--     author        = "Hossein Movahhedian",
--     copyright     = "Hossein Movahhedian",
--     license       = "LPPL v1.3c"
-- }
--
-- -- ^^A%%  texnegar-lua.dtx -- part of TEXNEGAR <bitbucket.org/dma8hm1334/texnegar>
-- local err, warn, info, log = luatexbase.provides_module(texnegar.module)
-- texnegar.log     = log  or (function (s) luatexbase.module_info("texnegar", s)    end)
-- texnegar.warning = warn or (function (s) luatexbase.module_warning("texnegar", s) end)
-- texnegar.error   = err  or (function (s) luatexbase.module_error("texnegar", s)   end)

local l_texnegar_kashida_fontfamily_bool = token.create("l_texnegar_kashida_fontfamily_bool")

local debug_getinfo = debug.getinfo
local string_format = string.format

function TableLength(t)
    local i = 0
    for _ in pairs(t) do
        i = i + 1
    end
    return i
end

tex.enableprimitives('',tex.extraprimitives ())

local range_tble = {
    [1536] = 1791,
    [1872] = 1919,
    [2208] = 2274,
    [8204] = 8297,
    [64336] = 65023,
    [65136] = 65279,
    [126464] = 126719,
    [983040] = 1048575
  }

local tbl_fonts_used = { }
local tbl_fonts_chars = { }
local tbl_fonts_chars_init = { }
local tbl_fonts_chars_medi = { }
local tbl_fonts_chars_fina = { }

local pattern_list = {
  ".*%.(ini)t?$",  ".*%.(ini)t?%..*",
  ".*%.(med)i?$",  ".*%.(med)i?%..*",
  ".*%.(fin)a?$",  ".*%.(fin)a?%..*",

  ".*_(ini)t?$",    ".*_(ini)t?_.*",
  ".*_(med)i?$",    ".*_(med)i?_.*",
  ".*_(fin)a?$",    ".*_(fin)a?_.*",
}

function GetFontsChars()
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    for f_num = 1, font.max() do
        local f_tmp = font.fonts[f_num]
        if  f_tmp then
            local f_tmp_fontname = f_tmp.fontname
            if  f_tmp_fontname then
                local f_id_tmp       = font.getfont(f_num)
                local f_fontname_tmp = f_id_tmp.fontname
                local f_filename_tmp = f_id_tmp.filename
                if  not tbl_fonts_used[f_fontname_tmp] then
                    tbl_fonts_used[f_fontname_tmp] = {f_filename_tmp, f_id_tmp}
                end
            end
        end
    end

    for f_fontname, v in pairs(tbl_fonts_used) do
        f_filename = v[1]
        f_id = v[2]
        if  not tbl_fonts_chars[f_fontname] then
            tbl_fonts_chars[f_fontname] = { }
            tbl_fonts_chars_init[f_fontname] = { }
            tbl_fonts_chars_medi[f_fontname] = { }
            tbl_fonts_chars_fina[f_fontname] = { }
            local f = fontloader.open(f_filename)
            local char_name
            local char_unicode
            local char_class
            for k, v in pairs(range_tble) do
                for glyph_idx = k, v do
                    if  f_id.characters[glyph_idx] then
                        char_name    = f.glyphs[f_id.characters[glyph_idx].index].name
                        char_unicode = f.glyphs[f_id.characters[glyph_idx].index].unicode
                        char_class   = f.glyphs[f_id.characters[glyph_idx].index].class

                        kashida_fontfamily = token.get_macro("l_texnegar_kashida_fontfamily_tl")
                        fontfamily_match = string.match(f_fontname, "^(" .. kashida_fontfamily .. ").*")
                        if fontfamily_match == kashida_fontfamily then
                            if  not tbl_fonts_chars[f_fontname][glyph_idx] then
                                if  string.match(f_fontname, "^(Amiri).*") == "Amiri" and char_name == 'uni0640.long1' then
                                    current_kashida_unicode = glyph_idx
                                end
                                tbl_fonts_chars[f_fontname][glyph_idx] = {char_name, char_unicode, char_class}
                                for _, pattern in ipairs( pattern_list ) do
                                    local pos_alt = string.match(char_name, pattern)
                                    if  pos_alt == 'ini' or pos_alt == 'AltIni' then
                                        tbl_fonts_chars_init[f_fontname][glyph_idx] = {char_name, char_unicode, char_class}
                                    elseif pos_alt == 'med' or pos_alt == 'AltMed' then
                                        tbl_fonts_chars_medi[f_fontname][glyph_idx] = {char_name, char_unicode, char_class}
                                    elseif pos_alt == 'fin' or pos_alt == 'AltFin' then
                                        tbl_fonts_chars_fina[f_fontname][glyph_idx] = {char_name, char_unicode, char_class}
                                    end
                                end
                            end
                        end
                    end
                end
            end
            fontloader.close(f)
        end
    end
    return tbl_fonts_used, tbl_fonts_chars, tbl_fonts_chars_init, tbl_fonts_chars_medi, tbl_fonts_chars_fina
end

dofile(kpse.find_file("texnegar-ini.lua"))
--
--
-- End of file `texnegar.lua'.
