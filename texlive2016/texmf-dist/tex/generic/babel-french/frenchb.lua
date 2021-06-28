--
--  File `frenchb.lua' generated from frenchb.dtx [2016/05/14 v3.2c]
--
--  Copyright © 2014-2016 Daniel Flipo
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
local HLIST        = node_id("hlist")
local TEMP         = node_id("temp")
local KERN         = node_id("kern")
local GLUE         = node_id("glue")
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
        local ft = font.getfont(fid)
        if ft then
           font_table[fid] = ft.parameters
           fp = font_table[fid]
        end
     end
     local gl = new_node(GLUE,0)
     if fp then
        gl.width = width * fp.space
        gl.stretch = stretch * fp.space_stretch
        gl.shrink = shrink * fp.space_shrink
        return gl
     else
        return nil
     end
  else
     return nil
  end
end
local FBspacing    = luatexbase.attributes['FB@spacing']
local addDPspace   = luatexbase.attributes['FB@addDPspace']
local addGUILspace = luatexbase.attributes['FB@addGUILspace']
local has_attribute = node.has_attribute
local function french_punctuation (head)
  for item in node.traverse_id(GLYPH, head) do
    local lang = item.lang
    local char = item.char
    local fid  = item.font
    local FRspacing = has_attribute(item, FBspacing)
    FRspacing = FRspacing and FRspacing > 0
    local SIG  = has_attribute(item, addGUILspace)
    SIG = SIG and SIG >0
    if lang == FR and FRspacing and
                      FB_punct_left[char] and fid > 0 then
       local prev = item.prev
       local prev_id, prev_subtype, prev_char
       if prev then
          prev_id = prev.id
          prev_subtype = prev.subtype
          if prev_id == GLYPH then
             prev_char = prev.char
          end
       end
       local is_glue = prev_id == GLUE
       local glue_wd
       if is_glue then
          glue_wd = prev.width
       end
       local realglue = is_glue and glue_wd > 1
       if FB_punct_thin[char] or FB_punct_thick[char] then
          local SBDP = has_attribute(item, addDPspace)
          local auto = SBDP and SBDP > 0
          if auto then
             if (prev_char and FB_punct_null[prev_char]) or
                (is_glue and glue_wd <= 1) or
                (prev_id == HLIST and prev_subtype == 3) or
                (prev_id == TEMP) then
                auto = false
             end
          end
          local fbglue
          if FB_punct_thick[char] then
             fbglue = new_glue_scaled(fid,colnwd,colnst,colnsh)
          else
             fbglue = new_glue_scaled(fid,thinwd,thinst,thinsh)
          end
          if (realglue or auto) and fbglue then
             if realglue then
                head = remove_node(head,prev,true)
             end
             insert_node_before(head, item, copy_node(nobreak))
             insert_node_before(head, item, copy_node(fbglue))
          end
       elseif SIG then
          local addgl = (prev_char and not FB_guil_null[prev_char]) or
                        (not prev_char and
                         prev_id ~= TEMP and
                         not (prev_id == HLIST and prev_subtype == 3)
                        )
          if is_glue and glue_wd <= 1 then
             addgl = false
          end
          local fbglue = new_glue_scaled(fid,guilwd,guilst,guilsh)
          if addgl and fbglue then
             if is_glue then
                head = remove_node(head,prev,true)
             end
             insert_node_before(head, item, copy_node(nobreak))
             insert_node_before(head, item, copy_node(fbglue))
          end
       end
    end
    if lang == FR and FRspacing and FB_punct_right[char]
                                and fid > 0 and SIG then
       local next = item.next
       local next_id, next_subtype, next_char, nextnext, kern_wd
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
                   if next_id == GLYPH then
                      next_char = nextnext.char
                   end
                end
             end
          end
       end
       local is_glue = next_id == GLUE
       if is_glue then
          glue_wd = next.width
       end
       local addgl = (next_char and not FB_guil_null[next_char]) or
                     (next and not next_char)
       if is_glue and glue_wd == 0 then
          addgl = false
       end
       local fid = item.font
       local fbglue = new_glue_scaled(fid,guilwd,guilst,guilsh)
       if addgl and fbglue then
          if is_glue then
             head = remove_node(head,next,true)
          end
          insert_node_after(head, item, copy_node(fbglue))
          insert_node_after(head, item, copy_node(nobreak))
       end
    end
  end
  return head
end
return french_punctuation
--  End of File frenchb.lua.
