--
--  File `frenchb.lua' generated from frenchb.dtx [2015/04/10 v3.1e]
--
--  Copyright (C) 2014-2015 Daniel Flipo
--  <daniel (dot) flipo (at) free (dot) fr>
--  License LPPL: see frenchb.ldf.
--
local FB_punct_thin =
  {[string.byte("!")] = true,
   [string.byte("?")] = true,
   [string.byte(";")] = true}
local FB_punct_thick =
  {[string.byte(":")] = true}
local FB_punct_left =
  {[string.byte("!")] = true,
   [string.byte("?")] = true,
   [string.byte(";")] = true,
   [string.byte(":")] = true,
   [0x14]             = true,
   [0xBB]             = true}
local FB_punct_right =
  {[0x13]             = true,
   [0xAB]             = true}
local FB_punct_null =
  {[string.byte("!")] = true,
   [string.byte("?")] = true,
   [string.byte("[")] = true,
   [string.byte("(")] = true,
   [0xA0]             = true,
   [0x202F]           = true}
local FB_guil_null =
  {[0xA0]             = true,
   [0x202F]           = true}
local new_node     = node.new
local copy_node    = node.copy
local node_id      = node.id
local KERN         = node_id("kern")
local GLUE         = node_id("glue")
local GSPEC        = node_id("glue_spec")
local GLYPH        = node_id("glyph")
local PENALTY      = node_id("penalty")
local nobreak      = new_node(PENALTY)
nobreak.penalty    = 10000
local insert_node_before = node.insert_before
local insert_node_after  = node.insert_after
local remove_node        = node.remove
local thin10 = tex.skip['FBthinskip']
local thinwd = thin10.width/65536/3.33
local thinst = thin10.stretch/65536/1.665
local thinsh = thin10.shrink/655.36/1.11
local coln10 = tex.skip['FBcolonskip']
local colnwd = coln10.width/65536/3.33
local colnst = coln10.stretch/65536/1.665
local colnsh = coln10.shrink/65536/1.11
local guil10 = tex.skip['FBguillskip']
local guilwd = guil10.width/65536/3.33
local guilst = guil10.stretch/65536/1.665
local guilsh = guil10.shrink/65536/1.11
local font_table = {}
local function new_glue_scaled (fid,width,stretch,shrink)
  if fid > 0 then
     local fp = font_table[fid]
     if not fp then
        font_table[fid] = font.getfont(fid).parameters
        fp = font_table[fid]
     end
     local gl = new_node(GLUE,0)
     local gl_spec = new_node(GSPEC)
     gl_spec.width = width * fp.space
     gl_spec.stretch = stretch * fp.space_stretch
     gl_spec.shrink = shrink * fp.space_shrink
     gl.spec = gl_spec
     return gl
  else
     return nil
  end
end
local addDPspace   = luatexbase.attributes['FB@addDPspace']
local addGUILspace = luatexbase.attributes['FB@addGUILspace']
local has_attribute = node.has_attribute
local function french_punctuation (head)
  for item in node.traverse_id(GLYPH, head) do
    local lang = item.lang
    local char = item.char
    local fid  = item.font
    local SIG  = has_attribute(item, addGUILspace)
    if lang == FR and FB_punct_left[char] and fid > 0 then
       local prev = item.prev
       local prev_id, prev_subtype, prev_char
       if prev then
          prev_id = prev.id
          prev_subtype = prev.subtype
          if prev_id == GLYPH then
             prev_char = prev.char
          end
       end
       local glue = prev_id == GLUE and prev_subtype == 0
       local glue_wd
       if glue then
          glue_spec = prev.spec
          glue_wd = glue_spec.width
       end
       local realglue = glue and glue_wd > 1
       if FB_punct_thin[char] or FB_punct_thick[char] then
          local SBDP = has_attribute(item, addDPspace)
          local auto = SBDP and SBDP > 0
          if auto then
             if (prev_char and FB_punct_null[prev_char]) or
                (glue and glue_wd <= 1) or
                (prev_id == 0 and prev_subtype == 3) then
                auto = false
             end
          end
          local fbglue
          if FB_punct_thick[char] then
             fbglue = new_glue_scaled(fid,colnwd,colnst,colnsh)
          else
             fbglue = new_glue_scaled(fid,thinwd,thinst,thinsh)
          end
          if realglue or auto then
             if realglue then
                head = remove_node(head,prev,true)
             end
             insert_node_before(head, item, copy_node(nobreak))
             insert_node_before(head, item, copy_node(fbglue))
          end
       elseif SIG and SIG > 0 then
          local addgl = (prev_char and not FB_guil_null[prev_char]) or
                        (not prev_char)
          if glue or addgl then
             if glue then
                head = remove_node(head,prev,true)
             end
             local fbglue = new_glue_scaled(fid,guilwd,guilst,guilsh)
             insert_node_before(head, item, copy_node(nobreak))
             insert_node_before(head, item, copy_node(fbglue))
          end
       end
    end
    if lang == FR and FB_punct_right[char] and fid > 0
                                           and SIG and SIG > 0 then
       local next = item.next
       local next_id, next_subtype, next_char, kern_wd, nextnext
       if next then
          next_id = next.id
          next_subtype = next.subtype
          if next_id == GLYPH then
             next_char = next.char
          elseif next_id == KERN then
             kern_wd = next.kern
             if kern_wd == 0 then
                nextnext = next.next
                if nextnext then
                   next = nextnext
                   next_id = nextnext.id
                   next_subtype = nextnext.subtype
                   next_char = nextnext.char
                end
             end
          end
       end
       local glue = next_id == GLUE and next_subtype == 0
       if glue then
          glue_spec = next.spec
          glue_wd = glue_spec.width
       end
       glue = glue and glue_wd > 0
       local addgl = (next_char and not FB_guil_null[next_char]) or
                     (not next_char)
       if glue or addgl then
          if glue then
             head = remove_node(head,next,true)
          end
          local fid = item.font
          local fbglue = new_glue_scaled(fid,guilwd,guilst,guilsh)
          insert_node_after(head, item, copy_node(fbglue))
          insert_node_after(head, item, copy_node(nobreak))
       end
    end
  end
  return head
end
return french_punctuation
--  End of File frenchb.lua.
