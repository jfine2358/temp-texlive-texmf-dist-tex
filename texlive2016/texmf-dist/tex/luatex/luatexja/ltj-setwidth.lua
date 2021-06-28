--
-- src/ltj-setwidth.lua
--

luatexja.load_module('base');      local ltjb = luatexja.base
luatexja.load_module('stack');     local ltjs = luatexja.stack
luatexja.load_module('jfont');     local ltjf = luatexja.jfont
luatexja.load_module('direction'); local ltjd = luatexja.direction

local setfield = node.direct.setfield
local getfield = node.direct.getfield
local getid = node.direct.getid
local getfont = node.direct.getfont
local getlist = node.direct.getlist
local getchar = node.direct.getchar
local getsubtype = node.direct.getsubtype

local node_traverse_id = node.direct.traverse_id
local node_traverse = node.direct.traverse
local node_new = node.direct.new
local node_copy = node.direct.copy
local node_remove = node.direct.remove
local node_tail = node.direct.tail
local node_next = node.direct.getnext or node.next
local has_attr = node.direct.has_attribute
local set_attr = node.direct.set_attribute
local node_insert_before = node.direct.insert_before
local node_insert_after = node.direct.insert_after
local round = tex.round

local id_glyph = node.id('glyph')
local id_kern = node.id('kern')
local id_hlist = node.id('hlist')
local id_vlist = node.id('vlist')
local id_rule = node.id('rule')
local id_math = node.id('math')
local id_whatsit = node.id('whatsit')
local sid_save = node.subtype('pdf_save')
local sid_restore = node.subtype('pdf_restore')
local sid_matrix = node.subtype('pdf_setmatrix')
local dir_tate = luatexja.dir_table.dir_tate

local attr_ykblshift = luatexbase.attributes['ltj@ykblshift']
local attr_tkblshift = luatexbase.attributes['ltj@tkblshift']
local attr_icflag = luatexbase.attributes['ltj@icflag']

local ltjf_font_metric_table = ltjf.font_metric_table
local ltjf_font_extra_info = ltjf.font_extra_info

local PACKED       = luatexja.icflag_table.PACKED
local PROCESSED    = luatexja.icflag_table.PROCESSED

local get_pr_begin_flag
do
   local PROCESSED_BEGIN_FLAG = luatexja.icflag_table.PROCESSED_BEGIN_FLAG
   local floor = math.floor
   get_pr_begin_flag = function (p)
      local i = has_attr(p, attr_icflag) or 0
      return i - i%PROCESSED_BEGIN_FLAG
   end
end

local ltjw = {} --export
luatexja.setwidth = ltjw

luatexbase.create_callback("luatexja.set_width", "data",
			   function (fstable, fmtable, char_data)
			      return fstable
			   end)
local call_callback = luatexbase.call_callback

local fshift =  { down = 0, left = 0}

local min, max = math.min, math.max

local rule_subtype = (status.luatex_version>=85) and 3 or 0

-- 和文文字の位置補正（横）
local function capsule_glyph_yoko(p, met, char_data, head, dir)
   if not char_data then return node_next(p), head, p end
   fshift.down = char_data.down; fshift.left = char_data.left
   fshift = call_callback("luatexja.set_width", fshift, met, char_data)
   local kbl = has_attr(p, attr_ykblshift) or 0
   --
   -- f*: whd specified in JFM
   local fwidth, pwidth = char_data.width, getfield(p, 'width')
   fwidth = fwidth or pwidth
   local fheight, pheight = char_data.height, getfield(p, 'height')
   fheight = fheight or pheight
   local fdepth, pdepth =  char_data.depth,getfield(p, 'depth')
   fdepth = fdepth or pdepth
   if pwidth==fwidth then
      -- 補正後glyph node は ht: p.height - kbl - down, dp: p.depth + min(0, kbl+down) を持つ
      -- 設定されるべき寸法: ht: fheight - kbl, dp: fdepth + kbl
      local ht_diff = fheight + fshift.down - pheight
      local dp_diff = fdepth  + kbl - pdepth - min(kbl + fshift.down, 0)
      if ht_diff == 0 and dp_diff ==0 then -- offset only
	 set_attr(p, attr_icflag, PROCESSED)
	 setfield(p, 'xoffset', getfield(p, 'xoffset') - fshift.left)
	 setfield(p, 'yoffset', getfield(p, 'yoffset') - kbl - fshift.down)
	 return node_next(p), head, p
      elseif ht_diff >= 0 and dp_diff >=0 then -- rule
	 local box = node_new(id_rule,rule_subtype)
	 setfield(p, 'yoffset', getfield(p, 'yoffset') - kbl - fshift.down)
	 setfield(box, 'width', 0)
	 setfield(box, 'height', fheight - kbl)
	 setfield(box, 'depth', fdepth + kbl)
	 setfield(box, 'dir', dir)
	 set_attr(box, attr_icflag, PACKED)
	 --set_attr(p, attr_icflag, PACKED)
	 head = p and node_insert_before(head, p, box)
	    or node_insert_after(head, node_tail(head), box)
	 return node_next(p), head, p, box
      end
   end

   local q
   head, q = node_remove(head, p)
   setfield(p, 'yoffset', getfield(p, 'yoffset') -fshift.down);
   setfield(p, 'next', nil)
   setfield(p, 'xoffset', getfield(p, 'xoffset')
	       + char_data.align*(fwidth-pwidth) - fshift.left)
   local box = node_new(id_hlist)
   setfield(box, 'width', fwidth)
   setfield(box, 'height', fheight)
   setfield(box, 'depth', fdepth)
   setfield(box, 'head', p)
   setfield(box, 'shift', kbl)
   setfield(box, 'dir', dir)
   set_attr(box, attr_icflag, PACKED)
   head = q and node_insert_before(head, q, box)
      or node_insert_after(head, node_tail(head), box)
   return q, head, box
end

luatexja.setwidth.capsule_glyph_yoko = capsule_glyph_yoko

-- 和文文字の位置補正（縦）
local function capsule_glyph_tate(p, met, char_data, head, dir)
   if not char_data then return node_next(p), head end
   local ascent, descent = met.ascent, met.descent
   local fwidth, pwidth = char_data.width
   do
      local pf = getfont(p)
      local pc = getchar(p)
      setfield(p, 'char', pc)
      pwidth = ltjf_font_extra_info[pf] and  ltjf_font_extra_info[pf][pc]
	 and ltjf_font_extra_info[pf][pc].vwidth
	 and ltjf_font_extra_info[pf][pc].vwidth * met.size or (ascent+descent)
      pwidth = pwidth + (met.v_advance[pc] or 0)
      ascent = met.v_origin[pc] and ascent - met.v_origin[pc] or ascent
   end
   fwidth = fwidth or pwidth
   fshift.down = char_data.down; fshift.left = char_data.left
   fshift = call_callback("luatexja.set_width", fshift, met, char_data)
   local fheight = char_data.height or 0
   local fdepth  = char_data.depth or 0
   local y_shift
      = getfield(p, 'xoffset') + (has_attr(p,attr_tkblshift) or 0)
   local q
   head, q = node_remove(head, p)
   local box = node_new(id_hlist)
   setfield(box, 'width', fwidth)
   setfield(box, 'height', fheight)
   setfield(box, 'depth', fdepth)
   setfield(box, 'shift', y_shift)
   setfield(box, 'dir', dir)

   setfield(p, 'xoffset', - fshift.down)
   setfield(p, 'yoffset', getfield(p, 'yoffset') -(ascent
                                + char_data.align*(fwidth-pwidth) - fshift.left) )
   local ws = node_new(id_whatsit, sid_save)
   local wm = node_new(id_whatsit, sid_matrix)
   setfield(wm, 'data', '0 1 -1 0')
   local pwnh = -round(0.5*getfield(p, 'width'))
   local k2 = node_new(id_kern); setfield(k2, 'kern', pwnh)
   local k3 = node_new(id_kern); setfield(k3, 'kern', -getfield(p, 'width')-pwnh)
   local wr = node_new(id_whatsit, sid_restore)
   setfield(box, 'head', ws)
   setfield(ws, 'next', wm);  setfield(wm, 'next', k2);
   setfield(k2, 'next', p);   setfield(p, 'next', k3);
   setfield(k3, 'next', wr);

   set_attr(box, attr_icflag, PACKED)
   head = q and node_insert_before(head, q, box)
      or node_insert_after(head, node_tail(head), box)
   return q, head, box
end
luatexja.setwidth.capsule_glyph_tate = capsule_glyph_tate

local function capsule_glyph_math(p, met, char_data)
   if not char_data then return nil end
   local fwidth, pwidth = char_data.width, getfield(p, 'width')
   fwidth = (fwidth ~= 'prop') and fwidth or pwidth
   fshift.down = char_data.down; fshift.left = char_data.left
   fshift = call_callback("luatexja.set_width", fshift, met, char_data)
   local fheight, fdepth = char_data.height, char_data.depth
   local y_shift
      = - getfield(p, 'yoffset') + (has_attr(p,attr_ykblshift) or 0)
   setfield(p, 'yoffset', -fshift.down)
   setfield(p, 'xoffset', getfield(p, 'xoffset') + char_data.align*(fwidth-pwidth) - fshift.left)
   local box = node_new(id_hlist);
   setfield(box, 'width', fwidth)
   setfield(box, 'height', fheight)
   setfield(box, 'depth', fdepth)
   setfield(box, 'head', p)
   setfield(box, 'shift', y_shift)
   setfield(box, 'dir', tex.mathdir)
   set_attr(box, attr_icflag, PACKED)
   return box
end
luatexja.setwidth.capsule_glyph_math = capsule_glyph_math

-- 数式の位置補正
function luatexja.setwidth.apply_ashift_math(head, last, attr_ablshift)
   for p in node_traverse(head) do
      local pid = getid(p)
      if p==last then
	 return
      elseif (has_attr(p, attr_icflag) or 0) ~= PROCESSED then
	 if pid==id_hlist or pid==id_vlist then
	    setfield(p, 'shift', getfield(p, 'shift') +  (has_attr(p,attr_ablshift) or 0))
	 elseif pid==id_rule then
	    local v = has_attr(p,attr_ablshift) or 0
	    setfield(p, 'height', getfield(p, 'height')-v)
	    setfield(p, 'depth', getfield(p, 'depth')+v)
	    set_attr(p, attr_icflag, PROCESSED)
	 elseif pid==id_glyph then
	    -- 欧文文字; 和文文字は pid == id_hlist の場合で処理される
	    -- (see conv_jchar_to_hbox_A in ltj-math.lua)
	    setfield(p, 'yoffset',
		     getfield(p, 'yoffset') - (has_attr(p,attr_ablshift) or 0))
	 end
      end
   end
end

-- discretionary の位置補正
do
   local attr_yablshift = luatexbase.attributes['ltj@yablshift']
   local attr_tablshift = luatexbase.attributes['ltj@tablshift']
   local attr_ablshift
   local disc, tex_dir
   local function ashift_disc_inner(field)
      local head = getfield(disc, field)
      if not head then return end
      local y_adjust, node_depth, adj_depth = 0, 0, 0
      for lp in node_traverse_id(id_glyph, head) do
	 y_adjust = has_attr(lp,attr_ablshift) or 0
	 node_depth = max(getfield(lp, 'depth') + min(y_adjust, 0), node_depth)
	 adj_depth = (y_adjust>0) and max(getfield(lp, 'depth') + y_adjust, adj_depth) or adj_depth
	 setfield(lp, 'yoffset', getfield(lp, 'yoffset') - y_adjust)
      end
      if adj_depth>node_depth then
	 local r = node_new(id_rule,rule_subtype)
	 setfield(r, 'width', 0); setfield(r, 'height', 0)
	 setfield(r, 'depth', adj_depth); setfield(r, 'dir', tex_dir)
	 set_attr(r, attr_icflag, PROCESSED)
	 if field=='post' then
	    node_insert_after(head, head, r)
	 else
	    setfield(disc, field, (node_insert_before(head, head, r)))
	 end
      end
   end
   function luatexja.setwidth.apply_ashift_disc(d, is_dir_tate, dir)
      attr_ablshift = is_dir_tate and attr_tablshift or attr_yablshift
      disc, tex_dir = d, dir
      ashift_disc_inner('pre')
      ashift_disc_inner('post')
      ashift_disc_inner('replace')
   end
end