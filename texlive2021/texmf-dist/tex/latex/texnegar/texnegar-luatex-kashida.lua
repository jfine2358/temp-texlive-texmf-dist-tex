--
-- This is file `texnegar-luatex-kashida.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- texnegar.dtx  (with options: `texnegar-luatex-kashida-lua')
--
-- Copyright (C) 2020-2021 Hossein Movahhedian
--
-- It may be distributed and/or modified under the LaTeX Project Public License,
-- version 1.3c or higher (your choice). The latest version of
-- this license is at: http://www.latex-project.org/lppl.txt
--
-- texnegar_luatex_kashida        = texnegar_luatex_kashida or {}
-- local texnegar_luatex_kashida  = texnegar_luatex_kashida
-- texnegar_luatex_kashida.module = {
--     name                       = "texnegar_luatex_kashida",
--     version                    = "0.1e",
--     date                       = "2021-02-09",
--     description                = "Full implementation of kashida feature in XeLaTex and LuaLaTeX",
--     author                     = "Hossein Movahhedian",
--     copyright                  = "Hossein Movahhedian",
--     license                    = "LPPL v1.3c"
-- }
--
-- -- ^^A%%  texnegar-lua.dtx -- part of TEXNEGAR <bitbucket.org/dma8hm1334/texnegar>
-- local err, warn, info, log = luatexbase.provides_module(texnegar_luatex_kashida.module)
-- texnegar_luatex_kashida.log     = log  or (function (s) luatexbase.module_info("texnegar_luatex_kashida", s)    end)
-- texnegar_luatex_kashida.warning = warn or (function (s) luatexbase.module_warning("texnegar_luatex_kashida", s) end)
-- texnegar_luatex_kashida.error   = err  or (function (s) luatexbase.module_error("texnegar_luatex_kashida", s)   end)

local peCharTableInitial, peCharTableMedial, peCharTableFinal, peCharTableDiacritic = dofile(kpse.find_file("texnegar-char-table.lua"))

local kashida_unicode = 1600
local kashida_subtype = 256

local COLORSTACK = node.subtype("pdf_colorstack")
local node_id    = node.id
local GLUE       = node_id("glue")
local GLYPH      = node_id("glyph")
local HLIST      = node_id("hlist")
local RULE       = node_id("rule")
local VLIST      = node_id("vlist")
local WHATSIT    = node_id("whatsit")

local l_texnegar_kashida_glyph_bool         = token.create("l_texnegar_kashida_glyph_bool")
local l_texnegar_kashida_leaders_glyph_bool = token.create("l_texnegar_kashida_leaders_glyph_bool")
local l_texnegar_kashida_leaders_hrule_bool = token.create("l_texnegar_kashida_leaders_hrule_bool")

local l_texnegar_hboxrecursion_bool         = token.create("l_texnegar_hboxrecursion_bool")
local l_texnegar_vboxrecursion_bool         = token.create("l_texnegar_vboxrecursion_bool")

local selected_font = font.current()
local selected_font_old = selected_font

local string_format = string.format
local debug_getinfo = debug.getinfo

function GetGlyphDimensions(font_file, glyph_index)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local fnt = fontloader.open(font_file)
    local idx = 0
    local fnt_glyphcnt = fnt.glyphcnt
    local fnt_glyphmin = fnt.glyphmin
    local fnt_glyphmax = fnt.glyphmax
    if  fnt_glyphcnt > 0 then
        for idx = fnt_glyphmin, fnt_glyphmax do
            local gl = fnt.glyphs[idx]
            if  gl then
                local gl_unicode = gl.unicode
                if  gl_unicode == glyph_index then
                    local gl_name    = gl.name
                    gl_width   = gl.width
                    local gl_bbox    = gl.boundingbox
                    gl_llx     = gl_bbox[1]
                    gl_depth   = gl_bbox[2]
                    gl_urx     = gl_bbox[3]
                    gl_height  = gl_bbox[4]
                    break
                end
            end
            idx = idx + 1
        end
    end
    fontloader.close(fnt)
    return {width = gl_width, height = gl_height, depth = gl_depth, llx = gl_llx, urx = gl_urx}
end

function GetGlue(t_plb_line_glue_node, t_plb_node)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local glue_id            = t_plb_line_glue_node.id
    local glue_subtype       = t_plb_line_glue_node.subtype
    local glue_width         = t_plb_line_glue_node.width
    local glue_stretch       = t_plb_line_glue_node.stretch
    local glue_shrink        = t_plb_line_glue_node.shrink
    local eff_glue_width     = node.effective_glue(t_plb_line_glue_node, t_plb_node)
    local glue_stretch_order = t_plb_line_glue_node.stretch_order
    local glue_shrink_order  = t_plb_line_glue_node.shrink_order
    local glue_delta         = 0
    glue_delta = eff_glue_width - glue_width
    return { id = glue_id, subtype = glue_subtype, width = glue_width, stretch = glue_stretch,
             shrink = glue_shrink, stretch_order = glue_stretch_order, shrink_order = glue_shrink_order,
             effective_glue = eff_glue_width, delta = glue_delta }
end

function GetGlyph(t_plb_line_glyph_node, t_tbl_line_fields, t_CharTableInitial, t_CharTableMedial, t_CharTableFinal)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local glyph_id      = t_plb_line_glyph_node.id
    local glyph_subtype = t_plb_line_glyph_node.subtype
    local glyph_char    = t_plb_line_glyph_node.char
    local glyph_font    = t_plb_line_glyph_node.font
    local glyph_lang    = t_plb_line_glyph_node.lang
    local glyph_width   = t_plb_line_glyph_node.width
    local glyph_data    = t_plb_line_glyph_node.data

    if  not (t_CharTableInitial[glyph_char] == nil) then
        t_tbl_line_fields.joinerCharInitial = t_tbl_line_fields.joinerCharInitial + 1
        t_plb_line_glyph_node.data = 1
    elseif not (t_CharTableMedial[glyph_char] == nil) then
        t_tbl_line_fields.joinerCharMedial = t_tbl_line_fields.joinerCharMedial + 1
        t_plb_line_glyph_node.data = 2
    elseif not (t_CharTableFinal[glyph_char] == nil) then
        t_tbl_line_fields.joinerCharFinal = t_tbl_line_fields.joinerCharFinal + 1
        t_plb_line_glyph_node.data = 3
    end
    return { id = glyph_id, subtype = glyph_subtype, char = glyph_char, font = glyph_font, lang = glyph_lang, width = glyph_width, data = glyph_data }, t_tbl_line_fields
end

function ProcessTableKashidaHlist(ksh_hlistNode, hbox_num, in_font)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local ksh_hlistNode_id      = ksh_hlistNode.id
    local ksh_hlistNode_subtype = ksh_hlistNode.subtype

    for tn in node.traverse(ksh_hlistNode.head) do
        local tn_id = tn.id
        local tn_subtype = tn.subtype

        if  tn_id == HLIST then
            for tp in node.traverse(tn.head) do
                local tp_id = tp.id
                local tp_subtype = tp.subtype
                if  tp_id == GLYPH then
                    if  l_texnegar_color_bool.mode == c_true_bool.mode then
                        local col_str      = color_tbl[1] .. " " .. color_tbl[2] .. " " .. color_tbl[3]
                        local col_str_rg   = col_str .. " rg "
                        local col_str_RG   = col_str .. " RG"

                        local color_push   = node.new(WHATSIT, COLORSTACK)
                        local color_pop    = node.new(WHATSIT, COLORSTACK)
                        color_push.stack   = 0
                        color_pop.stack    = 0
                        color_push.command = 1
                        color_pop.command  = 2
                        glue_ratio         = .2
                        color_push.data       = col_str_rg .. col_str_RG
                        color_pop.data        = col_str_rg .. col_str_RG
                        tn.head = node.insert_before(tn.list, tn.head, node.copy(color_push))
                        tn.head = node.insert_after(tn.list, node.tail(tn.head), node.copy(color_pop))
                    end

                    local tp_font = tp.font
                    local tp_char = tp.char
                    tp.font = in_font

                    local ksh_unicode
                    ksh_unicode = font.getfont(in_font).resources.unicodes['kashida']
                    if  hbox_num == 'l_texnegar_k_box' then
                        tp.char = current_kashida_unicode or kashida_unicode
                    elseif hbox_num == 'l_texnegar_ksh_box' then
                        tp.char = ksh_unicode
                        tn_width = tn.width
                        ksh_hlistNode.width = tn_width
                    end
                elseif  tp_id == HLIST then
                    if  tp.subtype ~= 3 then
                        tbl_kashida_hlist_nodes[ #tbl_kashida_hlist_nodes + 1 ] = tp
                    end
                end
            end
        elseif tn_id == VLIST then
            do end
        elseif tn_id == WHATSIT then
            do end
        elseif  tn_id == GLYPH then
            if  l_texnegar_color_bool.mode == c_true_bool.mode then
                local col_str      = color_tbl[1] .. " " .. color_tbl[2] .. " " .. color_tbl[3]
                local col_str_rg   = col_str .. " rg "
                local col_str_RG   = col_str .. " RG"

                local color_push   = node.new(WHATSIT, COLORSTACK)
                local color_pop    = node.new(WHATSIT, COLORSTACK)
                color_push.stack   = 0
                color_pop.stack    = 0
                color_push.command = 1
                color_pop.command  = 2
                glue_ratio         = .2
                color_push.data       = col_str_rg .. col_str_RG
                color_pop.data        = col_str_rg .. col_str_RG
                ksh_hlistNode.head = node.insert_before(ksh_hlistNode.list, ksh_hlistNode.head, node.copy(color_push))
                ksh_hlistNode.head = node.insert_after(ksh_hlistNode.list, node.tail(ksh_hlistNode.head), node.copy(color_pop))
            end

            local tn_font = tn.font
            local tn_char = tn.char
            tn.font = in_font

            local ksh_unicode
            ksh_unicode = font.getfont(in_font).resources.unicodes['kashida']
            if  hbox_num == 'l_texnegar_k_box' then
                tn.char = kashida_unicode
            elseif hbox_num == 'l_texnegar_ksh_box' then
                tn.char = ksh_unicode
                tn_width = tn.width
                ksh_hlistNode.width = tn_width
            end
        else
           print(string_format("\n tn. Not processed node id is: %d", tn_id))
        end
    end
end

function SetFontInHbox(hbox_num, font_num)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    tbl_kashida_hlist_nodes = {}

    local tmp_node
    tmp_node = node.new("hlist")
    tmp_node = tex.getbox(hbox_num)

    ProcessTableKashidaHlist(tmp_node, hbox_num, font_num)

    ::kashida_hlist_BEGIN::
    if  #tbl_kashida_hlist_nodes > 0 then
        local kashida_hlistNodeAdded = table.remove(tbl_kashida_hlist_nodes,1)
        ProcessTableKashidaHlist(kashida_hlistNodeAdded, hbox_num, font_num)
        goto kashida_hlist_BEGIN
    end
end

function StretchGlyph(t_plb_node, t_plb_glyph_node, t_gluePerJoiner, t_dir, t_filler)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    if  t_filler == "resized_kashida" then
        SetFontInHbox('l_texnegar_k_box', selected_font)
    elseif t_filler == "leaders+kashida" then
        SetFontInHbox('l_texnegar_ksh_box', selected_font)
    end

    kashida_node = node.new(GLYPH)
    node_glue    = node.new(GLUE)
    node_rule    = node.new(RULE)
    node_hlist   = node.new(HLIST)

    font_current = selected_font
    font_name    = font.fonts[font_current].fullname
    font_file    = font.fonts[font_current].filename
    kashida_char = font.fonts[font_current].characters[1600]

    kashida_node.subtype = kashida_subtype
    kashida_node.font    = font_current
    if  string.match(font_name, "^(Amiri).*") == "Amiri" then
        kashida_node.char = current_kashida_unicode
    else
        kashida_node.char = kashida_unicode
    end
    kashida_node.lang    = tex.language

    kashida_width  = kashida_node.width
    kashida_height = kashida_node.height
    kashida_depth  = kashida_node.depth

    tbl_gl_dimen = GetGlyphDimensions(font_file, kashida_unicode)
    ksh_width, ksh_height, ksh_depth, ksh_llx, ksh_urx =
        tbl_gl_dimen.width, tbl_gl_dimen.height, tbl_gl_dimen.depth, tbl_gl_dimen.llx, tbl_gl_dimen.urx

    ratio_width = kashida_width / ksh_width
    leaders_height =  ratio_width * ksh_height
    leaders_depth = - ratio_width * ksh_depth

    node_glue.subtype = 100
    node.setglue(node_glue, t_gluePerJoiner, 0, 0, 0, 0)

    if  t_filler == "resized_kashida" then
        node_glue.leader = node.copy_list(tex.box['l_texnegar_k_box'])
    elseif t_filler == "leaders+kashida" then
        node_glue.leader = node.copy_list(tex.box['l_texnegar_ksh_box'])
    elseif t_filler == "leaders+hrule" then
        node_glue.leader = node_rule
    end

    node_glue.leader.subtype = 0
    node_glue.leader.height  = leaders_height
    node_glue.leader.depth   = leaders_depth

    node_glue.leader.dir     = t_dir

    local t_plb_glyph_node_next = t_plb_glyph_node.next
    local t_plb_glyph_node_next_id = t_plb_glyph_node_next.id
    if  not t_plb_glyph_node_next then
        node.insert_after(t_plb_node.list, t_plb_glyph_node, node_glue)
    else
        if  t_plb_glyph_node_next_id == GLYPH then
            local t_plb_glyph_node_next_char = t_plb_glyph_node_next.char
            if  peCharTableDiacritic[t_plb_glyph_node_next_char] then
                node.insert_after(t_plb_node.list, t_plb_glyph_node_next, node_glue)
            else
                node.insert_after(t_plb_node.list, t_plb_glyph_node, node_glue)
            end
        else
            node.insert_after(t_plb_node.list, t_plb_glyph_node, node_glue)
        end
    end
    if  t_filler == "leaders+hrule" then
        for tn in node.traverse(t_plb_node.head) do
            local tn_id = tn.id
            local tn_subtype = tn.subtype

            if  tn_id == GLUE and tn_subtype == 100 then
                local t_hbox = node.new(HLIST)
                local t_hrule = node.copy(tn)

                if  string.match(font_name, "^(Amiri).*") == "Amiri" then
                    t_hrule.leader.height = kashida_height
                    t_hrule.leader.depth  = kashida_depth
                end

                t_hbox.head = node.insert_after(t_hbox.list, t_hbox.head,t_hrule)
                t_plb_node.head = node.insert_after(t_plb_node.list, tn, t_hbox)

                if  l_texnegar_color_bool.mode == c_true_bool.mode then
                    local col_str      = color_tbl[1] .. " " .. color_tbl[2] .. " " .. color_tbl[3]
                    local col_str_rg   = col_str .. " rg "
                    local col_str_RG   = col_str .. " RG"

                    local color_push   = node.new(WHATSIT, COLORSTACK)
                    local color_pop    = node.new(WHATSIT, COLORSTACK)
                    color_push.stack   = 0
                    color_pop.stack    = 0
                    color_push.command = 1
                    color_pop.command  = 2
                    glue_ratio         = .2
                    color_push.data       = col_str_rg .. col_str_RG
                    color_pop.data        = col_str_rg .. col_str_RG
                    t_hbox.head = node.insert_before(t_hbox.list, t_hbox.head, node.copy(color_push))
                    t_hbox.head = node.insert_after(t_hbox.list, node.tail(t_hbox.head), node.copy(color_pop))
                end
            end
        end
    end
end

function GetFillerSpec(t_plb_node, t_plb_head_node, t_tbl_line_fields, t_CharTableInitial, t_CharTableMedial, t_CharTableFinal)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    t_plb_node_id = t_plb_node.id
    t_plb_node_subtype = t_plb_node.subtype

    for p in node.traverse(t_plb_head_node) do
        local p_id = p.id
        local p_subtype = p.subtype
        if  p_id == HLIST then
            t_tbl_line_fields.lineWidthRemainder = t_tbl_line_fields.lineWidthRemainder - p.width
            if  p.subtype ~= 3 then
                tbl_hlist_nodes[ #tbl_hlist_nodes + 1 ] = p
            end
        elseif p_id == VLIST then
            t_tbl_line_fields.lineWidthRemainder = t_tbl_line_fields.lineWidthRemainder - p.width
            tbl_vlist_nodes[ #tbl_vlist_nodes + 1 ] = p
        elseif p_id == GLUE then
            tbl_p_glue = GetGlue(p, t_plb_node)
            t_tbl_line_fields.lineWidthRemainder = t_tbl_line_fields.lineWidthRemainder - tbl_p_glue["effective_glue"]
            t_tbl_line_fields.total_glues = t_tbl_line_fields.total_glues + 1
            t_tbl_line_fields.stretchedGlue = t_tbl_line_fields.stretchedGlue + tbl_p_glue["delta"]
        elseif p_id == GLYPH then
            tbl_p_glyph, t_tbl_line_fields = GetGlyph(p, t_tbl_line_fields, t_CharTableInitial, t_CharTableMedial, t_CharTableFinal)
            selected_font_old = selected_font
            selected_font = tbl_p_glyph["font"]
            t_tbl_line_fields.lineWidthRemainder = t_tbl_line_fields.lineWidthRemainder - tbl_p_glyph["width"]
            t_tbl_line_fields.total_glyphs = t_tbl_line_fields.total_glyphs + 1
        end
    end

    t_tbl_line_fields.total_joiners = t_tbl_line_fields.joinerCharInitial + t_tbl_line_fields.joinerCharMedial
    t_tbl_line_fields.gluePerJoiner = 0
    if  t_tbl_line_fields.total_glues == 0 then
        t_tbl_line_fields.stretchedGlue = t_tbl_line_fields.lineWidthRemainder
    end
    if  t_tbl_line_fields.total_joiners > 0 then
        t_tbl_line_fields.gluePerJoiner           = t_tbl_line_fields.stretchedGlue // t_tbl_line_fields.total_joiners
        t_tbl_line_fields.stretchedGlueRemaineder = t_tbl_line_fields.stretchedGlue % t_tbl_line_fields.total_joiners
    elseif t_tbl_line_fields.total_joiners == 1 then
        t_tbl_line_fields.gluePerJoiner = t_tbl_line_fields.stretchedGlue
    end

    return t_tbl_line_fields
end

function ProcessTableHlist(tmphl_n)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local tmphl_n_id      = tmphl_n.id
    local tmphl_n_subtype = tmphl_n.subtype

    local tbl_line_fields = { line_dir          = "", line_width       = 0, lineWidthRemainder = 0, total_glyphs            = 0,
                              joinerCharInitial = 0,  joinerCharMedial = 0, joinerCharFinal    = 0, total_joiners           = 0,
                              stretchedGlue     = 0,  total_glues      = 0, gluePerJoiner      = 0, stretchedGlueRemaineder = 0}

    local tbl_p_glue, tbl_p_glyph

    if  (tmphl_n_id == HLIST) and (tmphl_n_subtype == 1 or tmphl_n_subtype == 2) then
        tbl_line_fields.line_width = tmphl_n.width
        tbl_line_fields.line_dir   = tmphl_n.dir
        tbl_line_fields.lineWidthRemainder = tbl_line_fields.line_width

        if  tbl_line_fields.line_dir == "TLT" then
            tbl_line_fields = GetFillerSpec(tmphl_n, tmphl_n.head, tbl_line_fields, peCharTableInitial, peCharTableMedial, peCharTableFinal)

            if  tbl_line_fields.total_joiners == 0 or tbl_line_fields.gluePerJoiner == 0 or tbl_line_fields.stretchedGlue <= 0 then
                goto continue
            end

            for q in node.traverse_id(GLUE, tmphl_n.head) do
                local eff_glue_width     = node.effective_glue(q, tmphl_n)
                node.setglue(q, q.width, 0, 0, q.stretch_order, q.glue_shrink_order)
            end

            for r in node.traverse_id(GLYPH, tmphl_n.head) do
                local r_data = r.data
                if  r_data == 1 or r.data == 2 then
                    StretchGlyph(tmphl_n, r, tbl_line_fields.gluePerJoiner, tbl_line_fields.line_dir, filler_pe)
                elseif r.data == 3 then
                    goto for_loop_01
                end
                ::for_loop_01::
            end
            tbl_line_fields.line_width = tmphl_n.width
            tbl_line_fields.lineWidthRemainder = line_width
        elseif tbl_line_fields.line_dir == "TRT" then
            tbl_line_fields = GetFillerSpec(tmphl_n, tmphl_n.head, tbl_line_fields, peCharTableInitial, peCharTableMedial, peCharTableFinal)
            if  tbl_line_fields.total_joiners == 0 or tbl_line_fields.gluePerJoiner == 0 or tbl_line_fields.stretchedGlue <= 0 then
                goto continue
            end

            for q in node.traverse_id(GLUE, tmphl_n.head) do
                local eff_glue_width     = node.effective_glue(q, tmphl_n)
                node.setglue(q, q.width, 0, 0, q.stretch_order, q.glue_shrink_order)
            end

            for r in node.traverse_id(GLYPH, tmphl_n.head) do
                local r_data = r.data
                if  r_data == 1 or r.data == 2 then
                    StretchGlyph(tmphl_n, r, tbl_line_fields.gluePerJoiner, tbl_line_fields.line_dir, filler_pe)
                elseif r.data == 3 then
                    goto for_loop_02
                end
                ::for_loop_02::
            end
            tbl_line_fields.line_width = tmphl_n.width
            tbl_line_fields.lineWidthRemainder = line_width
        else
            print(string_format("\n Line direction '%s' is not supported yet!", tbl_line_fields.line_dir))
        end
    end
    ::continue::
end

function ProcessTableVlist(tmpvl_n)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    local tmpvl_n_id      = tmpvl_n.id
    local tmpvl_n_subtype = tmpvl_n.subtype

    for vbNode in node.traverse(tmpvl_n) do
        if  vbNode.id == VLIST and vbNode.subtype == 0 then
            for tr_vbNode in node.traverse(vbNode.head) do
                if  (tr_vbNode.id == HLIST) and (tr_vbNode.subtype == 1 or tr_vbNode.subtype == 2) then
                    ProcessTableHlist(tr_vbNode)
                end
            end
        end
    end
end

function PostLineBreakFilter(hboxes_stack, groupcode)
    local funcName    = debug_getinfo(1).name
    local funcNparams = debug_getinfo(1).nparams

    funcName = "PostLineBreakFilter"

    local tbl_fonts_used = { }
    local tbl_fonts_chars = { }
    local tbl_fonts_chars_init = { }
    local tbl_fonts_chars_medi = { }
    local tbl_fonts_chars_fina = { }

    tbl_fonts_used, tbl_fonts_chars, tbl_fonts_chars_init, tbl_fonts_chars_medi, tbl_fonts_chars_fina = GetFontsChars()

    local f_fontname

    for f_fontname, v in pairs(tbl_fonts_used) do
        for k1, v1 in pairs(tbl_fonts_chars_init[f_fontname]) do
            if  k1 and not peCharTableInitial[k1] then
                peCharTableInitial[k1] = utf8.char(k1)
            end
        end

        for k1, v1 in pairs(tbl_fonts_chars_medi[f_fontname]) do
            if  k1 and not peCharTableMedial[k1] then
                peCharTableMedial[k1] = utf8.char(k1)
            end
        end

        for k1, v1 in pairs(tbl_fonts_chars_fina[f_fontname]) do
            if  k1 and not peCharTableFinal[k1] then
                peCharTableFinal[k1] = utf8.char(k1)
            end
        end
    end

    tbl_hlist_nodes = {}
    tbl_vlist_nodes = {}
    for hlistNode in node.traverse(hboxes_stack) do
        if  node.next(hlistNode) == nil then
            goto END
        end

        ProcessTableHlist(hlistNode)

        if   l_texnegar_hboxrecursion_bool.mode == c_true_bool.mode then
            ::hboxBEGIN::
            if  #tbl_hlist_nodes > 0 then
                local hlistNodeAdded = table.remove(tbl_hlist_nodes,1)
                ProcessTableHlist(hlistNodeAdded)
                goto hboxBEGIN
            end
        end

        if   l_texnegar_vboxrecursion_bool.mode == c_true_bool.mode then
            ::vboxBEGIN::
            if  #tbl_vlist_nodes > 0 then
                local vlistNodeAdded = table.remove(tbl_vlist_nodes,1)
                ProcessTableVlist(vlistNodeAdded)
                goto vboxBEGIN
            end
        end

        ::END::
    end
    return hboxes_stack
end

if  l_texnegar_kashida_glyph_bool.mode == c_true_bool.mode then
    filler_pe = "resized_kashida"
elseif l_texnegar_kashida_leaders_glyph_bool.mode == c_true_bool.mode then
     filler_pe = "leaders+kashida"
elseif l_texnegar_kashida_leaders_hrule_bool.mode == c_true_bool.mode then
    filler_pe = "leaders+hrule"
else
    print(string_format" Unknown kashida value.")
end

function StartStretching()
    if  not luatexbase.in_callback('post_linebreak_filter', 'insertKashida') then
        luatexbase.add_to_callback('post_linebreak_filter', PostLineBreakFilter, 'insertKashida')
    end
end

function StopStretching()
    if  luatexbase.in_callback('post_linebreak_filter', 'insertKashida') then
        luatexbase.remove_from_callback('post_linebreak_filter', 'insertKashida')
    end
end
--
--
-- End of file `texnegar-luatex-kashida.lua'.
