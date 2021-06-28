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

-- common

punctuationtr = {
   {a="%(%(", b="("},
   {a="%)%)", b=")"}
}

nulltr = {
   {a="%|", b=""},
   {a="o", b=""},
   {a="O[%S]-O", b=""},
   {a="[%^%_](.)", b="<??>%1"}
}

-- cap (legacy)
captr = {
   -- dmg (defaut); loc as well
   {a="ā", b="Ā"},
   {a="b", b="B"},
   {a="t", b="T"},
   {a="ṯ", b="Ṯ"},
   {a="ǧ", b="Ǧ"},
   {a="ḥ", b="Ḥ"},
   {a="ḫ", b="Ḫ"},
   {a="d", b="D"},
   {a="ḏ", b="Ḏ"},
   {a="r", b="R"},
   {a="z", b="Z"},
   {a="s", b="S"},
   {a="š", b="Š"},
   {a="ṣ", b="Ṣ"},
   {a="ḍ", b="Ḍ"},
   {a="ṭ", b="Ṭ"},
   {a="ẓ", b="Ẓ"},
   {a="ġ", b="Ġ"},
   {a="f", b="F"},
   {a="q", b="Q"},
   {a="k", b="K"},
   {a="l", b="L"},
   {a="m", b="M"},
   {a="n", b="N"},
   {a="h", b="H"},
   {a="w", b="W"},
   {a="ū", b="Ū"},
   {a="y", b="Y"},
   {a="ī", b="Ī"}
}

-- uc
lcuc = {
   {a="b", b="B"},
   {a="t", b="T"},
   {a="ṯ", b="Ṯ"},
   {a="ǧ", b="Ǧ"},
   {a="j", b="J"},
   {a="ḥ", b="Ḥ"},
   {a="ḫ", b="Ḫ"},
   {a="d", b="D"},
   {a="ḏ", b="Ḏ"},
   {a="r", b="R"},
   {a="z", b="Z"},
   {a="s", b="S"},
   {a="š", b="Š"},
   {a="ṣ", b="Ṣ"},
   {a="ḍ", b="Ḍ"},
   {a="ṭ", b="Ṭ"},
   {a="ẓ", b="Ẓ"},
   {a="ġ", b="Ġ"},
   {a="f", b="F"},
   {a="q", b="Q"},
   {a="k", b="K"},
   {a="l", b="L"},
   {a="m", b="M"},
   {a="n", b="N"},
   {a="h", b="H"},
   {a="w", b="W"},
   {a="y", b="Y"},
   {a="u", b="U"},
   {a="a", b="A"},
   {a="i", b="I"},
   {a="ū", b="Ū"},
   {a="ā", b="Ā"},
   {a="ī", b="Ī"},
   -- additional characters
   {a="p", b="P"},
   {a="č", b="Č"},
   {a="ž", b="Ž"},
   {a="v", b="V"},
   {a="g", b="G"},
   {a="ñ", b="Ñ"},
   {a="ch", b="Ch"}, -- loc
}

-- dmg

hamzatrdmg = {
   -- next lines for ʾalif alone
   {a="(%.A)l%-(%^n)", b=".|l-%2"}, --additional (^n is lunar)
   {a="([%(%[%|%<%s%-O])(%.A)l%-(%^n)", b="%1.|l-%3"}, --additional (^n is lunar) --p
   {a="(%.A)l%-([%_%^%.]?[tdrzsnc])", b=".|%2-%2"},
   {a="([%(%[%|%<%s%-O])(%.A)l%-([%_%^%.]?[tdrzsnc])", b="%1.|%3-%3"}, --p
   {a="(%.A)([uai])l%-(%^n)", b="||%2l-%3"}, --additional (^n is lunar)
   {a="([%(%[%|%<%s%-O])(%.A)([uai])l%-(%^n)", b="%1||%3l-%4"}, --additional (^n is lunar) --p
   {a="(%.A)([uai])l%-([%_%^%.]?[tdrzsnc])", b="||%2%3-%3"},
   {a="([%(%[%|%<%s%-O])(%.A)([uai])l%-([%_%^%.]?[tdrzsnc])", b="%1||%3%4-%4"}, --p
   {a="(%.A)([^uai])", b=".|%2"},
   {a="(%.A)([uai])", b="||%2"},
   -- hard coded hamza
   {a="|\"'", b="ʾ"},
   {a="A\"'", b="ʾA"},
   {a="[au]\"'", b="ʾ"},
   {a="w\"'", b="ʾ"},
   {a="i\"'", b="ʾ"},
   {a="y\"'", b="ʾ"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ʾʾ%1"},
   {a="''([Aa])", b="ʾʾ%1"},
   {a="''([Ii])", b="ʾʾ%1"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="ʾU"},
   {a="%'%_I", b="ʾI"},
   -- taḫfīfu 'l-hamza
   {a="'u'([^uaiUAI])", b="ʾU%1"},
   {a="'i'([^uaiUAI])", b="ʾI%1"},
   {a="^u'([^uaiUAI])", b="U%1"},
   {a="([^uaiUAIYN][%s%(%[%<])u'([^uaiUAI])", b="%1U%2"},
   {a="^i'([^uaiUAI])", b="I%1"},
   {a="([^uaiUAIYN][%s%(%[%<])i'([^uaiUAI])", b="%1I%2"},
   -- madda (historic writing below)
   {a="'a'([^uaiUAI])", b="ʾA%1"},
   {a="'a?A", b="ʾA"},
   {a="(A)(')(i)$", b="%1ʾ%3"},
   {a="(A)(')(i)(%W)", b="%1ʾ%3%4"},
   {a="(A)(')(i)", b="%1ʾ%3"}, -- historic madda
   {a="(A)(')", b="%1ʾ"}, -- historic madda
   -- initial (needs both ^ and %W patterns)
   -- 'aw: the diphthong is to be resolved into 'awi' (next 8 lines)
   {a="^('aw)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1%2i"},
   {a="^('aw)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)(\"?[uai])([%S]-O)", b="%1%2i"},
   {a="^('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   {a="(%W)('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1%2i%3%4"},
   {a="^('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1i%2%3"}, --p
   {a="(%W)('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1%2i%3%4"}, --p
   -- then the 'initial' rules for the remaining cases
   {a="^(')([ua])", b="ʾ%2"},
   {a="^(')(i)", b="ʾ%2"},
   -- consider replacing initial %W with [%s%(%[%<%-]:
   --   {a="(%W)(')([ua])", b="%1ʾ%3"},
   --   {a="(%W)(')(i)", b="%1ʾ%3"},
   {a="([%s%(%[%<%-])(')([ua])", b="%1ʾ%3"},
   {a="([%s%(%[%<%-])(')(i)", b="%1ʾ%3"},
   -- final
   {a="([Iy])(')(aN)$", b="%1ʾ%3"},
   {a="([Iy])(')(aN)(%W)", b="%1ʾ%3%4"},
   {a="([^uai])(')([uai]N?)$", b="%1ʾ%3"},
   {a="([^uai])(')([uai]N?)(%W)", b="%1ʾ%3%4"},
   {a="([UI])(')([uai])$", b="%1ʾ%3"},
   {a="([UI])(')([uai])(%W)", b="%1ʾ%3%4"},
   -- middle
   {a="(U)(')", b="%1ʾ"},
   {a="([Iy])(')", b="%1ʾ"},
   {a="([^uai])(')([uU])", b="%1ʾ%3"},
   {a="([^uai])(')(%_?[aAY])", b="%1ʾ%3"},
   {a="([^uai])(')([iI])", b="%1ʾ%3"},
   {a="(u)(')([uU])", b="%1ʾ%3"},
   {a="(u)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(u)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(a)(')([uU])", b="%1ʾ%3"},
   {a="(a)(')([iI])", b="%1ʾ%3"},
   {a="(i)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(i)(')([uU])", b="%1ʾ%3"},
   {a="(i)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ʾ%3"}
}

tanwintrdmg = {
   {a="%-?([uai]NU)(O)([ui])([%S]-O)", b="\\arbup{un%3}"},
   {a="%-?([uai]NU)(%s)([ui])", b="\\arbup{un%3}%2'"},
   {a="%-?(iNI)(O)([ui])([%S]-O)", b="i\\arbup{n%3}"},
   {a="%-?(iNI)(%s)([ui])", b="i\\arbup{n%3}%2'"},
   {a="(O[%S]-)([uai]N[UI])(O)(\"?[ui])", b="'"},
   {a="%-?uNU", b="\\arbup{un}"},
   {a="%-?aNU", b="\\arbup{an}"},
   {a="%-?iNU", b="\\arbup{in}"},
   {a="%-?iNI", b="i\\arbup{n}"},
   -- tanwīn preceding ʾalif conjunctionis
   {a="%-?(uN)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="\\arbup{uni}"},
   {a="%-?(aN)(_A)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="ạ\\arbup{ni}"},
   {a="%-?(aN)(Y)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="ạ\\arbup{ni}"},
   {a="(T)%-?(aN)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="t\\arbup{ani}"},
   {a="([^TA])%-?(aN)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1\\arbup{ani}"},
   {a="%-?(iN)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="\\arbup{ini}"},
   {a="%-?(uN)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="\\arbup{uni}%2%3"},
   {a="%-?(aN)(_A)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="ạ\\arbup{ni}%3%4"},
   {a="%-?(aN)(Y)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="ạ\\arbup{ni}%3%4"},
   {a="(T)%-?(aN)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="t\\arbup{ani}%3%4"},
   {a="([^TA])%-?(aN)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1\\arbup{ani}%3%4"},
   {a="%-?(iN)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="\\arbup{ini}%2%3"},
   -- tanwīn preceding 'lla_dI/'llatI
   {a="%-?(uN)(O)('lla[%_]?[dt])([%S]-O)", b="\\arbup{uni}"},
   {a="%-?(aN)(_A)(O)('lla[%_]?[dt])([%S]-O)", b="ạ\\arbup{ni}"},
   {a="%-?(aN)(Y)(O)('lla[%_]?[dt])([%S]-O)", b="ạ\\arbup{ni}"},
   {a="(T)%-?(aN)(O)('lla[%_]?[dt])([%S]-O)", b="t\\arbup{ani}"},
   {a="([^TA])%-?(aN)(O)('lla[%_]?[dt])([%S]-O)", b="%1\\arbup{ani}"},
   {a="%-?(iN)(O)('lla[%_]?[dt])([%S]-O)", b="\\arbup{ini}"},
   {a="%-?(uN)(%s)('lla[%_]?[dt])", b="\\arbup{uni}%2%3"},
   {a="%-?(aN)(_A)(%s)('lla[%_]?[dt])", b="ạ\\arbup{ni}%3%4"},
   {a="%-?(aN)(Y)(%s)('lla[%_]?[dt])", b="ạ\\arbup{ni}%3%4"},
   {a="(T)%-?(aN)(%s)('lla[%_]?[dt])", b="t\\arbup{ani}%3%4"},
   {a="([^TA])%-?(aN)(%s)('lla[%_]?[dt])", b="%1\\arbup{ani}%3%4"},
   {a="%-?(iN)(%s)('lla[%_]?[dt])", b="\\arbup{ini}%2%3"},
   -- tanwīn + alif without hamza and kasra (ibn) or dhamma (uhrub)
   {a="%-?(uN)(O)([ui])([%S]-O)", b="\\arbup{un%3}"},
   {a="%-?(aN)(_A)(O)([ui])([%S]-O)", b="ạ\\arbup{n%4}"},
   {a="%-?(aN)(Y)(O)([ui])([%S]-O)", b="ạ\\arbup{n%4}"},
   {a="(T)%-?(aN)(O)([ui])([%S]-O)", b="t\\arbup{an%4}"},
   {a="([^TA])%-?(aN)(O)([ui])([%S]-O)", b="%1\\arbup{an%4}"},
   {a="%-?(iN)(O)([ui])([%S]-O)", b="\\arbup{in%3}"},
   {a="(O[%S]-)([uai]N)(O)(\"?[ui])", b="'"},
   {a="%-?(uN)(%s)([ui])", b="\\arbup{un%3}%2'"},
   {a="%-?(aN)(_A)(%s)([ui])", b="ạ\\arbup{n%4}%3'"},
   {a="%-?(aN)(Y)(%s)([ui])", b="ạ\\arbup{n%4}%3'"},
   {a="(T)%-?(aN)(%s)([ui])", b="t\\arbup{an%4}%3'"},
   {a="([^TA])%-?(aN)(%s)([ui])", b="%1\\arbup{an%4}%3'"},
   {a="%-?(iN)(%s)([ui])", b="\\arbup{in%3}%2'"},
   --
-- {a="uN", b="\\arbup{un}"}, (now included in the last line of this table)
   {a="%-?(\"?At)%-?([ui])N", b="\\arbup{%1%2n}"},
   -- needed by \arbcolor:
   {a="%-?(aN)(O[%S]-%_AO)", b="ạ\\arbup{n}"},
   {a="%-?(aN)(O[%S]-YO)", b="ạ\\arbup{n}"},
   {a="(O[%S]-TO)%-?(\"?aN)", b="\\arbup{an}"},
   {a="(O[%S]-[^TA]O)%-?(\"?aN)", b="\\arbup{an}"},
   --
   {a="%-?(aN)(_A)", b="ạ\\arbup{n}"},
   {a="%-?(aN)(Y)", b="ạ\\arbup{n}"},
   {a="(T)%-?(\"?aN)", b="t\\arbup{an}"},
   {a="([^TA])%-?(\"?aN)", b="%1\\arbup{an}"},
   {a="%-?([ui])N", b="\\arbup{%1n}"}
}

trigraphstrdmg = { -- trigraphs or more
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="'ll%1%2"},
   {a="([%(%[%|%<%s])'ll(a)([%_]?[dt])", b="%1'll%2%3"}, --p
   -- law: the diphthong is to be resolved into 'awi' (next 8 lines)
   {a="^(law)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(%W)(law)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1%2i"},
   {a="^(law)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(%W)(law)(O)(\"?[uai])([%S]-O)", b="%1%2i"},
   {a="^(law)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   {a="(%W)(law)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1%2i%3%4"},
   {a="^(law)(%s)([%(%[%|%<]?\"?[uai])", b="%1i%2%3"}, --p
   {a="(%W)(law)(%s)([%(%[%|%<]?\"?[uai])", b="%1%2i%3%4"}, --p
   -- al- + lām
   {a="^(a)l%-(l)", b="%1l-%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-(l)", b="%1%2l-%3"}, --p
   -- al- + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="%1l-%2"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)l%-(%^n)", b="%1%2l-%3"}, --^n is lunar --p
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="%1%2-%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-([%_%^%.]?[tdrzsnc])", b="%1%2%3-%3"}, --p
   -- assim. art. + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)(%^n)%-", b="%1l-"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)(%^n)%-", b="%1%2l-"}, --^n is lunar --p
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="%1%2-"},
   {a="([%(%[%|%<%s%-O])(a)([%_%^%.]?[tdrzsnc])%-", b="%1%2%3-"}, --p
   -- al- + initial unstable hamza
   {a="^(a)l%-(\"?[uai])", b="%1l-%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-(\"?[uai])", b="%1%2l-%3"}, --p
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-([uai])", b="l%1-l-%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="%1l-"},
   {a="([%(%[%|%<%s%-O])(a)l%-", b="%1%2l-"}, --p
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aw)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1u"},
   {a="(ay)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1u%2%3"},
   {a="(ay)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="'l-%1"},
   -- art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="'l-%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="'%1-%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="l%1-%2-%2"},
   -- assim. art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'(%^n)%-", b="'l-"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="'%1-"},
   -- li-/la- + art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="l%1-l-%2"}, -- ^n is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="l%1-%2-%2"},
   -- li-/la- + assim. art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="l%1-l-%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="l%1-%2-%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\"?[uai])", b="'l-%1"},
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="'l-"},
   -- the silent wāw
   {a="uU$", b="u"},
   {a="uU(%W)", b="u%1"},
   {a="aU$", b="a"},
   {a="aU(%W)", b="a%1"},
   {a="iU$", b="i"},
   {a="iU(%W)", b="i%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="A"},
   {a="(_a)U", b="A"},
   {a="(_a)I", b="A"}
}

idghamtrdmg = {
   -- assimilations
   {a="(n)(}?)(%s)([rlmnwy])", b="%4%2%3%4"},
   {a="(n)(}?)(O)([rlmnwy])([%S]-O)", b="%4%2"}
}

digraphstrdmg = {
   {a="([uai]%-)(\"?[uai])", b="%1'"}, -- hyphen + initial alif without hamza
   -- the following two are replaced with the 4 lines next for now
--   {a="^(\"?[uai])", b="%1"},      -- initial alif without hamza
--   {a="(%W)(\"?[uai])", b="%1%2"},      -- initial alif without hamza
--   {a="^(\"[uai])", b="'"},      -- initial alif without hamza
--   {a="(%W)(\"[uai])", b="%1'"},      -- initial alif without hamza
   {a="^(\"?[uai])", b="%1"},      -- initial alif without hamza
   {a="(%W)(\"?[uai])", b="%1%2"},      -- initial alif without hamza
   -- this is not necessary, take out for now:
-- {a="([%_]?[uaiUAIY])(%s)([uai])", b="%1%2'"}, -- initial alif without hamza
   {a="(aw)(O)(\"?[uai])([%S]-O)", b="%1u"},
   {a="(aw)(%s)([%(%[%|%<]?)(\"?[uai])", b="%1u%2%3'"}, --p
   {a="(ay)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(ay)(%s)([%(%[%|%<]?)(\"?[uai])", b="%1i%2%3'"}, --p
   {a="(aW)(O)(\"?[uai])([%S]-O)", b="awu"},
   {a="(UA)(O)(\"?[uai])([%S]-O)", b="u"},
   {a="(%_A)(O)(\"?[uai])([%S]-O)", b="ạ"},
   {a="(Y)(O)(\"?[uai])([%S]-O)", b="ạ"},
   {a="(%_a)(O)(\"?[uai])([%S]-O)", b="a"},
   {a="(A)(O)(\"?[uai])([%S]-O)", b="a"},
   {a="([%_]?[Uu])(O)(\"?[uai])([%S]-O)", b="u"},
   {a="([%_]?[Ii])(O)(\"?[uai])([%S]-O)", b="i"},
   {a="(O[%S]-)([%'a]l%-)(O)(\"?[uai])", b="'"},
   {a="(O[%S]-)([UAIYWuaiyw])(O)(\"?[uai])", b="'"},
   {a="(aW)(%s)([%(%[%|%<]?)(\"?[uai])", b="awu%2%3%4"}, --p
   {a="(UA)(%s)([%(%[%|%<]?)(\"?[uai])", b="u%2%3'"}, --p
   {a="([^%_][uai])(%s)([%(%[%|%<]?)(\"?[uai])", b="%1%2%3'"}, --p
   {a="(%_A)(%s)([%(%[%|%<]?)(\"?[uai])", b="ạ%2%3'"}, --p
   {a="(Y)(%s)([%(%[%|%<]?)(\"?[uai])", b="ạ%2%3'"}, --p
   {a="(%_a)(%s)([%(%[%|%<]?)(\"?[uai])", b="a%2%3'"}, --p
   {a="(A)(%s)([%(%[%|%<]?)(\"?[uai])", b="a%2%3'"}, --p
   {a="([%_]?[Uu])(%s)([%(%[%|%<]?)(\"?[uai])", b="u%2%3'"}, --p
   {a="([%_]?[Ii])(%s)([%(%[%|%<]?)(\"?[uai])", b="i%2%3'"}, --p
   -- ʾiʿrāb hyphen (begin)
   {a="(%-)(\"?[UI]na)(%p*%s)", b="\\arbup{%2}%3"},
   {a="(%-)(\"?[UI]na)(%p*)$", b="\\arbup{%2}%3"},
   {a="(%-)(\"?At%.?[ui])(%p*%s)", b="\\arbup{%2}%3"},
   {a="(%-)(\"?At%.?[ui])(%p*)$", b="\\arbup{%2}%3"},
   {a="(%-)(\"?Ani)(%p*%s)", b="\\arbup{%2}%3"},
   {a="(%-)(\"?Ani)(%p*)$", b="\\arbup{%2}%3"},
   {a="(%-)(\"?%.?ayni)(%p*%s)", b="\\arbup{%2}%3"},
   {a="(%-)(\"?%.?ayni)(%p*)$", b="\\arbup{%2}%3"},
   {a="(%-)(\"?%.?[uai])(%p*%s)", b="\\arbup{%2}%3"},
   {a="(%-)(\"?%.?[uai])(%p*)$", b="\\arbup{%2}%3"},
   -- ʾiʿrāb hyphen (end) shorten long vowels preceding ʾalif
   -- conjunctionis—without forgetting 'lla_dI
   {a="(U)(A)", b="U"},
   {a="(aW)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="awu"},
   {a="(%_a)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="a"},
   {a="(%_A)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="ạ"},
   {a="(A)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="a"},
   {a="(Y)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="ạ"},
   {a="([%_]?[Uu])(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="u"},
   {a="([%_]?[Ii])(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])([%S]-O)", b="i"},
   --p (next 7 lines, just after %s)
   {a="(aW)(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="awu%2%3"},
   {a="(%_a)(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="a%2%3"},
   {a="(%_A)(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="ạ%2%3"},
   {a="(A)(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="a%2%3"},
   {a="(Y)(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="ạ%2%3"},
   {a="([%_]?[Uu])(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="u%2%3"},
   {a="([%_]?[Ii])(%s)([%(%[%|%<]?['][%_%^%.]?[l'btjghxdrzs`fqkmnwy][%-l])", b="i%2%3"},
   {a="%-%-", b=""},
   {a="iyyaT(%p*)$", b="īyaT%1"},
   {a="iyyaT(%p*%s)", b="īyaT%1"},
   {a="iyy(%p*)$", b="ī%1"},
   {a="iyy(%p*%s)", b="ī%1"},
   --   {a="T([^uai])", b="%1"},
   {a="T(\\arbup)", b="t%1"},
   {a="([a%'][%_%^%.]?[tdrzsln]%-)(%S-)T([%(%[%|%<%s])(a[%_%^%.]?[tdrzsln]%-)", b="%1%2h%3%4"}, --p
   {a="T([%(%[%|%<%s])(a[%_%^%.]?[tdrzsln]%-)", b="t%1%2"}, --p
   {a="T([%|\"])", b="t%1"},
   {a="T(%p*%s)", b="h%1"},
   {a="T(%p*)$", b="h%1"},
   {a="T(%p*)(%W)", b="h%1%2"},
   {a="_t", b="ṯ"},
   {a="%^g", b="ǧ"},
   {a="%.h", b="ḥ"},
   {a="_h", b="ḫ"},
   {a="_d", b="ḏ"},
   {a="%^s", b="š"},
   {a="%.s", b="ṣ"},
   {a="%.d", b="ḍ"},
   {a="%.t", b="ṭ"},
   {a="%.z", b="ẓ"},
   {a="%.g", b="ġ"},
   {a="%.y", b="y"},
   -- additional characters (begin)
   {a="%^c", b="č"},
   {a="%^z", b="ž"},
   {a="%^n", b="ñ"},
   -- additional characters (end)
   -- the following needs to be moved above shortening rules
--   {a="(U)(A)", b="ū"},
   {a="WA", b="w"},
   {a="(a)W", b="%1w"},
   {a="_A", b="ạ̄"},
   {a="_u", b="ū"},
   {a="_a", b="ā"},
   {a="_i", b="ī"},
   {a="%.b", b="ḅ"},
   {a="%.f", b="f̣"},
   {a="%.q", b="q̣"},
   {a="%.k", b="k"},
   {a="%.n", b="ṇ"},
   {a="%^d", b="d́"}
}

singletrdmg = {
   {a="b", b="b"},
   {a="t", b="t"},
   {a="j", b="ǧ"},
   {a="x", b="ḫ"},
   {a="d", b="d"},
   {a="r", b="r"},
   {a="z", b="z"},
   {a="s", b="s"},
   {a="`", b="ʿ"},
   {a="f", b="f"},
   {a="q", b="q"},
   {a="k", b="k"},
   {a="l", b="l"},
   {a="m", b="m"},
   {a="n", b="n"},
   {a="h", b="h"},
   {a="w", b="w"},
   {a="y", b="y"},
   {a="T", b="t"},
   -- additional characters (begin)
   {a="p", b="p"},
   {a="v", b="v"},
   {a="g", b="g"},
   -- additional characters (end)
   {a="\"", b=""},
   {a="B", b=""}
}

longvtrdmg = {
   {a="A", b="ā"},
   {a="U", b="ū"},
   {a="I", b="ī"},
   {a="aY", b="ay"},
   {a="iY", b="ī"},
   {a="Y", b="ạ̄"}
}

shortvtrdmg = {
   {a="([uai])([uai])([uai])", b="/%1,%2,%3/"},
   {a="([uai])([uai])", b="/%1,%2/"},
   {a="%.u", b="u"},
   {a="%.a", b="a"},
   {a="%.i", b="i"},
   {a="u", b="u"},
   {a="a", b="a"},
   {a="i", b="i"}
}

-- loc

hamzatrloc = {
   -- next lines for ʾalif alone
   {a="(%.A)([^uai])", b=".|%2"},
   {a="(%.A)([uai])", b="||%2"},
   -- hard coded hamza
   {a="|\"'", b="ʾ"},
   {a="A\"'", b="ʾA"},
   {a="[au]\"'", b="ʾ"},
   {a="w\"'", b="ʾ"},
   {a="i\"'", b="ʾ"},
   {a="y\"'", b="ʾ"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ʾʾ%1"},
   {a="''([Aa])", b="ʾʾ%1"},
   {a="''([Ii])", b="ʾʾ%1"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="U"},
   {a="%'%_I", b="I"},
   -- taḫfīfu 'l-hamza
   {a="^'u'([^uaiUAI])", b="U%1"},
   {a="([%s%(%[%<%-])'u'([^uaiUAI])", b="%1U%2"},
   {a="^'i'([^uaiUAI])", b="I%1"},
   {a="([%s%(%[%<%-])'i'([^uaiUAI])", b="%1I%2"},
   {a="^u'([^uaiUAI])", b="U%1"},
   {a="([^uaiUAIYN][%s%(%[%<])u'([^uaiUAI])", b="%1U%2"},
   {a="^i'([^uaiUAI])", b="I%1"},
   {a="([^uaiUAIYN][%s%(%[%<])i'([^uaiUAI])", b="%1I%2"},
   -- madda (historic writing below)
   {a="^(')(A)", b="%2"},
   {a="(%W)(')(A)", b="%1%3"},   
   {a="^'a'([^uaiUAI])", b="A%1"},
   {a="(%W)'a'([^uaiUAI])", b="%1A%2"},   
   {a="'a'([^uaiUAI])", b="A%1"},
   {a="^'a?A", b="A"},
   {a="(%W)'a?A", b="%1A"},
   {a="'a?A", b="ʾA"},
   {a="(A)(')(i)$", b="%1ʾ%3"},
   {a="(A)(')(i)(%W)", b="%1ʾ%3%4"},
   {a="(A)(')(i)", b="%1ʾ%3"}, -- historic madda
   {a="(A)(')", b="%1ʾ"}, -- historic madda
   -- initial (needs both ^ and %W patterns)
   {a="^(')([ua])", b="%2"},
   {a="^(')(i)", b="%2"},
   -- consider replacing initial %W with [%s%(%[%<%-]:
   --   {a="(%W)(')([ua])", b="%1%3"},
   --   {a="(%W)(')(i)", b="%1%3"},
   {a="([%s%(%[%<%-])(')([ua])", b="%1%3"},
   {a="([%s%(%[%<%-])(')(i)", b="%1%3"},
   -- final
   {a="([Iy])(')(aN)$", b="%1ʾ%3"},
   {a="([Iy])(')(aN)(%W)", b="%1ʾ%3%4"},
   {a="([^uai])(')([uai]N?)$", b="%1ʾ%3"},
   {a="([^uai])(')([uai]N?)(%W)", b="%1ʾ%3%4"},
   {a="([UI])(')([uai])$", b="%1ʾ%3"},
   {a="([UI])(')([uai])(%W)", b="%1ʾ%3%4"},
   -- middle
   {a="(U)(')", b="%1ʾ"},
   {a="([Iy])(')", b="%1ʾ"},
   {a="([^uai])(')([uU])", b="%1ʾ%3"},
   {a="([^uai])(')(%_?[aAY])", b="%1ʾ%3"},
   {a="([^uai])(')([iI])", b="%1ʾ%3"},
   {a="(u)(')([uU])", b="%1ʾ%3"},
   {a="(u)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(u)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(a)(')([uU])", b="%1ʾ%3"},
   {a="(a)(')([iI])", b="%1ʾ%3"},
   {a="(i)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(i)(')([uU])", b="%1ʾ%3"},
   {a="(i)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ʾ%3"}
}

tanwintrloc = {
   {a="%-?uNU", b="un"},
   {a="%-?aNU", b="an"},
   {a="%-?iNU", b="in"},
   {a="%-?iNI", b="in"},
   {a="%-?(\"?At)%-?([ui])N", b="%1%2n"},
   {a="%-?([ui])N", b="%1n"},
   -- needed by \arbcolor:
   {a="%-?(aN)(O[%S]-%_AO)", b="an"},
   {a="%-?(aN)(O[%S]-YO)", b="an"},
   {a="(O[%S]-TO)%-?(\"?aN)", b="an"},
   {a="(O[%S]-[^TA]O)%-?(\"?aN)", b="an"},
   --
   {a="%-?(aN)(_A)", b="an"},
   {a="%-?(aN)(Y)", b="an"},
   {a="(T)%-?(\"?aN)", b="tan"},
   {a="([^TA])%-?(\"?aN)", b="%1an"}
}

trigraphstrloc = { -- trigraphs or more
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="all%1%2"},
   {a="([%(%[%|%<%s])'ll(a)([%_]?[dt])", b="%1all%2%3"}, --p
   -- al- + lām
   {a="^(a)l%-(l)", b="%1l-%2"},
   {a="(%s)(a)l%-(l)", b="%1%2l-%3"},
   -- al- + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="%1l-%2"}, -- ^n is lunar
   {a="(%s)(a)l%-(%^n)", b="%1%2l-%3"}, -- ^n is lunar
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="%1l-%2"},
   {a="(%s)(a)l%-([%_%^%.]?[tdrzsnc])", b="%1%2l-%3"},
   -- assim. art. + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)(%^n)%-", b="%1l-"}, -- ^n is lunar
   {a="(%s)(a)(%^n)%-", b="%1%2l-"}, -- ^n is lunar
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="%1l-"},
   {a="(%s)(a)([%_%^%.]?[tdrzsnc])%-", b="%1%2l-"},
   -- al- + initial unstable hamza
   {a="^(a)l%-([uai])", b="%1l-%2"},
   {a="(%s)(a)l%-([uai])", b="%1%2l-%3"},
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-([uai])", b="l%1-l-%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="%1l-"},
   {a="(%s)(a)l%-", b="%1%2l-"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="al-%1"},
   -- art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="al-%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="al-%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="l%1-l-%2"},
   -- assim. art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'(%^n)%-", b="al-"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="al-"},
   -- li-/la- + art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="l%1-l-%2"}, -- ^n is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="l%1-l-%2"},
   -- li-/la- + assim. art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="l%1-l-%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="l%1-l-%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-([uai])", b="al-%1"},   
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="al-"},
   -- the silent wāw
   {a="uU$", b="u"},
   {a="uU(%W)", b="u%1"},
   {a="aU$", b="a"},
   {a="aU(%W)", b="a%1"},
   {a="iU$", b="i"},
   {a="iU(%W)", b="i%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="A"},
   {a="(_a)U", b="A"},
   {a="(_a)I", b="A"}
}

digraphstrloc = {
   -- discard the ʾiʿrāb hyphen (begin)
   {a="(%-)(\"?[UI]na)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?[UI]na)(%p*)$", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*%s)", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*)$", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*)$", b="%2%3"},
   {a="(%-)(\"?ayni)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?ayni)(%p*)$", b="%2%3"},
   {a="(%-)([uai])(%p*%s)", b="%2%3"},
   {a="(%-)([uai])(%p*)$", b="%2%3"},
   -- discard the ʾiʿrāb hyphen (end)
   {a="(%-)(\"?[uai])", b="%1%2"}, -- hyphen + initial alif without hamza
   {a="^(\"?[uai])", b="%1"},      -- initial alif without hamza
   {a="(%s)([uai])", b="%1%2"}, -- initial alif without hamza
   {a="%-%-", b=""},
   {a="uww", b="ūw"},
   {a="iyy(%p*)$", b="ī%1"},
   {a="iyy(%p*%s)", b="ī%1"},
   {a="iyy", b="īy"},
   {a="([tkdsg])(h)", b="%1'%2"},
   --   {a="T([^uai])", b="h%1"},
   {a="([a%']l%-)(%S-)T([%(%[%|%<%s])(al%-)", b="%1%2h%3%4"}, --p
   {a="T([%(%[%|%<%s])(al%-)", b="t%1%2"}, --p
   {a="T([%|\"])", b="t%1"},
   {a="T(%p*)$", b="h%1"},
   {a="T(%p*%s)", b="h%1"},
   {a="_t", b="th"},
   {a="%^g", b="j"},
   {a="%.h", b="ḥ"},
   {a="_h", b="kh"},
   {a="_d", b="dh"},
   {a="%^s", b="sh"},
   {a="%.s", b="ṣ"},
   {a="%.d", b="ḍ"},
   {a="%.t", b="ṭ"},
   {a="%.z", b="ẓ"},
   {a="%.g", b="gh"},
   {a="%.y", b="y"},
   -- additional characters (begin)
   {a="%^c", b="ch"},
   {a="%^z", b="zh"},
   {a="%^n", b="ñ"},
   -- additional characters (end)
   {a="(U)(A)", b="ū"},
   {a="WA", b="w"},
   {a="(a)W", b="%1w"},
   {a="_A", b="á"},
   {a="_u", b="ū"},
   {a="_a", b="ā"},
   {a="_i", b="ī"},
   {a="%.b", b="b"},
   {a="%.f", b="f"},
   {a="%.q", b="q"},
   {a="%.k", b="k"},
   {a="%.n", b="n"},
   {a="%^d", b="d"}
}

singletrloc = {
   {a="b", b="b"},
   {a="t", b="t"},
   {a="j", b="j"},
   {a="x", b="kh"},
   {a="d", b="d"},
   {a="r", b="r"},
   {a="z", b="z"},
   {a="s", b="s"},
   {a="`", b="`"},
   {a="f", b="f"},
   {a="q", b="q"},
   {a="k", b="k"},
   {a="l", b="l"},
   {a="m", b="m"},
   {a="n", b="n"},
   {a="h", b="h"},
   {a="w", b="w"},
   {a="y", b="y"},
   {a="T", b="t"},
   -- additional characters (begin)
   {a="p", b="p"},
   {a="v", b="v"},
   {a="g", b="g"},
   -- additional characters (end)
   {a="\"", b=""},
   {a="B", b=""}
}

longvtrloc = {
   {a="A", b="ā"},
   {a="U", b="ū"},
   {a="I", b="ī"},
   {a="aY", b="ay"},
   {a="iY", b="ī"},
   {a="Y", b="á"},
}

shortvtrloc = {
   {a="([uai])([uai])([uai])", b="/%1,%2,%3/"},
   {a="([uai])([uai])", b="/%1,%2/"},
   {a="%.u", b="u"},
   {a="%.a", b="a"},
   {a="%.i", b="i"},
   {a="u", b="u"},
   {a="a", b="a"},
   {a="i", b="i"}
}

finaltrloc = {
   {a="ʾ", b="'"},
}

-- arabica

hamzatrarabica = { -- ≠ from hamzatrloc: initial hamza has to be held
   -- next lines for ʾalif alone
   {a="(%.A)([^uai])", b=".|%2"},
   {a="(%.A)([uai])", b="||%2"},
   -- hard coded hamza
   {a="|\"'", b="ʾ"},
   {a="A\"'", b="ʾA"},
   {a="[au]\"'", b="ʾ"},
   {a="w\"'", b="ʾ"},
   {a="i\"'", b="ʾ"},
   {a="y\"'", b="ʾ"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ʾʾ%1"},
   {a="''([Aa])", b="ʾʾ%1"},
   {a="''([Ii])", b="ʾʾ%1"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="U"},
   {a="%'%_I", b="I"},
   -- taḫfīfu 'l-hamza
   {a="^'u'([^uaiUAI])", b="U%1"},
   {a="([%s%(%[%<%-])'u'([^uaiUAI])", b="%1U%2"},
   {a="^'i'([^uaiUAI])", b="I%1"},
   {a="([%s%(%[%<%-])'i'([^uaiUAI])", b="%1I%2"},
   {a="^u'([^uaiUAI])", b="U%1"},
   {a="([^uaiUAIYN][%s%(%[%<])u'([^uaiUAI])", b="%1U%2"},
   {a="^i'([^uaiUAI])", b="I%1"},
   {a="([^uaiUAIYN][%s%(%[%<])i'([^uaiUAI])", b="%1I%2"},
   -- madda (historic writing below)
   {a="^(')(A)", b="%2"},
   {a="(%W)(')(A)", b="%1%3"},
   {a="^'a'([^uaiUAI])", b="A%1"},
   {a="(%W)'a'([^uaiUAI])", b="%1A%2"},
   {a="'a'([^uaiUAI])", b="A%1"},
   {a="^'a?A", b="A"},
   {a="(%W)'a?A", b="%1A"},
   {a="'a?A", b="ʾA"},
   {a="(A)(')(i)$", b="%1ʾ%3"},
   {a="(A)(')(i)(%W)", b="%1ʾ%3%4"},
   {a="(A)(')(i)", b="%1ʾ%3"}, -- historic madda
   {a="(A)(')", b="%1ʾ"}, -- historic madda
   -- initial (needs both ^ and %W patterns):
   -- hold it for now (see below, beginning of digraphs table)
   {a="^(')([ua])", b="@%2"},
   {a="^(')(i)", b="@%2"},
   -- consider replacing initial %W with [%s%(%[%<%-]:
   --   {a="(%W)(')([ua])", b="%1@%3"},
   --   {a="(%W)(')(i)", b="%1@%3"},
   {a="([%s%(%[%<%-])(')([ua])", b="%1@%3"},
   {a="([%s%(%[%<%-])(')(i)", b="%1@%3"},
   -- final
   {a="([Iy])(')(aN)$", b="%1ʾ%3"},
   {a="([Iy])(')(aN)(%W)", b="%1ʾ%3%4"},
   {a="([^uai])(')([uai]N?)$", b="%1ʾ%3"},
   {a="([^uai])(')([uai]N?)(%W)", b="%1ʾ%3%4"},
   {a="([UI])(')([uai])$", b="%1ʾ%3"},
   {a="([UI])(')([uai])(%W)", b="%1ʾ%3%4"},
   -- middle
   {a="(U)(')", b="%1ʾ"},
   {a="([Iy])(')", b="%1ʾ"},
   {a="([^uai])(')([uU])", b="%1ʾ%3"},
   {a="([^uai])(')(%_?[aAY])", b="%1ʾ%3"},
   {a="([^uai])(')([iI])", b="%1ʾ%3"},
   {a="(u)(')([uU])", b="%1ʾ%3"},
   {a="(u)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(u)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(a)(')([uU])", b="%1ʾ%3"},
   {a="(a)(')([iI])", b="%1ʾ%3"},
   {a="(i)(')(%_?[aAY])", b="%1ʾ%3"},
   {a="(i)(')([uU])", b="%1ʾ%3"},
   {a="(i)(')([iI])", b="%1ʾ%3"},
   {a="(a)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ʾ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ʾ%3"}
}

trigraphstrarabica = { -- trigraphs or more
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="ll%1%2"},
   {a="([%-%(%[%|%<%s])'ll(a)([%_]?[dt])", b="%1ll%2%3"}, --p
   -- al- + lām
   {a="^(a)l%-(l)", b="%1l-%2"},
   {a="(%s)(a)l%-(l)", b="%1%2l-%3"},
   -- al- + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="%1l-%2"}, -- ^n is lunar
   {a="(%s)(a)l%-(%^n)", b="%1%2l-%3"}, -- ^n is lunar
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="%1l-%2"},
   {a="(%s)(a)l%-([%_%^%.]?[tdrzsnc])", b="%1%2l-%3"},
   -- assim. art. + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)(%^n)%-", b="%1l-"}, -- ^n is lunar
   {a="(%s)(a)(%^n)%-", b="%1%2l-"}, -- ^n is lunar
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="%1l-"},
   {a="(%s)(a)([%_%^%.]?[tdrzsnc])%-", b="%1%2l-"},
   -- al- + initial unstable hamza
   {a="^(a)l%-([uai])", b="%1l-%2"},
   {a="(%s)(a)l%-([uai])", b="%1%2l-%3"},
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-([uai])", b="l%1-l-%2"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="%1l-"},
   {a="(%s)(a)l%-", b="%1%2l-"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="l-%1"},
   -- art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="l-%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="l-%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="l%1-l-%2"},
   -- assim. art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'(%^n)%-", b="l-"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="l-"},
   -- li-/la- + art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="l%1-l-%2"}, -- ^n is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="l%1-l-%2"},
   -- li-/la- + assim. art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="l%1-l-%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="l%1-l-%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-([uai])", b="l-%1"},   
   -- art. with waṣla + lunar consonant (i.e. what remains)
   {a="'l%-", b="l-"},
   -- the silent wāw
   {a="uU$", b="u"},
   {a="uU(%W)", b="u%1"},
   {a="aU$", b="a"},
   {a="aU(%W)", b="a%1"},
   {a="iU$", b="i"},
   {a="iU(%W)", b="i%1"},
   -- words ending in -āT with silent wāw/yāʾ
   {a="(_a)UA", b="A"},
   {a="(_a)U", b="A"},
   {a="(_a)I", b="A"}
}

digraphstrarabica = {
   {a="([uai]%-)(\"?[uai])", b="%1"}, -- hyphen + initial alif without hamza
   {a="([UAIYuai])(%s)([%(%[%|%<]?)(\"?[uai])", b="%1%2%3"}, --p
   {a="(O[%S]-)([UAIuai])(O)(\"?[uai])", b=""},
   {a="@", b=""}, -- remove the tag before the former hamza
   -- discard the ʾiʿrāb hyphen (begin)
   {a="(%-)(\"?[UI]na)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?[UI]na)(%p*)$", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*%s)", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*)$", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*)$", b="%2%3"},
   {a="(%-)(\"?ayni)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?ayni)(%p*)$", b="%2%3"},
   {a="(%-)([uai])(%p*%s)", b="%2%3"},
   {a="(%-)([uai])(%p*)$", b="%2%3"},
   -- discard the ʾiʿrāb hyphen (end)
   {a="(%-)(\"?[uai])", b="%1%2"}, -- hyphen + initial alif without hamza
   {a="^(\"?[uai])", b="%1"},      -- initial alif without hamza
   {a="(%s)([uai])", b="%1%2"}, -- initial alif without hamza
   {a="%-%-", b=""},
   {a="iyy(%p*)$", b="ī%1"},
   {a="iyy(%p*%s)", b="ī%1"},
   --   {a="T([^uai])", b="h%1"},
   {a="([a%']l%-)(%S-)aT([%(%[%|%<%s])(al%-)", b="%1%2a%3%4"}, --p
   {a="aT([%(%[%|%<%s])(al%-)", b="at%1%2"}, --p
   {a="T([%|\"])", b="t%1"},
   {a="aT(%p*)$", b="a%1"},
   {a="aT(%p*%s)", b="a%1"},
   {a="_t", b="ṯ"},
   {a="%^g", b="ǧ"},
   {a="%.h", b="ḥ"},
   {a="_h", b="ḫ"},
   {a="_d", b="ḏ"},
   {a="%^s", b="š"},
   {a="%.s", b="ṣ"},
   {a="%.d", b="ḍ"},
   {a="%.t", b="ṭ"},
   {a="%.z", b="ẓ"},
   {a="%.g", b="ġ"},
   {a="%.y", b="y"},
   -- additional characters (begin)
   {a="%^c", b="č"},
   {a="%^z", b="ž"},
   {a="%^n", b="ñ"},
   -- additional characters (end)
   {a="(U)(A)", b="ū"},
   {a="WA", b="w"},
   {a="(a)W", b="%1w"},
   {a="_A", b="ā"},
   {a="_u", b="ū"},
   {a="_a", b="ā"},
   {a="_i", b="ī"},
   {a="%.b", b="b"},
   {a="%.f", b="f"},
   {a="%.q", b="q"},
   {a="%.k", b="k"},
   {a="%.n", b="n"},
   {a="%^d", b="d"}
}

singletrarabica = {
   {a="b", b="b"},
   {a="t", b="t"},
   {a="j", b="ǧ"},
   {a="x", b="ḫ"},
   {a="d", b="d"},
   {a="r", b="r"},
   {a="z", b="z"},
   {a="s", b="s"},
   {a="`", b="ʿ"},
   {a="f", b="f"},
   {a="q", b="q"},
   {a="k", b="k"},
   {a="l", b="l"},
   {a="m", b="m"},
   {a="n", b="n"},
   {a="h", b="h"},
   {a="w", b="w"},
   {a="y", b="y"},
   {a="T", b="t"},
   -- additional characters (begin)
   {a="p", b="p"},
   {a="v", b="v"},
   {a="g", b="g"},
   -- additional characters (end)
   {a="\"", b=""},
   {a="B", b=""}
}

longvtrarabica = {
   {a="aY", b="ay"},
   {a="iY", b="ī"},
   {a="[AY]", b="ā"},
   {a="U", b="ū"},
   {a="I", b="ī"}
}
