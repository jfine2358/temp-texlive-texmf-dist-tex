-- -*- coding: utf-8 -*-
-- jfm-ujisv.lua: LuaTeX-ja 標準 JFM（縦組み用）
-- based on upnmlminr-h.tfm (a metric in UTF/OTF package used by upTeX).

-- JIS X 4051:2004 では，行末の句読点や中点はベタなのでそれに従う
-- kanjiskip:    0pt plus .25zw minus 0pt
-- xkanjiskip: .25zw plus .25zw (or .0833zw) minus .125zw


luatexja.jfont.define_jfm {
   dir = 'tate',
   zw = 1.0, zh = 1.0,
   kanjiskip =  { 0.0, 0.25, 0 },
   xkanjiskip = { 0.25, 0.25, .125 },
   [0] = {
      align = 'middle', left = 0.00, down = 0.00,
      width = 1.0, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
	 [1] = { 0.5 , 0.0, 0.5,  ratio=1, kanjiskip_stretch=1 },
	 [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [7] = { 0, 0, 0, kanjiskip_shrink=1 },
         [8] = { 0, 0, 0, kanjiskip_shrink=1 },
      }
   },

   [1] = { -- 開き括弧類
      chars = {
	 '‘', '“', '〈', '《', '「', '『', '【', '〔', '〖',
	 '〘', '〝', '（', '［', '｛', '｟'
      },
      align = 'right', left = 0.0, down = 0.0,
      width = 0.5, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
-- 3 のみ四分，あとは0
         [0] = { 0, 0, 0, kanjiskip_shrink=1 },
         [1] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [2] = { 0, 0, 0, kanjiskip_stretch=1, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [5] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [7] = { 0, 0, 0, kanjiskip_shrink=1 },
         [8] = { 0, 0, 0, kanjiskip_shrink=1 },
      }
   },

   [2] = { -- 閉じ括弧類
      chars = {
	 '’', '”', '〉', '》', '」', '』', '】', '〕',
	 '〗', '〙', '〟', '）', '］', '｝', '｠', '、', '，'
      },
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
-- 3 は四分, 2, 4, 9 は0, あとは0.5
	 [0] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [1] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
         [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
         [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [5] = { 0.5 , 0.0, 0.5, rario=0, kanjiskip_stretch=1 },
	 [6] = { 0.5 , 0.0, 0.5, rario=0, kanjiskip_stretch=1 },
	 [7] = { 0.5 , 0.0, 0.5, rario=0, kanjiskip_stretch=1 },
	 [8] = { 0.5 , 0.0, 0.5, rario=0, kanjiskip_stretch=1 },
      }
   },

   [3] = { -- 中点類
      chars = {'・', '：', '；'},
      align = 'middle', left = 0.0, down = 0.0,
      width = 0.5, height = 0.50, depth = 0.50, italic=0.0,
      --end_stretch = 0.25,
      glue = {
-- 3 のみ 0.5，あとは0.25
	 [0] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [1] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [2] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [3] = { 0.5 , 0.0, 0.25, priority=1 },
	 [4] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [5] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [6] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [7] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [8] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
      }
   },

   [4] = { -- 句点類
      chars = {'。', '．'},
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
-- 3 は.75, 2, 4 は0, あとは0.5
	 [0] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [1] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [3] = { 0.75, 0.0, 0.25, priority=1, ratio=1./3, kanjiskip_stretch=1 },
	 [5] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [6] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [7] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
	 [8] = { 0.5 , 0.0, 0.5, ratio=0, kanjiskip_stretch=1 },
      }
   },

   [5] = { -- ダッシュ
      chars = { '—', '―', '‥', '…', '〳', '〴', '〵', },
      align = 'left', left = 0.0, down = 0.0,
      width = 1.0, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
	 [1] = { 0.5 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
      },
      kern = {
	 [5] = 0.0
      }
   },

   [6] = { -- 感嘆符・疑問符
      chars = { '？', '！', '‼', '⁇', '⁈', '⁉', },
      align = 'left', left = 0.0, down = 0.0,
      width = 1.0, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
         [0] = { 1.0 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [1] = { 0.5 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.75, 0.0, 0.25, priority=1, ratio=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [7] = { 0.5 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [8] = { 0, 0, 0, kanjiskip_shrink=1 },
      },
      kern = {
	 [5] = 0.0
      }
   },

   [7] = { -- 半角カナ
      chars = {
	 '｡', '｢', '｣', '､', '･', 'ｦ', 'ｧ', 'ｨ', 'ｩ',
	 'ｪ', 'ｫ', 'ｬ', 'ｭ', 'ｮ', 'ｯ', 'ｰ', 'ｱ', 'ｲ',
	 'ｳ', 'ｴ', 'ｵ', 'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ', 'ｻ',
	 'ｼ', 'ｽ', 'ｾ', 'ｿ', 'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ',
	 'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ', 'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ',
	 'ﾎ', 'ﾏ', 'ﾐ', 'ﾑ', 'ﾒ', 'ﾓ', 'ﾔ', 'ﾕ', 'ﾖ',
	 'ﾗ', 'ﾘ', 'ﾙ', 'ﾚ', 'ﾛ', 'ﾜ', 'ﾝ', 'ﾞ', 'ﾟ',
	 "AJ1-516", "AJ1-517", "AJ1-518", "AJ1-519", "AJ1-520", "AJ1-521", "AJ1-522",
	 "AJ1-523", "AJ1-524", "AJ1-525", "AJ1-526", "AJ1-527", "AJ1-528", "AJ1-529",
	 "AJ1-530", "AJ1-531", "AJ1-532", "AJ1-533", "AJ1-534", "AJ1-535", "AJ1-536",
	 "AJ1-537", "AJ1-538", "AJ1-539", "AJ1-540", "AJ1-541", "AJ1-542", "AJ1-543",
	 "AJ1-544", "AJ1-545", "AJ1-546", "AJ1-547", "AJ1-548", "AJ1-549", "AJ1-550",
	 "AJ1-551", "AJ1-552", "AJ1-553", "AJ1-554", "AJ1-555", "AJ1-556", "AJ1-557",
	 "AJ1-558", "AJ1-559", "AJ1-560", "AJ1-561", "AJ1-562", "AJ1-563", "AJ1-564",
	 "AJ1-565", "AJ1-566", "AJ1-567", "AJ1-568", "AJ1-569", "AJ1-570", "AJ1-571",
	 "AJ1-572", "AJ1-573", "AJ1-574", "AJ1-575", "AJ1-576", "AJ1-577", "AJ1-578",
	 "AJ1-579", "AJ1-580", "AJ1-581", "AJ1-582", "AJ1-583", "AJ1-584", "AJ1-585",
	 "AJ1-586", "AJ1-587", "AJ1-588", "AJ1-589", "AJ1-590", "AJ1-591", "AJ1-592",
	 "AJ1-593", "AJ1-594", "AJ1-595", "AJ1-596", "AJ1-597", "AJ1-598",
      },
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.5, depth = 0.5, italic=0.0,
      glue = {
	 [1] = { 0.5 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [7] = { 0, 0, 0, kanjiskip_shrink=1 },
         [8] = { 0, 0, 0, kanjiskip_shrink=1 },
      }
   },

   [8] = { -- 罫線類．
      chars = {
	 '─', '━', '│', '┃', '┄', '┅', '┆', '┇',
	 '┈', '┉', '┊', '┋', '┌', '┍', '┎', '┏',
	 '┐', '┑', '┒', '┓', '└', '┕', '┖', '┗',
	 '┘', '┙', '┚', '┛', '├', '┝', '┞', '┟',
	 '┠', '┡', '┢', '┣', '┤', '┥', '┦', '┧',
	 '┨', '┩', '┪', '┫', '┬', '┭', '┮', '┯',
	 '┰', '┱', '┲', '┳', '┴', '┵', '┶', '┷',
	 '┸', '┹', '┺', '┻', '┼', '┽', '┾', '┿',
	 '╀', '╁', '╂', '╃', '╄', '╅', '╆', '╇',
	 '╈', '╉', '╊', '╋', '╌', '╍', '╎', '╏',
	 '═', '║', '╒', '╓', '╔', '╕', '╖', '╗',
	 '╘', '╙', '╚', '╛', '╜', '╝', '╞', '╟',
	 '╠', '╡', '╢', '╣', '╤', '╥', '╦', '╧',
	 '╨', '╩', '╪', '╫', '╬', '╭', '╮', '╯',
	 '╰', '╱', '╲', '╳', '╴', '╵', '╶', '╷',
	 '╸', '╹', '╺', '╻', '╼', '╽', '╾', '╿',
      },
      align = 'left', left = 0.0, down = 0.0,
      width = 1.0, height = 0.50, depth = 0.50, italic=0.0,
      glue = {
	 [1] = { 0.5 , 0.0, 0.5, ratio=1, kanjiskip_stretch=1 },
	 [2] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [3] = { 0.25, 0.0, 0.25, priority=1, ratio=1 },
	 [4] = { 0, 0, 0, kanjiskip_shrink=1 },
	 [6] = { 0, 0, 0, kanjiskip_shrink=1 },
      },
      kern = {
	 [8] = 0.0
      }
   },

   [99] = { -- box末尾
      chars = {'boxbdd', 'parbdd'},
      glue = {
	 [3] = { 0.25, 0.0, 0.25, priority=1 },
      }
   },

}