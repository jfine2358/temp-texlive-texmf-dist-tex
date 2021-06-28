--[[
This file is part of the `arabluatex' package

ArabLuaTeX -- Processing ArabTeX notation under LuaLaTeX
Copyright (C) 2016  Robert Alessi

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

hamzafv = {
   -- hard coded hamza
   {a="|\"'", b="ء"},
   {a="A\"'", b="آ"},
   {a="[au]\"'", b="أ"},
   {a="w\"'", b="ؤ"},
   {a="i\"'", b="إ"},
   {a="y\"'", b="ئ"},
   {a="ؤ([^uaiUAI])", b="ؤْ%1"},
   {a="ؤ$", b="ؤْ"},
   {a="ؤ(%s)", b="ؤْ%1"},
   {a="أ([^uaiUAI])", b="أْ%1"},
   {a="أ$", b="أْ"},
   {a="أ(%s)", b="أْ%1"},
   {a="ئ([^uaiUAI])", b="ئْ%1"},
   {a="ئ$", b="ئْ"},
   {a="ئ(%s)", b="ئْ%1"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ؤؤ%1"},
   {a="''([Aa])", b="أأ%1"},
   {a="''([Ii])", b="ئئ%1"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="أU"},
   {a="%'%_I", b="إI"},
   -- taḫfīfu 'l-hamza
   {a="'u'([^uaiUAI])", b="أU%1"},
   {a="'i'([^uaiUAI])", b="إI%1"},   
   -- madda (historic writing below)
   {a="'a'([^uaiUAI])", b="آ%1"},
   {a="'a?A([%_%^%.]?[%`%'btjghdrzsfqklmnywAY])", b="آ%1"},
   {a="(A)(')(uN?)$", b="aآء%3"},
   {a="(A)(')(uN?)(%W)", b="aآء%3%4"},
   {a="(A)(')(iN?)$", b="aآء%3"},
   {a="(A)(')(iN?)(%W)", b="aآء%3%4"},
   {a="(A)(')(i)", b="aآئ%3"}, -- historic madda
   {a="(A)(')(u)", b="aآؤ%3"}, -- historic madda
   {a="(A)(')", b="aآء"}, -- historic madda
   -- initial (needs both ^ and %W patterns)
   {a="^(')([ua])", b="أ%2"},
   {a="^(')(i)", b="إ%2"},
   {a="(%W)(')([ua])", b="%1أ%3"},
   {a="(%W)(')(i)", b="%1إ%3"},
   -- final
   -- ^say'aN and .zim'aN are special orthographies
   {a="(%^say)(%')(aN)", b="%1ئ%3"},
   {a="(.zi?m)(%')(aN)", b="%1ئ%3"},
   {a="([^uai])(')([uai]N?)$", b="%1ء%3"},
   {a="([^uai])(')([uai]N?)(%W)", b="%1ء%3%4"},
-- u
   {a="(u)(')([uai]?N)$", b="%1ؤ%3"},
   {a="(u)(')([uai]N?)(%W)", b="%1ؤ%3%4"},
   {a="(u)(')$", b="%1ؤْ"},
   {a="(u)(')(%W)", b="%1ؤْ%3"},
-- a
   {a="(a)(')(A)$", b="%1آ"},
   {a="(a)(')(A)(%W)", b="%1آ%4"},
   {a="(a)(')([u]N?)$", b="%1أ%3"},
   {a="(a)(')([u]N?)(%W)", b="%1أ%3%4"},
   {a="(a)(')(a)$", b="%1أ%3"},
   {a="(a)(')(a)(%W)", b="%1أ%3%4"},
   {a="(a)(')(aN)$", b="%1أً"},
   {a="(a)(')(aN)(%W)", b="%1أً%4"},
   {a="(a)(')([i]N?)$", b="%1إ%3"},
   {a="(a)(')([i]N?)(%W)", b="%1إ%3%4"},
   {a="(a)(')$", b="%1أْ"},
   {a="(a)(')(%W)", b="%1أْ%3"},
-- i
   {a="(i)(')([uai]N?)$", b="%1ئ%3"},
   {a="(i)(')([uai]N?)(%W)", b="%1ئ%3%4"},
   {a="(i)(')$", b="%1ئْ"},
   {a="(i)(')(%W)", b="%1ئْ%3"},
--
   -- middle
   {a="(U)(')", b="%1ء"},
   {a="([Iy])(')", b="%1ئ"},
   {a="([^uai])(')([uU])", b="%1ؤ%3"},
   {a="([^uai])(')([aA])", b="%1أ%3"},
   {a="([^uai])(')([iI])", b="%1ئ%3"},
   {a="(u)(')([uU])", b="%1ؤ%3"},
   {a="(u)(')([aA])", b="%1ؤ%3"},
   {a="(u)(')([iI])", b="%1ئ%3"},
   {a="(a)(')([aA])", b="%1أ%3"},
   {a="(a)(')([uU])", b="%1ؤ%3"},
   {a="(a)(')([iI])", b="%1ئ%3"},
   {a="(i)(')([aA])", b="%1ئ%3"},
   {a="(i)(')([uU])", b="%1ئ%3"},
   {a="(i)(')([iI])", b="%1ئ%3"},
   {a="(a)(')([^uaiUAI])", b="%1أْ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ؤْ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ئْ%3"}
}

hamzafveasy = { -- differences marked below with 'easy'
   -- hard coded hamza
   {a="|\"'", b="ء"},
   {a="A\"'", b="آ"},
   {a="[au]\"'", b="أ"},
   {a="w\"'", b="ؤ"},
   {a="i\"'", b="إ"},
   {a="y\"'", b="ئ"},
   {a="ؤ([^uaiUAI])", b="ؤْ%1"},
   {a="ؤ$", b="ؤْ"},
   {a="ؤ(%s)", b="ؤْ%1"},
   {a="أ([^uaiUAI])", b="أْ%1"},
   {a="أ$", b="أْ"},
   {a="أ(%s)", b="أْ%1"},
   {a="ئ([^uaiUAI])", b="ئْ%1"},
   {a="ئ$", b="ئْ"},
   {a="ئ(%s)", b="ئْ%1"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ؤؤ%1"},
   {a="''([Aa])", b="أأ%1"},
   {a="''([Ii])", b="ئئ%1"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="أU"},
   {a="%'%_I", b="إI"},
   -- taḫfīfu 'l-hamza
   {a="'u'([^uaiUAI])", b="أU%1"},
   {a="'i'([^uaiUAI])", b="إI%1"},   
   -- madda (historic writing below)
   {a="'a'([^uaiUAI])", b="آ%1"},
   {a="'a?A([%_%^%.]?[%`%'btjghdrzsfqklmnywAY])", b="آ%1"},
--easy   {a="(A)(')(uN?)$", b="aآء%3"},
--easy   {a="(A)(')(uN?)(%W)", b="aآء%3%4"},
--easy   {a="(A)(')(iN?)$", b="aآء%3"},
--easy   {a="(A)(')(iN?)(%W)", b="aآء%3%4"},
--easy   {a="(A)(')(i)", b="aآئ%3"}, -- historic madda
--easy   {a="(A)(')(u)", b="aآؤ%3"}, -- historic madda
--easy   {a="(A)(')", b="aآء"}, -- historic madda
   -- initial (needs both ^ and %W patterns)
   {a="^(')([ua])", b="أ%2"},
   {a="^(')(i)", b="إ%2"},
   {a="(%W)(')([ua])", b="%1أ%3"},
   {a="(%W)(')(i)", b="%1إ%3"},
   -- final
   -- ^say'aN and .zim'aN are special orthographies
   {a="(%^say)(%')(aN)", b="%1ئ%3"},
   {a="(.zi?m)(%')(aN)", b="%1ئ%3"},
   {a="([^uai])(')([uai]N?)$", b="%1ء%3"},
   {a="([^uai])(')([uai]N?)(%W)", b="%1ء%3%4"},
-- u
   {a="(u)(')([uai]?N)$", b="%1ؤ%3"},
   {a="(u)(')([uai]N?)(%W)", b="%1ؤ%3%4"},
   {a="(u)(')$", b="%1ؤْ"},
   {a="(u)(')(%W)", b="%1ؤْ%3"},
-- a
   {a="(a)(')(A)$", b="%1آ"},
   {a="(a)(')(A)(%W)", b="%1آ%4"},
   {a="(a)(')([u]N?)$", b="%1أ%3"},
   {a="(a)(')([u]N?)(%W)", b="%1أ%3%4"},
   {a="(a)(')(a)$", b="%1أ%3"},
   {a="(a)(')(a)(%W)", b="%1أ%3%4"},
   {a="(a)(')(aN)$", b="%1أً"},
   {a="(a)(')(aN)(%W)", b="%1أً%4"},
   {a="(a)(')([i]N?)$", b="%1إ%3"},
   {a="(a)(')([i]N?)(%W)", b="%1إ%3%4"},
   {a="(a)(')$", b="%1أْ"},
   {a="(a)(')(%W)", b="%1أْ%3"},
-- i
   {a="(i)(')([uai]N?)$", b="%1ئ%3"},
   {a="(i)(')([uai]N?)(%W)", b="%1ئ%3%4"},
   {a="(i)(')$", b="%1ئْ"},
   {a="(i)(')(%W)", b="%1ئْ%3"},
--
   -- middle
   {a="(U)(')", b="%1ء"},
   {a="([Iy])(')", b="%1ئ"},
   {a="([^uai])(')([uU])", b="%1ؤ%3"},
   {a="([^uai])(')([aA])", b="%1أ%3"},
   {a="([^uai])(')([iI])", b="%1ئ%3"},
   {a="(u)(')([uU])", b="%1ؤ%3"},
   {a="(u)(')([aA])", b="%1ؤ%3"},
   {a="(u)(')([iI])", b="%1ئ%3"},
   {a="(a)(')([aA])", b="%1أ%3"},
   {a="(a)(')([uU])", b="%1ؤ%3"},
   {a="(a)(')([iI])", b="%1ئ%3"},
   {a="(i)(')([aA])", b="%1ئ%3"},
   {a="(i)(')([uU])", b="%1ئ%3"},
   {a="(i)(')([iI])", b="%1ئ%3"},
   {a="(a)(')([^uaiUAI])", b="%1أْ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ؤْ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ئْ%3"}
}

tanwinfv = {
   {a="uNU", b="ٌو"},
   {a="aNU", b="ًوا"},
   {a="iNU", b="ٍو"},
   {a="([uai]N)(%s)([uai])", b="%1%2ٱ"},
   {a="(aN[%_]?[AY])(%s)([uai])", b="%1%2ٱ"},
   -- assimilations (begin)
   {a="(uN)(%s)([rlmnwy])", b="ٌ%2%3%3"},
   {a="(aN)(_A)(%s)([rlmnwy])", b="ًى%3%4%4"},
   {a="(aN)(Y)(%s)([rlmnwy])", b="ًى%3%4%4"},
   {a="(T)(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
   {a="(ء)(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
   {a="([^TA])(aN)(%s)([rlmnwy])", b="%1ًا%3%4%4"},
   {a="(iN)(%s)([rlmnwy])", b="ٍ%2%3%3"},
   -- assimilations (end)
   -- quoted tanwīn (begin)
   {a="(\"uN)", b=""},
   {a="(B)(\"aN)", b="%1"},
   {a="(\"aN)(_A)", b="ى"},
   {a="(\"aN)(Y)", b="ى"},
   {a="(T)(\"aN)", b="%1"},
   {a="(ء)(\"aN)", b="%1"},
   {a="([^TA])(\"aN)", b="%1ا"},
   {a="(\"iN)", b=""},
   -- quoted tanwīn (end)
   {a="(uN)", b="ٌ"},
   {a="(B)(aN)", b="%1ً"},
   {a="(aN)(_A)", b="ًى"},
   {a="(aN)(Y)", b="ًى"},
   {a="(T)(aN)", b="%1ً"},
   {a="(ء)(aN)", b="%1ً"},
   {a="([^TA])(aN)", b="%1ًا"},
   {a="(iN)", b="ٍ"}
}

tanwinfveasy = { -- no assimilations (see below)
   {a="uNU", b="ٌو"},
   {a="aNU", b="ًوا"},
   {a="iNU", b="ٍو"},
   {a="([uai]N)(%s)([uai])", b="%1%2ٱ"},
   {a="(aN[%_]?[AY])(%s)([uai])", b="%1%2ٱ"},
   -- assimilations (begin)
--easy   {a="(uN)(%s)([rlmnwy])", b="ٌ%2%3%3"},
--easy   {a="(aN)(_A)(%s)([rlmnwy])", b="ًى%3%4%4"},
--easy   {a="(aN)(Y)(%s)([rlmnwy])", b="ًى%3%4%4"},
--easy   {a="(T)(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
--easy   {a="(ء)(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
--easy   {a="([^TA])(aN)(%s)([rlmnwy])", b="%1ًا%3%4%4"},
--easy   {a="(iN)(%s)([rlmnwy])", b="ٍ%2%3%3"},
   -- assimilations (end)
   -- quoted tanwīn (begin)
   {a="(\"uN)", b=""},
   {a="(B)(\"aN)", b="%1"},
   {a="(\"aN)(_A)", b="ى"},
   {a="(\"aN)(Y)", b="ى"},
   {a="(T)(\"aN)", b="%1"},
   {a="(ء)(\"aN)", b="%1"},
   {a="([^TA])(\"aN)", b="%1ا"},
   {a="(\"iN)", b=""},
   -- quoted tanwīn (end)
   {a="(uN)", b="ٌ"},
   {a="(B)(aN)", b="%1ً"},
   {a="(aN)(_A)", b="ًى"},
   {a="(aN)(Y)", b="ًى"},
   {a="(T)(aN)", b="%1ً"},
   {a="(ء)(aN)", b="%1ً"},
   {a="([^TA])(aN)", b="%1ًا"},
   {a="(iN)", b="ٍ"}
}

trigraphsfv = { -- trigraphs or more
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="ٱلّ%1%2"},
   {a="([%s%-])'ll(a)([%_]?[dt])", b="%1ٱلّ%2%3"},
   -- al- + lām
   {a="^(a)l%-(l)", b="ا%1ل%2%2"},
   {a="([%s%-])(a)l%-(l)", b="%1ا%2ل%3%3"},
   -- al- + solar consonant
   {a="^(a)l%-([%_%^%.]?[tdrzsn])", b="ا%1ل%2%2"},
   {a="([%s%-])(a)l%-([%_%^%.]?[tdrzsn])", b="%1ا%2ل%3%3"},
   -- assim. art. + solar consonant
   {a="^(a)([%_%^%.]?[tdrzsn])%-", b="ا%1ل%2"},
   {a="([%s%-])(a)([%_%^%.]?[tdrzsn])%-", b="%1ا%2ل%3"},
   -- al- + initial unstable hamza
   {a="^(a)l%-(\"?[uai])", b="ا%1لٱ%2"},
   {a="([%s%-])(a)l%-(\"?[uai])", b="%1ا%2لٱ%3"},
   -- li-/la + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-(\"?[uai])", b="ل%1لٱ%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="ا%1لْ"},
   {a="([%s%-])(a)l%-", b="%1ا%2لْ"},
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="awuا%2%3"},
   {a="(aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1u%2%3"},
   {a="(ay)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="ٱل%1%1"},
   -- art. with waṣla + solar consonant
   {a="'l%-([%_%^%.]?[tdrzsn])", b="ٱل%1%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="ل%1%2%2"},
   -- assim. art. with waṣla + solar consonant
   {a="'([%_%^%.]?[tdrzsn])%-", b="ٱل%1"},
   -- li-/la- + art. + solar consonant is a special orthography
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsn])", b="ل%1ل%2%2"},
   -- li-/la- + assim. art. + solar consonant is a special orthography
   {a="l([ai])%-([%_%^%.]?[tdrzsn])%-([%_%^%.]?[tdrzsn])", b="ل%1ل%3%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\"?[uai])", b="ٱلٱ%1"},   
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="ٱلْ"},
   -- the silent wāw
   {a="uU$", b="uو"},
   {a="uU(%W)", b="uو%1"},
   {a="aU$", b="aو"},
   {a="aU(%W)", b="aو%1"},
   {a="iU$", b="iو"},
   {a="iU(%W)", b="iو%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="%1وا"},
   {a="(_a)U", b="%1و"},
   {a="(_a)I", b="%1ي"},
   -- assimilations
   {a="(n)(%s)([rlmnwy])", b="%1%2%3%3"}
}

trigraphsfveasy = { -- trigraphs or more (see 'easy' tag below for the diffs)
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="ٱلّ%1%2"},
   {a="([%s%-])'ll(a)([%_]?[dt])", b="%1ٱلّ%2%3"},
   -- al- + lām
   {a="^(a)l%-(l)", b="ا%1ل%2%2"},
   {a="([%s%-])(a)l%-(l)", b="%1ا%2ل%3%3"},
   -- al- + solar consonant
   {a="^(a)l%-([%_%^%.]?[tdrzsn])", b="ا%1ل%2%2"},
   {a="([%s%-])(a)l%-([%_%^%.]?[tdrzsn])", b="%1ا%2ل%3%3"},
   -- assim. art. + solar consonant
   {a="^(a)([%_%^%.]?[tdrzsn])%-", b="ا%1ل%2"},
   {a="([%s%-])(a)([%_%^%.]?[tdrzsn])%-", b="%1ا%2ل%3"},
   -- al- + initial unstable hamza
   {a="^(a)l%-(\"?[uai])", b="ا%1لٱ%2"},
   {a="([%s%-])(a)l%-(\"?[uai])", b="%1ا%2لٱ%3"},
   -- li-/la + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-(\"?[uai])", b="ل%1لٱ%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="ا%1لْ"},
   {a="([%s%-])(a)l%-", b="%1ا%2لْ"},
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="awuا%2%3"},
   {a="(aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1u%2%3"},
   {a="(ay)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="ٱل%1%1"},
   -- art. with waṣla + solar consonant
   {a="'l%-([%_%^%.]?[tdrzsn])", b="ٱل%1%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="ل%1%2%2"},
   -- assim. art. with waṣla + solar consonant
   {a="'([%_%^%.]?[tdrzsn])%-", b="ٱل%1"},
   -- li-/la- + art. + solar consonant is a special orthography
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsn])", b="ل%1ل%2%2"},
   -- li-/la- + assim. art. + solar consonant is a special orthography
   {a="l([ai])%-([%_%^%.]?[tdrzsn])%-([%_%^%.]?[tdrzsn])", b="ل%1ل%3%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\"?[uai])", b="ٱلٱ%1"},   
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="ٱلْ"},
   -- the silent wāw
   {a="uU$", b="uو"},
   {a="uU(%W)", b="uو%1"},
   {a="aU$", b="aو"},
   {a="aU(%W)", b="aو%1"},
   {a="iU$", b="iو"},
   {a="iU(%W)", b="iو%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="%1وا"},
   {a="(_a)U", b="%1و"},
   {a="(_a)I", b="%1ي"},
   -- assimilations
--easy   {a="(n)(%s)([rlmnwy])", b="%1%2%3%3"}
}

digraphsfv = {
   -- initial straight double quote gives a connective ʾalif
   {a="^\"[uai]", b="ٱ"},
   {a="([%s%-])\"[uai]", b="%1ٱ"},
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(%s)(\"?[uai])", b="awuا%2ٱ"},
   {a="(aw)(%s)(\"?[uai])", b="%1u%2ٱ"},
   {a="(ay)(%s)(\"?[uai])", b="%1i%2ٱ"},
   {a="([uai]%-)(\"?[uai])", b="%1ٱ"}, -- hyphen + initial alif without hamza
   -- initial alif without hamza
   {a="([%_]?[uaiUAIY])(%s)(\"?[uai])", b="%1%2ٱ"},
   {a="^([uai])", b="ا%1"},      -- initial alif without hamza
   {a="(%s)([uai])", b="%1ا%2"}, -- initial alif without hamza
   {a="%-%-", b="ـ"},
   {a="ؤؤ", b="ؤّ"},
   {a="أأ", b="أّ"},
   {a="ئئ", b="ئّ"},
   {a="bb", b="بّ"},
   {a="BB", b="ـّ"},
   {a="(%_)([thd])([thd])", b="%1%2|%3"},
   {a="tt", b="تّ"},
   {a="%_t%_t", b="ثّ"},
   {a="jj", b="جّ"},
   {a="%^g%^g", b="جّ"},
   {a="xx", b="خّ"},
   {a="%_h%_h", b="خّ"},
   {a="dd", b="دّ"},
   {a="%_d%_d", b="ذّ"},
   {a="rr", b="رّ"},
   {a="zz", b="زّ"},
   {a="ss", b="سّ"},
   {a="%^s%^s", b="شّ"},
   {a="%.s%.s", b="صّ"},
   {a="%.d%.d", b="ضّ"},
   {a="%.t%.t", b="طّ"},
   {a="%.z%.z", b="ظّ"},
   {a="%`%`", b="عّ"},
   {a="%.g%.g", b="غّ"},
   {a="ff", b="فّ"},
   {a="qq", b="قّ"},
   {a="kk", b="كّ"},
   {a="ll", b="لّ"},
   {a="mm", b="مّ"},
   {a="nn", b="نّ"},
   {a="hh", b="هّ"},
   {a="ww", b="وّ"},
   {a="yy", b="يّ"},
   -- sukūn begin
   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])$", b="%1ْ"},
   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])([%s])", b="%1ْ%2"},
   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])([%_]?[^%_uaiUAIًٌٍ])", b="%1ْ%2"},
   -- take out sukūn in cases of assimilation
   {a="(n)(ْ)(%s)([روي])", b="%1%3%4"},
   {a="(n)(ْ)(%s)([ل])", b="%1%3%4"},
   {a="(n)(ْ)(%s)([م])", b="%1%3%4"},
   {a="(n)(ْ)(%s)([ن])", b="%1%3%4"},
   {a="ْ\"", b="\""},
   -- sukūn end
   {a="_t", b="ث"},
   {a="%^g", b="ج"},
   {a="%.h", b="ح"},
   {a="_h", b="خ"},
   {a="_d", b="ذ"},
   {a="%^s", b="ش"},
   {a="%.s", b="ص"},
   {a="%.d", b="ض"},
   {a="%.t", b="ط"},
   {a="%.z", b="ظ"},
   {a="%.g", b="غ"},
   {a="(U)(A)", b="%1ا"},
   {a="WA", b="وْا"},
   {a="(a)W\"", b="%1وا"},
   {a="(a)W", b="%1وْا"},
   {a="_A", b="aى"},
   {a="_u", b="ٗ"},
   {a="_a", b="ٰ"},
   {a="_i", b="ٖ"},
   {a="%.b", b="ٮ"},
   {a="%.f", b="ڡ"},
   {a="%.q", b="ٯ"},
   {a="%.k", b="ک"},
   {a="%.n", b="ں"},
   {a="%^d", b="ڊ"}
}

digraphsfveasy = { -- see the diffenrences under 'easy' marker below
   -- initial straight double quote gives a connective ʾalif
   {a="^\"[uai]", b="ٱ"},
   {a="([%s%-])\"[uai]", b="%1ٱ"},
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(%s)(\"?[uai])", b="awuا%2ٱ"},
   {a="(aw)(%s)(\"?[uai])", b="%1u%2ٱ"},
   {a="(ay)(%s)(\"?[uai])", b="%1i%2ٱ"},
   {a="([uai]%-)(\"?[uai])", b="%1ٱ"}, -- hyphen + initial alif without hamza
   -- initial alif without hamza
   {a="([%_]?[uaiUAIY])(%s)(\"?[uai])", b="%1%2ٱ"},
   {a="^([uai])", b="ا%1"},      -- initial alif without hamza
   {a="(%s)([uai])", b="%1ا%2"}, -- initial alif without hamza
   {a="%-%-", b="ـ"},
   {a="ؤؤ", b="ؤّ"},
   {a="أأ", b="أّ"},
   {a="ئئ", b="ئّ"},
   {a="bb", b="بّ"},
   {a="BB", b="ـّ"},
   {a="(%_)([thd])([thd])", b="%1%2|%3"},
   {a="tt", b="تّ"},
   {a="%_t%_t", b="ثّ"},
   {a="jj", b="جّ"},
   {a="%^g%^g", b="جّ"},
   {a="xx", b="خّ"},
   {a="%_h%_h", b="خّ"},
   {a="dd", b="دّ"},
   {a="%_d%_d", b="ذّ"},
   {a="rr", b="رّ"},
   {a="zz", b="زّ"},
   {a="ss", b="سّ"},
   {a="%^s%^s", b="شّ"},
   {a="%.s%.s", b="صّ"},
   {a="%.d%.d", b="ضّ"},
   {a="%.t%.t", b="طّ"},
   {a="%.z%.z", b="ظّ"},
   {a="%`%`", b="عّ"},
   {a="%.g%.g", b="غّ"},
   {a="ff", b="فّ"},
   {a="qq", b="قّ"},
   {a="kk", b="كّ"},
   {a="ll", b="لّ"},
   {a="mm", b="مّ"},
   {a="nn", b="نّ"},
   {a="hh", b="هّ"},
   {a="ww", b="وّ"},
   {a="yy", b="يّ"},
   -- sukūn begin ('easy' needs these rules to be taken out); but
   -- first take out every previously generated sukūn by hamza rules,
   -- so there be no need to edit them:
   {a="ْ", b=""}, 
--   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])$", b="%1ْ"},
--   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])([%s])", b="%1ْ%2"},
--   {a="([%_%^%.]?[Bbtjghxdrzs%`fqklmnwy])([%_]?[^%_uaiUAIًٌٍ])", b="%1ْ%2"},
   -- take out sukūn in cases of assimilation
--   {a="(n)(ْ)(%s)([روي])", b="%1%3%4"},
--   {a="(n)(ْ)(%s)([ل])", b="%1%3%4"},
--   {a="(n)(ْ)(%s)([م])", b="%1%3%4"},
--   {a="(n)(ْ)(%s)([ن])", b="%1%3%4"},
--   {a="ْ\"", b="\""},
   -- sukūn end
   {a="_t", b="ث"},
   {a="%^g", b="ج"},
   {a="%.h", b="ح"},
   {a="_h", b="خ"},
   {a="_d", b="ذ"},
   {a="%^s", b="ش"},
   {a="%.s", b="ص"},
   {a="%.d", b="ض"},
   {a="%.t", b="ط"},
   {a="%.z", b="ظ"},
   {a="%.g", b="غ"},
   {a="(U)(A)", b="%1ا"},
   {a="WA", b="وْا"},
   {a="(a)W\"", b="%1وا"},
   {a="(a)W", b="%1وْا"},
   {a="_A", b="aى"},
   {a="_u", b="ٗ"},
   {a="_a", b="ٰ"},
   {a="_i", b="ٖ"},
   {a="%.b", b="ٮ"},
   {a="%.f", b="ڡ"},
   {a="%.q", b="ٯ"},
   {a="%.k", b="ک"},
   {a="%.n", b="ں"},
   {a="%^d", b="ڊ"}
}

singlefv = {
   {a="b", b="ب"},
   {a="t", b="ت"},
   {a="j", b="ج"},
   {a="x", b="خ"},
   {a="d", b="د"},
   {a="r", b="ر"},
   {a="z", b="ز"},
   {a="s", b="س"},
   {a="f", b="ف"},
   {a="`", b="ع"},
   {a="f", b="ف"},
   {a="q", b="ق"},
   {a="k", b="ك"},
   {a="l", b="ل"},
   {a="m", b="م"},
   {a="n", b="ن"},
   {a="h", b="ه"},
   {a="w", b="و"},
   {a="y", b="ي"},
   {a="T", b="ة"},
   {a="\"$", b=""},
   {a="\"(%W)", b="%1"},
   {a="\"([^uaiUAI])", b="%1"},
   {a="([^0-9])%-([^0-9])", b="%1%2"},
   {a="B", b="ـ"},
}

singlefveasy = { -- see the differences under 'easy' tag below
   {a="b", b="ب"},
   {a="t", b="ت"},
   {a="j", b="ج"},
   {a="x", b="خ"},
   {a="d", b="د"},
   {a="r", b="ر"},
   {a="z", b="ز"},
   {a="s", b="س"},
   {a="f", b="ف"},
   {a="`", b="ع"},
   {a="f", b="ف"},
   {a="q", b="ق"},
   {a="k", b="ك"},
   {a="l", b="ل"},
   {a="m", b="م"},
   {a="n", b="ن"},
   {a="h", b="ه"},
   {a="w", b="و"},
   {a="y", b="ي"},
   {a="T", b="ة"},
   -- easy (begin): \" needs to put back the sukūn
   {a="\"$", b="ْ"},
   {a="\"(%W)", b="ْ%1"},
   {a="\"([^uaiUAI])", b="ْ%1"},
   -- easy (end)
   {a="([^0-9])%-([^0-9])", b="%1%2"},
   {a="B", b="ـ"},
}

