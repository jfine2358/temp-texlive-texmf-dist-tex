--[[
This file is part of the `arabluatex' package

ArabLuaTeX -- Processing ArabTeX notation under LuaLaTeX
Copyright (C) 2016--2020  Robert Alessi

Please send error reports and suggestions for improvements to Robert
Alessi <alessi@robertalessi.net>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see
<http://www.gnu.org/licenses/>.
--]]

tanwinnv = {
   -- assimilations (begin). These are good but may not apply here.
--   {a="(O[%S]-)(%-?[uai]N[UI]?)(O)([rlmnwy])", b="%4%4"},
--   {a="(%-?[uai]NU)(%s)([rlmnwy])", b="%1%2%3%3"},
   -- assimilations (end)
   {a="%-?uNU", b="و"},
   {a="%-?aNU", b="وا"},
   {a="%-?iNU", b="و"},
   -- assimilations (begin). These are good but may not apply here.
--   {a="%-?(uN)(%s)([rlmnwy])", b="|%2%3%3"},
--   {a="(O[%S]-)(%-?aN)(_A)(O)([rlmnwy])", b="%5%5"},
--   {a="(O[%S]-)(%-?aN)(Y)(O)([rlmnwy])", b="%5%5"},
--   {a="%-?(aN)(_A)(%s)([rlmnwy])", b="ى%3%4%4"},
--   {a="%-?(aN)(Y)(%s)([rlmnwy])", b="ى%3%4%4"},
--   {a="(T)%-?(aN)(%s)([rlmnwy])", b="%1%3%4%4"},
--   {a="(ء)%-?(aN)(%s)([rlmnwy])", b="%1%3%4%4"},
--   {a="([^TA])%-?(aN)(%s)([rlmnwy])", b="%1ا%3%4%4"},
--   {a="%-?(iNI?)(%s)([rlmnwy])", b="|%2%3%3"},
   -- assimilations (end)
   -- "quoted" tanwīn (begin)
   {a="%-?(\"uN)", b="ٌ"},
   {a="(B)%-?(\"aN)", b="%1ً"},
   {a="%-?(\"aN)(_A)", b="ًى"},
   {a="%-?(\"aN)(Y)", b="ًى"},
   {a="(T)%-?(\"aN)", b="%1ً"},
   {a="([اآ])(ء)%-?(\"aN)", b="%1%2ً"}, --new
   {a="([^TA])%-?(\"aN)", b="%1ًا"},
   {a="%-?(\"iNI?)", b="ٍ"},
   -- "quoted" tanwīn (end)
   {a="%-?(uN)", b=""},
   {a="(B)%-?(aN)", b="%1"},
   -- needed by \arbcolor:
   {a="%-?(aN)(O[%S]-%_AO)", b=""},
   {a="%-?(aN)(O[%S]-YO)", b=""},
   {a="(O[%S]-TO)%-?(aN)", b=""},
   {a="(O[%S]-)([اآ])(ء)(O)%-?(aN)", b=""}, --new
   {a="(O[%S]-[^TA]O)%-?(aN)", b=""},
   --
   {a="%-?(aN)(_A)", b="ى"},
   {a="%-?(aN)(Y)", b="ى"},
   {a="(T)%-?(aN)", b="%1"},
   {a="([اآ])(ء)%-?(aN)", b="%1%2"}, --new
   {a="([^TA])%-?(aN)", b="%1ا"},
   {a="%-?(iNI?)", b=""},
   -- ʾalif al-waṣl: put it back on with \arbnull
   {a="(O[%S]-)([%'a]l%-)(O)(\"?[uai])", b="%4"},
   -- initial straight double quote gives a connective ʾalif. This has
   -- nothing to do with the tanwīn, but I put it here for time being.
   {a="^\"", b="ٱ"},
   {a="([%s%-])\"", b="%1ٱ"}
}

trigraphsnv = { -- trigraphs or more
   -- Allah
   {a="l%-l_ah", b="l-ll_ah"},
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="ال%1%2"},
   {a="([%(%[%|%<%s%-])'ll(a)([%_]?[dt])", b="%1ال%2%3"}, --p
   -- al- + lām
   {a="^(a)l%-(l)", b="ا%1ل%2"},
   {a="([%(%[%|%<%s%-])(a)l%-(l)", b="%1ا%2ل%3"}, --p
   -- al- + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="ا%1ل%2"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-])(a)l%-(%^n)", b="%1ا%2ل%3"}, -- ^n is lunar --p   
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="ا%1ل%2"},
   {a="([%(%[%|%<%s%-])(a)l%-([%_%^%.]?[tdrzsnc])", b="%1ا%2ل%3"}, --p
   -- assim. art. + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)(%^n)%-", b="ا%1ل"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-])(a)(%^n)%-", b="%1ا%2ل"}, -- ^n is lunar --p
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="ا%1ل"},
   {a="([%(%[%|%<%s%-])(a)([%_%^%.]?[tdrzsnc])%-", b="%1ا%2ل"}, --p
   -- al- + initial unstable hamza
   {a="^(a)l%-(\")([uai])", b="ا%1لٱ%3"},
   {a="([%(%[%|%<%s%-])(a)l%-(\")([uai])", b="%1ا%2لٱ%4"}, --p
   {a="^(a)l%-([uai])", b="ا%1لا%2"},
   {a="([%(%[%|%<%s%-])(a)l%-([uai])", b="%1ا%2لا%3"}, --p
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-(\")([uai])", b="ل%1لٱ%3"},
   {a="l([ai])%-l%-([uai])", b="ل%1لا%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="ا%1ل"},
   {a="([%(%[%|%<%s%-])(a)l%-", b="%1ا%2ل"}, --p
   -- art. with waṣla + lām
   {a="'l%-(l)", b="ال%1"},
   -- art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="ال%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="ال%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="ل%1%2"},
   -- assim. art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'(%^n)%-", b="ال"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="ال"},
   -- li-/la- + art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="ل%1ل%2"}, -- ^n is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%2"},
   -- li-/la + assim. art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="ل%1ل%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\")([uai])", b="الٱ%2"},
   {a="'l%-([uai])", b="الا%1"},   
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="ال"},
   -- the silent wāw
   {a="uU(%p*)$", b="uو%1"},
   {a="uU(%p*%s)", b="uو%1"},
   {a="aU(%p*)$", b="aو%1"},
   {a="aU(%p*%s)", b="aو%1"},
   {a="iU(%p*)$", b="iو%1"},
   {a="iU(%p*%s)", b="iو%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="%1وا"},
   {a="(_a)U", b="%1و"},
   {a="(_a)I", b="%1ي"}
}

longvnv = {
   {a="\"A", b="َا"},
   {a="\"U", b="ُو"},
   {a="\"I", b="ِي"},
   {a="\"Y", b="aى"},
   {a="A", b="ا"},
   {a="U", b="و"},
   {a="I", b="ي"},
   {a="Y", b="ى"},
}

shortvnv = {
   {a="\"u", b="ُ"},
   {a="\"a", b="َ"},
   {a="\"i", b="ِ"},
   {a="%-?%.u", b="ُ"},
   {a="%-?%.a", b="َ"},
   {a="%-?%.i", b="ِ"},
   {a="u", b=""},
   {a="a", b=""},
   {a="i", b=""}
}
