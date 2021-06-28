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

arbmarks = {
   {a="@bismillah", b="\\arabicfont{}^^^^fdfd", c="\\arb[trans]{bi-ismi \\uc{'l-l_ahi} 'l-ra.hm_ani 'l-ra.hImi}"},
   {a="@salam", b="\\arabicfont{}^^^^fdf5", c="\\arb[trans]{.sall_A\\arbnull{'l-l_ahu} \\uc{'l-l_ahu} `alay-hi wa-sallama}"},
   {a="@jalla", b="\\arabicfont{}^^^^fdfb", c="\\arb[trans]{^galla ^galAla-hu}"},
   {a="@slm", b="\\arabicfont{}^^^^fdfa", c="\\arb[trans]{.sall_A\\arbnull{'l-l_ahu} \\uc{'l-l_ahu} `alay-hi wa-sallama}"}
}

abjad = {
{"a\"'", "b", "j", "d", "h", "w", "z", ".h", ".t"},
{"y", "k", "l", "m", "n", "s", "`", "f", ".s", },
{"q", "r", "^s", "t", "_t", "x", "_d", ".d", ".z", },
{".g"}
}

numbers = {
   {a="0", b="٠"},
   {a="1", b="١"},
   {a="2", b="٢"},
   {a="3", b="٣"},
   {a="4", b="٤"},
   {a="5", b="٥"},
   {a="6", b="٦"},
   {a="7", b="٧"},
   {a="8", b="٨"},
   {a="9", b="٩"}
}

raw = {
   {a="A", b="َا"},
   {a="U", b="ُو"},
   {a="I", b="ِي"},
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
   {a="u", b="ُ"},
   {a="a", b="َ"},
   {a="i", b="ِ"}
}

buckwalter = {
   --- hard coded madda: hold it for now
   {a="%|", b="@"},
   {a="M", b="@"}, -- BW safe
   {a="%_", b="--"}, -- taṭwīl
   -- prevent any unwanted šadda from being generated
   {a="bb", b="b|b"},
   {a="tt", b="t|t"},
   {a="vv", b="v|v"},
   {a="jj", b="j|j"},
   {a="HH", b="H|H"},
   {a="xx", b="x|x"},
   {a="dd", b="d|d"},
   {a="%*%*", b="*|*"},
   {a="VV", b="V|V"}, -- BW safe
   {a="rr", b="r|r"},
   {a="ss", b="s|s"},
   {a="%$%$", b="$|$"},
   {a="cc", b="c|c"}, -- BW safe
   {a="SS", b="S|S"},
   {a="DD", b="D|D"},
   {a="TT", b="T|T"},
   {a="ZZ", b="Z|Z"},
   {a="EE", b="E|E"},
   {a="gg", b="g|g"},
   {a="ff", b="f|f"},
   {a="qq", b="q|q"},
   {a="kk", b="k|k"},
   {a="ll", b="l|l"},
   {a="mm", b="m|m"},
   {a="nn", b="n|n"},
   {a="hh", b="h|h"},
   {a="ww", b="w|w"},
   {a="yy", b="y|y"},
   -- hamza begin
   -- look into this later on:
--   {a="%>a?A", b="@@@"}, -- hold this (madda)
--   {a="%>a\'([^uai])", b="@@@%1"}, -- hold this (madda)
   {a="a?A\'", b="@@"}, -- hold this (classic madda)
   {a="\'", b="|\"\'"},
   {a="C", b="|\"\'"}, -- BW safe
   {a="%>", b="a\"\'"},
   {a="O", b="a\"\'"}, -- BW safe
   {a="%&", b="w\"\'"},
   {a="W", b="w\"\'"}, -- BW safe
   {a="%<", b="i\"\'"},
   {a="I", b="i\"\'"}, -- BW safe
   {a="%]", b="y\"\'"},
   {a="Q", b="y\"\'"},
   -- hamza end
   -- trigraphs
   {a="^Aal%-?", b="al-"},
   {a="(%W)Aal%-?", b="%1al-"},
   {a="(%s)Aal%-?", b="%1al-"},
   {a="([%-%s])Al%-?", b="%1\'l-"},
   {a="^A", b="a"},
   {a="(%W)A", b="%1a"},
   {a="(%s)A", b="%1a"},
   {a="(al%-[%g])(%~)", b="%1"},
   {a="(\'l%-[%g])(%~)", b="%1"},
   -- digraphs begin
   {a="aA", b="A"},
   {a="uw([^%~])", b="U%1"},
   {a="iy([^%~])", b="I%1"},
   -- digraphs end
   -- madda: get it back now
--   {a="%@%@%@", b="\'A"},
   {a="%@%@", b="A\'"}, -- give back classic madda
   {a="%@", b="A\"\'"}, -- hard coded madda
   -- šadda:
   {a="([%g])(%~)", b="%1%1"},
   {a="%`", b="_a"},
   {a="e", b="_a"}, -- BW safe
   {a="v", b="_t"},
   {a="H", b=".h"},
   {a="%*", b="_d"},
   {a="V", b="_d"}, -- BW safe
   {a="%$", b="^s"},
   {a="c", b="^s"}, -- BW safe
   {a="S", b=".s"},
   {a="D", b=".d"},
   {a="T", b=".t"},
   {a="Z", b=".z"},
   {a="E", b="`"},
   {a="g", b=".g"},
   {a="p", b="T"},
   {a="N", b="uN"},
   {a="F", b="aN"},
   {a="K", b="iN"},
   {a="o", b="\""},
   {a="P", b="O"}, -- pass on to \arbnull
   -- hard-coded connective alif
   {a="%[", b="ٱ"},
   {a="L", b="ٱ"} -- BW safe
}

hamza = {
   -- next line for ʾiʿrāb hyphen
   {a="(')(%-)([uaiUAI])", b="%1%3"},
   -- next lines for ʾalif alone
   {a="(%.A)([uai]?)l%-(%^n)", b="ا%2ل%3"}, --additional (^n is lunar)
   {a="([%(%[%|%<%s%-O])(%.A)([uai]?)l%-(%^n)", b="%1ا%3%4"}, --additional (^n is lunar) --p
   {a="(%.A)([uai]?)l%-([%_%^%.]?[tdrzsnc])", b="ا%2ل%3%3"},
   {a="([%(%[%|%<%s%-O])(%.A)([uai]?)l%-([%_%^%.]?[tdrzsnc])", b="%1ا%3ل%4%4"}, --p
   {a="%.A", b="ا"},
   -- hard coded hamza
   {a="|\"'", b="ء"},
   {a="A\"'", b="آ"},
   {a="[au]\"'", b="أ"},
   {a="w\"'", b="ؤ"},
   {a="i\"'", b="إ"},
   {a="y\"'", b="ئ"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ؤؤ%1"},
   {a="''([Aa])", b="أأ%1"},
   {a="''([Ii])", b="ئئ%1"},
   -- inseparable adverbial particle 'a- + 'a
   {a="\'(a)%-\'(a)", b="أ%1اأ%2"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="أU"},
   {a="%'%_I", b="إI"},
   -- taḫfīfu 'l-hamza
   {a="'u'([^uaiUAI])", b="أU%1"},
   {a="'i'([^uaiUAI])", b="إI%1"},
   {a="([wf]a)%-\'([^uaiUAIl][^%-])", b="%1أ%2"},
   {a="^u'([^uaiUAI])", b="اU%1"},
   {a="([^uaiUAIYN][%s%(%[%<])u'([^uaiUAI])", b="%1اU%2"},
   {a="^i'([^uaiUAI])", b="اI%1"},
   {a="([^uaiUAIYN][%s%(%[%<])i'([^uaiUAI])", b="%1اI%2"},
   -- madda (historic writing below)
   {a="'a'([^uaiUAI])", b="آ%1"},
   {a="([^uiyUI])\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="%1آ%2"},
   {a="^\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="آ%1"},
   {a="\'a?A(O[%_%^%.]?[%`%'btjghxdrzsfqklmnywAY]-O)", b="آ"},
   {a="(%W)\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="%1آ%2"},
   {a="(A)(O%'[%S]-O)", b="آ"},
   {a="(A)(')(uN?%p*)$", b="aآء%3"},
   {a="(A)(')(uN?)(%p*%s)", b="aآء%3%4"},
   {a="(A)(')(iN?%p*)$", b="aآء%3"},
   {a="(A)(')(iN?)(%p*%s)", b="aآء%3%4"},
   {a="(A)(')([iI])", b="aآئ%3"}, -- historic madda
   {a="(A)(')(u)", b="aآؤ%3"}, -- historic madda
   {a="(A)(')", b="aآء"}, -- historic madda
   -- initial (needs both ^ and %W patterns)
   -- 'aw: the diphthong is to be resolved into 'awi' (next 8 lines)
   {a="^('aw)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1%2i"},
   {a="^('aw)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)(\"?[uai])([%S]-O)", b="%1%2i"},
   {a="^('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   {a="(%W)('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1%2i%3%4"},
   {a="^('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1i%2%3"}, --p
   {a="(%W)('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1%2i%3%4"}, --p
   -- then the 'initial' rules for the remaining cases
   {a="^(')([ua])", b="أ%2"},
   {a="^(')(i)", b="إ%2"},
   -- consider replacing initial %W with [%s%(%[%<%-]:
   --   {a="(%W)(')([ua])", b="%1أ%3"},
   --   {a="(%W)(')(i)", b="%1إ%3"},
   {a="([%s%(%[%<%-])(')([ua])", b="%1أ%3"},
   {a="([%s%(%[%<%-])(')(i)", b="%1إ%3"},
   -- final
   -- mi'aT is special orthography (unlike ^say'aN and .zim'aN):
   -- {a="(%^sa%.?[yY])(\"?%|?)(%')(aN)", b="%1%2ئ%4"}, --new
   -- {a="(.zi?m)(%')(aN)", b="%1ئ%3"}, --new
   {a="(mi)(%')(a[Tt])", b="%1ائ%3"},
   {a="(mi)(%')(aN%_?[AY])", b="%1أ%3"},
   -- final hamzah is on the line after a letter of prolongation or a
   -- consonant with sukūn
   {a="([^Auai])(')(\"?[uai]N?)(%p*)$", b="%1ء%3%4"}, --new
   {a="([^Auai])(')(\"?[uai]N?)(%p*%s)", b="%1ء%3%4"},
-- u
   {a="(u)(')([uai]N?%p*)$", b="%1ؤ%3"},
   {a="(u)(')([uai]N?)(%p*%s)", b="%1ؤ%3%4"},
   {a="(u)(')(%p*)$", b="%1ؤ%3"},
   {a="(u)(')(%p*%s)", b="%1ؤ%3"},
-- a
   {a="(a)(')(A%p*)$", b="%1آ"},
   {a="(a)(')(A)(%p*%s)", b="%1آ%4"},
   {a="(a)(')([u]N?%p*)$", b="%1أ%3"},
   {a="(a)(')([u]N?)(%p*%s)", b="%1أ%3%4"},
   {a="(a)(')(a%p*)$", b="%1أ%3"},
   {a="(a)(')(a)(%p*%s)", b="%1أ%3%4"},
   {a="(a)(')(aN%p*)$", b="%1أً"},
   {a="(a)(')(aN)(%p*%s)", b="%1أً%4"},
   {a="(a)(')([i]N?%p*)$", b="%1إ%3"},
   {a="(a)(')([i]N?)(%p*%s)", b="%1إ%3%4"},
   {a="(a)(')(%p*)$", b="%1أ%3"},
   {a="(a)(')(%p*%s)", b="%1أ%3"},
-- i
   {a="(i)(')([uai]N?%p*)$", b="%1ئ%3"},
   {a="(i)(')([uai]N?)(%p*%s)", b="%1ئ%3%4"},
   {a="(i)(')(%p*)$", b="%1ئ%3"},
   {a="(i)(')(%p*%s)", b="%1ئ%3"},
--
   -- middle
   {a="([UIwy])(')", b="%1ء"}, --new
   -- {a="([Iy])(')", b="%1ئ"}, -- included in the above line
   -- hamza is alone after letters of prolongation or sukūn
   -- {a="([^uai])(')([uU])", b="%1ؤ%3"},
   -- {a="([^uai])(')(%_?[aAY])", b="%1أ%3"},
   -- {a="([^uai])(')([iI])", b="%1ئ%3"},
   {a="([^uai])(')(%_?[uaiUAYI])", b="%1ء%3"},
   {a="(u)(')([UI])", b="%1ء%3"},
   {a="(u)(')([u])", b="%1ؤ%3"},
   {a="(u)(')(%_?[aAY])", b="%1ؤ%3"},
   {a="(u)(')([i])", b="%1ئ%3"},
   {a="(a)(')(%_?[aAY])", b="%1أ%3"},
   {a="(a)(')([uU])", b="%1ؤ%3"},
   {a="(a)(')([iI])", b="%1ئ%3"},
   {a="(i)(')([UI])", b="%1ء%3"},
   {a="(i)(')(%_?[aAY])", b="%1ئ%3"},
   {a="(i)(')([u])", b="%1ئ%3"},
   {a="(i)(')([i])", b="%1ئ%3"},
   {a="(a)(')([^uaiUAI])", b="%1أ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ؤ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ئ%3"}
}

hamzaeasy = { -- differences marked below with 'easy'
   -- next line for ʾiʿrāb hyphen
   {a="(')(%-)([uaiUAI])", b="%1%3"},
   -- next lines for ʾalif alone (easy)
   {a="(%.A)([uai]?)l%-(%^n)", b="ا%2ل%3"}, --additional (^n is lunar)
   {a="([%(%[%|%<%s%-O])(%.A)([uai]?)l%-(%^n)", b="%1ا%3%4"}, --additional (^n is lunar) --p
   {a="(%.A)([uai]?)l%-([%_%^%.]?[tdrzsnc])", b="ا%2ل%3"},
   {a="([%(%[%|%<%s%-O])(%.A)([uai]?)l%-([%_%^%.]?[tdrzsnc])", b="%1ا%3ل%4"}, --p
   {a="%.A", b="ا"},
   -- hard coded hamza
   {a="|\"'", b="ء"},
   {a="A\"'", b="آ"},
   {a="[au]\"'", b="أ"},
   {a="w\"'", b="ؤ"},
   {a="i\"'", b="إ"},
   {a="y\"'", b="ئ"},
   -- hamza takes tašdīd too
   {a="''([Uu])", b="ؤؤ%1"},
   {a="''([Aa])", b="أأ%1"},
   {a="''([Ii])", b="ئئ%1"},
   -- inseparable adverbial particle 'a- + 'a
   {a="\'(a)%-\'(a)", b="أ%1اأ%2"},
   -- initial long u and i (for a, see below)
   {a="%'%_U", b="أU"},
   {a="%'%_I", b="إI"},
   -- taḫfīfu 'l-hamza
   {a="'u'([^uaiUAI])", b="أU%1"},
   {a="'i'([^uaiUAI])", b="إI%1"},
   {a="([wf]a)%-\'([^uaiUAIl][^%-])", b="%1أ%2"},
   {a="^u'([^uaiUAI])", b="اU%1"},
   {a="([^uaiUAIYN][%s%(%[%<])u'([^uaiUAI])", b="%1اU%2"},
   {a="^i'([^uaiUAI])", b="اI%1"},
   {a="([^uaiUAIYN][%s%(%[%<])i'([^uaiUAI])", b="%1اI%2"},
   -- madda (historic writing below)
   {a="'a'([^uaiUAI])", b="آ%1"},
   {a="([^uiyUI])\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="%1آ%2"},
   {a="^\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="آ%1"},
   {a="\'a?A(O[%_%^%.]?[%`%'btjghxdrzsfqklmnywAY]-O)", b="آ"},
   {a="(%W)\'a?A([%_%^%.]?[%`%'btjghxdrzsfqklmnywAY])", b="%1آ%2"},
   --easy (begin)
   {a="(A)(O%'[%S]-O)", b="ا"},
   {a="(A)(')(uN?%p*)$", b="aاء%3"},
   {a="(A)(')(uN?)(%p*%s)", b="aاء%3%4"},
   {a="(A)(')(iN?%p*)$", b="aاء%3"},
   {a="(A)(')(iN?)(%p*%s)", b="aاء%3%4"},
   {a="(A)(')([iI])", b="aائ%3"}, -- historic madda
   {a="(A)(')(u)", b="aاؤ%3"}, -- historic madda
   {a="(A)(')", b="aاء"}, -- historic madda
   --easy (end)
   -- initial (needs both ^ and %W patterns)
   -- 'aw: the diphthong is to be resolved into 'awi' (next 8 lines)
   {a="^('aw)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)('[%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1%2i"},
   {a="^('aw)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(%W)('aw)(O)(\"?[uai])([%S]-O)", b="%1%2i"},
   {a="^('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   {a="(%W)('aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1%2i%3%4"},
   {a="^('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1i%2%3"},
   {a="(%W)('aw)(%s)([%(%[%|%<]?\"?[uai])", b="%1%2i%3%4"},
   -- then the 'initial' rules for the remaining cases
   {a="^(')([ua])", b="أ%2"},
   {a="^(')(i)", b="إ%2"},
   -- consider replacing initial %W with [%s%(%[%<%-]:
   --   {a="(%W)(')([ua])", b="%1أ%3"},
   --   {a="(%W)(')(i)", b="%1إ%3"},
   {a="([%s%(%[%<%-])(')([ua])", b="%1أ%3"},
   {a="([%s%(%[%<%-])(')(i)", b="%1إ%3"},
   -- final
   -- mi'aT is special orthography (unlike ^say'aN and .zim'aN)
   -- {a="(%^sa%.?[yY])(\"?%|?)(%')(aN)", b="%1%2ئ%4"}, --new
   -- {a="(.zi?m)(%')(aN)", b="%1ئ%3"}, --new
   {a="(mi)(%')(a[Tt])", b="%1ائ%3"},
   {a="(mi)(%')(aN%_?[AY])", b="%1أ%3"},
   -- easy (begin)
   -- The Munjid says that such words as radI'aN do not have the
   -- hamzah alone on the line, so take out the following two lines
   -- (final hamzah is on the line after a letter of prolongation or a
   -- consonant with sukūn)
   -- {a="([^Auai])(')(\"?[uai]N?)(%p*)$", b="%1ء%3%4"}, --new
   -- {a="([^Auai])(')(\"?[uai]N?)(%p*%s)", b="%1ء%3%4"},
   {a="([^Auai])(')(\"?aN)(%p*)$", b="%1ئ%3%4"}, --new
   {a="([^Auai])(')(\"?aN)(%p*%s)", b="%1ئ%3%4"}, --new
   {a="([^uai])(')(\"?a)(%p*)$", b="%1ء%3%4"}, --new
   {a="([^uai])(')(\"?a)(%p*%s)", b="%1ء%3%4"}, --new
   {a="([^uai])(')(\"?[ui]N?)(%p*)$", b="%1ء%3%4"}, --new
   {a="([^uai])(')(\"?[ui]N?)(%p*%s)", b="%1ء%3%4"}, --new
   --easy (end)
-- u
   {a="(u)(')([uai]N?%p*)$", b="%1ؤ%3"},
   {a="(u)(')([uai]N?)(%p*%s)", b="%1ؤ%3%4"},
   {a="(u)(')(%p*)$", b="%1ؤ%3"},
   {a="(u)(')(%p*%s)", b="%1ؤ%3"},
-- a
   {a="(a)(')(A%p*)$", b="%1آ"},
   {a="(a)(')(A)(%p*%s)", b="%1آ%4"},
   {a="(a)(')([u]N?%p*)$", b="%1أ%3"},
   {a="(a)(')([u]N?)(%p*%s)", b="%1أ%3%4"},
   {a="(a)(')(a%p*)$", b="%1أ%3"},
   {a="(a)(')(a)(%p*%s)", b="%1أ%3%4"},
   {a="(a)(')(aN%p*)$", b="%1أً"},
   {a="(a)(')(aN)(%p*%s)", b="%1أً%4"},
   {a="(a)(')([i]N?%p*)$", b="%1إ%3"},
   {a="(a)(')([i]N?)(%p*%s)", b="%1إ%3%4"},
   {a="(a)(')(%p*)$", b="%1أ%3"},
   {a="(a)(')(%p*%s)", b="%1أ%3"},
-- i
   {a="(i)(')([uai]N?%p*)$", b="%1ئ%3"},
   {a="(i)(')([uai]N?)(%p*%s)", b="%1ئ%3%4"},
   {a="(i)(')(%p*)$", b="%1ئ%3"},
   {a="(i)(')(%p*%s)", b="%1ئ%3"},
--
   -- middle
   {a="([Uw])(')", b="%1ء"}, --new
   {a="([Iy])(')", b="%1ئ"}, --easy
   {a="([^uai])(')([uU])", b="%1ؤ%3"},
   {a="([^uai])(')(%_?[aAY])", b="%1أ%3"},
   {a="([^uai])(')([iI])", b="%1ئ%3"},
   {a="(u)(')([uU])", b="%1ؤ%3"},
   {a="(u)(')(%_?[aAY])", b="%1ؤ%3"},
   {a="(u)(')([iI])", b="%1ئ%3"},
   {a="(a)(')(%_?[aAY])", b="%1أ%3"},
   {a="(a)(')([uU])", b="%1ؤ%3"},
   {a="(a)(')([iI])", b="%1ئ%3"},
   {a="(i)(')(%_?[aAY])", b="%1ئ%3"},
   {a="(i)(')([uU])", b="%1ئ%3"},
   {a="(i)(')([iI])", b="%1ئ%3"},
   {a="(a)(')([^uaiUAI])", b="%1أ%3"},
   {a="(u)(')([^uaiUAI])", b="%1ؤ%3"},
   {a="(i)(')([^uaiUAI])", b="%1ئ%3"}
}

tanwin = {
   -- assimilations (begin)
   {a="(O[%S]-)(%-?[uai]N[UI]?)(O)([rlmnwy])", b="%4%4"},
   {a="(%-?[uai]NU)(%s)([rlmnwy])", b="%1%2%3%3"},
   -- assimilations (end)
   {a="(O[%S]-)(%-?[uai]N[UI]?)(O)([uai])", b="%4"},
   {a="%-?uNU", b="ٌو"},
   {a="%-?aNU", b="ًوا"},
   {a="%-?iNU", b="ٍو"},
   -- assimilations (begin)
   {a="%-?(uN)(%s)([rlmnwy])", b="ٌ%2%3%3"},
   {a="(O[%S]-)(%-?aN)(_A)(O)([rlmnwy])", b="%5%5"},
   {a="(O[%S]-)(%-?aN)(Y)(O)([rlmnwy])", b="%5%5"},
   {a="%-?(aN)(_A)(%s)([rlmnwy])", b="ًى%3%4%4"},
   {a="%-?(aN)(Y)(%s)([rlmnwy])", b="ًى%3%4%4"},
   {a="(T)%-?(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
   {a="(ء)%-?(aN)(%s)([rlmnwy])", b="%1%2%3%4%4"}, --new
   {a="([^TA])%-?(aN)(%s)([rlmnwy])", b="%1ًا%3%4%4"},
   {a="%-?(iNI?)(%s)([rlmnwy])", b="ٍ%2%3%3"},
   -- assimilations (end)
   {a="(O[%S]-)(%-?aN)(_A)(O)([uai])", b="%5"},
   {a="(O[%S]-)(%-?aN)(Y)(O)([uai])", b="%5"},
   -- quoted tanwīn (begin)
   {a="%-?(\"uN)", b=""},
   {a="(B)%-?(\"aN)", b="%1"},
   {a="%-?(\"aN)(_A)", b="ى"},
   {a="%-?(\"aN)(Y)", b="ى"},
   {a="(T)%-?(\"aN)", b="%1"},
   {a="([اآ])(ء)%-?(\"aN)", b="%1%2"}, --new
   {a="([^TA])%-?(\"aN)", b="%1ا"},
   {a="%-?(\"iNI?)", b=""},
   -- quoted tanwīn (end)
   {a="%-?(uN)", b="ٌ"},
   {a="(B)%-?(aN)", b="%1ً"},
   -- needed by \arbcolor:
   {a="%-?(aN)(O[%S]-%_AO)", b="ً"},
   {a="%-?(aN)(O[%S]-YO)", b="ً"},
   {a="(O[%S]-TO)%-?(aN)", b="ً"},
   {a="(O[%S]-)([اآ])(ء)(O)%-?(aN)", b="ً"}, --new
   {a="(O[%S]-[^TA]O)%-?(aN)", b="ًا"},
   --
   {a="%-?(aN)(_A)", b="ًى"},
   {a="%-?(aN)(Y)", b="ًى"},
   {a="(T)%-?(aN)", b="%1ً"},
   {a="([اآ])(ء)%-?(aN)", b="%1%2ً"}, --new
   {a="([^TA])%-?(aN)", b="%1ًا"},
   {a="%-?(iNI?)", b="ٍ"}
}

tanwineasy = { -- 'easy' requires some lines to be taken out:
   -- assimilations (begin)
--   {a="(O[%S]-)(%-?[uai]N[UI]?)(O)([rlmnwy])", b="%4%4"},
--   {a="(%-?[uai]NU)(%s)([rlmnwy])", b="%1%2%3%3"},
   -- assimilations (end)
   {a="(O[%S]-)(%-?[uai]N[UI]?)(O)([uai])", b="%4"},
   {a="%-?uNU", b="ٌو"},
   {a="%-?aNU", b="ًوا"},
   {a="%-?iNU", b="ٍو"},
   -- assimilations (begin)
--   {a="%-?(uN)(%s)([rlmnwy])", b="ٌ%2%3%3"},
--   {a="(O[%S]-)(%-?aN)(_A)(O)([rlmnwy])", b="%5%5"},
--   {a="(O[%S]-)(%-?aN)(Y)(O)([rlmnwy])", b="%5%5"},
--   {a="%-?(aN)(_A)(%s)([rlmnwy])", b="ًى%3%4%4"},
--   {a="%-?(aN)(Y)(%s)([rlmnwy])", b="ًى%3%4%4"},
--   {a="(T)%-?(aN)(%s)([rlmnwy])", b="%1ً%3%4%4"},
--   {a="(ء)%-?(aN)(%s)([rlmnwy])", b="%1%2%3%4%4"}, --new
--   {a="([^TA])%-?(aN)(%s)([rlmnwy])", b="%1ًا%3%4%4"},
--   {a="%-?(iNI?)(%s)([rlmnwy])", b="ٍ%2%3%3"},
   -- assimilations (end)
   {a="(O[%S]-)(%-?aN)(_A)(O)([uai])", b="%5"},
   {a="(O[%S]-)(%-?aN)(Y)(O)([uai])", b="%5"},
   -- quoted tanwīn (begin)
   {a="%-?(\"uN)", b=""},
   {a="(B)%-?(\"aN)", b="%1"},
   {a="%-?(\"aN)(_A)", b="ى"},
   {a="%-?(\"aN)(Y)", b="ى"},
   {a="(T)%-?(\"aN)", b="%1"},
   {a="([اآ])(ء)%-?(\"aN)", b="%1%2"}, --new
   {a="([^TA])%-?(\"aN)", b="%1ا"},
   {a="%-?(\"iNI?)", b=""},
   -- quoted tanwīn (end)
   {a="%-?(uN)", b="ٌ"},
   {a="(B)%-?(aN)", b="%1ً"},
   -- needed by \arbcolor:
   {a="%-?(aN)(O[%S]-%_AO)", b="ً"},
   {a="%-?(aN)(O[%S]-YO)", b="ً"},
   {a="(O[%S]-TO)%-?(aN)", b="ً"},
   {a="(O[%S]-)([اآ])(ء)(O)%-?(aN)", b="ً"}, --new
   {a="(O[%S]-[^TA]O)%-?(aN)", b="ًا"},
   --
   {a="%-?(aN)(_A)", b="ًى"},
   {a="%-?(aN)(Y)", b="ًى"},
   {a="(T)%-?(aN)", b="%1ً"},
   {a="([اآ])(ء)%-?(aN)", b="%1%2ً"}, --new
   {a="([^TA])%-?(aN)", b="%1ًا"},
   {a="%-?(iNI?)", b="ٍ"}
}

trigraphs = { -- trigraphs or more
   -- ʾalif al-waṣl: put it back on with \arbnull
   {a="(O[%S]-)([%'a]l%-)(O)(\"[uai])", b="ٱ"},
   {a="(O[%S]-)([%'a]l%-)(O)([uai])", b="ا"},
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="الّ%1%2"},
   {a="([%(%[%|%<%s%-])'ll(a)([%_]?[dt])", b="%1الّ%2%3"}, --p
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
   {a="^(a)l%-(l)", b="ا%1ل%2%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-(l)", b="%1ا%2ل%3%3"}, --p
   -- al- + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="ا%1ل%2"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)l%-(%^n)", b="%1ا%2ل%3"},-- ^n is lunar --p
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="ا%1ل%2%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-([%_%^%.]?[tdrzsnc])", b="%1ا%2ل%3%3"}, --p
   -- assim. art. + solar consonant ('c' and '^n' are additional characters)
   {a="^(a)(%^n)%-", b="ا%1ل"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)(%^n)%-", b="%1ا%2ل"},-- ^n is lunar --p
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="ا%1ل%2"},
   {a="([%(%[%|%<%s%-O])(a)([%_%^%.]?[tdrzsnc])%-", b="%1ا%2ل%3"}, --p
   -- al- + initial unstable hamza
   {a="^(a)l%-(\")([uai])", b="ا%1ل%3ٱ"},
   {a="([%(%[%|%<%s%-O])(a)l%-(\")([uai])", b="%1ا%2ل%4ٱ"}, --p
   {a="^(a)l%-([uai])", b="ا%1ل%2ا"},
   {a="([%(%[%|%<%s%-O])(a)l%-([uai])", b="%1ا%2ل%3ا"}, --p
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-(\")([uai])", b="ل%1ل%3ٱ"},
   {a="l([ai])%-l%-([uai])", b="ل%1ل%2ا"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="ا%1ل"},
   {a="([%(%[%|%<%s%-O])(a)l%-", b="%1ا%2ل"}, --p
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="awuا"},
   {a="(aw)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1u"},
   {a="(ay)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(aW)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="awuا%2%3"},
   {a="(aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1u%2%3"},
   {a="(ay)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   -- art. with waṣla + lām
   {a="'l%-(l)", b="ال%1%1"},
   -- art. with waṣla + solar consonant
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="ال%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="ال%1%1"},
   -- li-/la- + art. + lām
   {a="l([ai])%-l%-(l)", b="ل%1%2%2"},
   -- assim. art. with waṣla + solar consonant ('c' and '^n' are
   -- additional characters)   
   {a="'(%^n)%-", b="ال"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="ال%1"},
   -- li-/la- + art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="ل%1ل%2"}, -- '^n' is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%2%2"},
   -- li-/la + assim. art. + solar consonant is a special orthography
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="ل%1ل%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%3%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\")([uai])", b="ال%2ٱ"},
   {a="'l%-([uai])", b="ال%1ا"},   
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

idgham = {
   -- assimilations
   {a="(n)(%s)([rlmnwy])", b="%1%2%3%3"},
   {a="(n)(O)([rlmnwy])([%S]-O)", b="%3"}
}

trigraphseasy = { -- differences marked below with 'easy'
   -- ʾalif al-waṣl: put it back on with \arbnull
   {a="(O[%S]-)([%'a]l%-)(O)(\"[uai])", b="ٱ"},
   {a="(O[%S]-)([%'a]l%-)(O)([uai])", b="ا"},
   -- Allah (easy)
   {a="l%-l_ah", b="l-ll_ah"},
   -- 'llatI / 'llad_I
   {a="^'ll(a)([%_]?[dt])", b="الّ%1%2"},
   {a="([%(%[%|%<%s%-])'ll(a)([%_]?[dt])", b="%1الّ%2%3"}, --p
   -- law: the diphthong is to be resloved into 'awi' (next 8 lines)
   {a="^(law)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(%W)(law)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1%2i"},
   {a="^(law)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(%W)(law)(O)(\"?[uai])([%S]-O)", b="%1%2i"},
   {a="^(law)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   {a="(%W)(law)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1%2i%3%4"},
   {a="^(law)(%s)([%(%[%|%<]?\"?[uai])", b="%1i%2%3"}, --p
   {a="(%W)(law)(%s)([%(%[%|%<]?\"?[uai])", b="%1%2i%3%4"}, --p
   -- al- + lām (easy)
   {a="^(a)l%-(l)", b="ا%1ل%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-(l)", b="%1ا%2ل%3"}, --p
   -- al- + solar consonant (easy) ('c' and '^n' are additional characters)
   {a="^(a)l%-(%^n)", b="ا%1ل%2"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)l%-(%^n)", b="%1ا%2ل%3"}, -- ^n is lunar --p
   {a="^(a)l%-([%_%^%.]?[tdrzsnc])", b="ا%1ل%2"},
   {a="([%(%[%|%<%s%-O])(a)l%-([%_%^%.]?[tdrzsnc])", b="%1ا%2ل%3"}, --p
   -- assim. art. + solar consonant (easy) ('c' and '^n' are
   -- additional characters)
   {a="^(a)(%^n)%-", b="ا%1ل"}, -- ^n is lunar
   {a="([%(%[%|%<%s%-O])(a)(%^n)%-", b="%1ا%2ل"}, -- ^n is lunar --p
   {a="^(a)([%_%^%.]?[tdrzsnc])%-", b="ا%1ل"},
   {a="([%(%[%|%<%s%-O])(a)([%_%^%.]?[tdrzsnc])%-", b="%1ا%2ل"}, --p
   -- al- + initial unstable hamza
   {a="^(a)l%-(\")([uai])", b="ا%1ل%3ٱ"},
   {a="([%(%[%|%<%s%-O])(a)l%-(\")([uai])", b="%1ا%2ل%4ٱ"}, --p
   {a="^(a)l%-([uai])", b="ا%1ل%2ا"},
   {a="([%(%[%|%<%s%-O])(a)l%-([uai])", b="%1ا%2ل%3ا"}, --p
   -- li-/la- + art. + initial unstable hamza is a special orthography
   {a="l([ai])%-l%-(\")([uai])", b="ل%1ل%3ٱ"},
   {a="l([ai])%-l%-([uai])", b="ل%1ل%2ا"},
   -- al- + lunar consonant (i.e. what remains)
   {a="^(a)l%-", b="ا%1ل"},
   {a="([%(%[%|%<%s%-O])(a)l%-", b="%1ا%2ل"}, --p
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="awuا"},
   {a="(aw)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1u"},
   {a="(ay)(O)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)([%S]-O)", b="%1i"},
   {a="(aW)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="awuا%2%3"},
   {a="(aw)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1u%2%3"},
   {a="(ay)(%s)(['][%_%^%.]?[l'btjghxdrzs`fqkmnwy]%-)", b="%1i%2%3"},
   -- art. with waṣla + lām (easy)
   {a="'l%-(l)", b="ال%1"},
   -- art. with waṣla + solar consonant (easy)
   -- ('c' and '^n' are additional characters)
   {a="'l%-(%^n)", b="ال%1"}, -- ^n is lunar
   {a="'l%-([%_%^%.]?[tdrzsnc])", b="ال%1"},
   -- li-/la- + art. + lām (easy)
   {a="l([ai])%-l%-(l)", b="ل%1%2"},
   -- assim. art. with waṣla + solar consonant (easy)
   -- ('c' and '^n' are additional characters)
   {a="'(%^n)%-", b="ال"}, -- ^n is lunar
   {a="'([%_%^%.]?[tdrzsnc])%-", b="ال"},
   -- li-/la- + art. + solar consonant is a special orthography (easy)
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-l%-(%^n)", b="ل%1ل%2"}, -- ^n is lunar
   {a="l([ai])%-l%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%2"},
   -- li-/la + assim. art. + solar consonant is a special orthography (easy)
   -- ('c' and '^n' are additional characters)
   {a="l([ai])%-(%^n)%-(%^n)", b="ل%1ل%3"}, -- ^n is lunar
   {a="l([ai])%-([%_%^%.]?[tdrzsnc])%-([%_%^%.]?[tdrzsnc])", b="ل%1ل%3"},
   -- art. with waṣla + initial unstable hamza
   {a="'l%-(\")([uai])", b="ال%2ٱ"},
   {a="'l%-([uai])", b="ال%1ا"},
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

digraphs = {
   -- ʾiʿrāb: straight double quote must be discarded
   {a="(%-)(\"?[UI]na)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?[UI]na)(%p*)$", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*%s)", b="%2%3"},
   {a="(%-)(\"?At[ui])(%p*)$", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?Ani)(%p*)$", b="%2%3"},   
   {a="(%-)(\"?ayni)(%p*%s)", b="%2%3"},
   {a="(%-)(\"?ayni)(%p*)$", b="%2%3"},
   {a="(%-)(\"?[uai])(%p*%s)", b="%2%3"},
   {a="(%-)(\"?[uai])(%p*)$", b="%2%3"},
   -- ʾiʿrāb (end)
   -- initial straight double quote gives a connective ʾalif
   {a="^\"[uai]", b="ٱ"},
   {a="([%(%[%|%<%s%-])\"[uai]", b="%1ٱ"}, --p
   -- diphthongs to be resolved before ʾalif conjunctionis
   {a="(aW)(O)(\"?[uai])([%S]-O)", b="awuا"},
   {a="(aW)(%s)([%(%[%|%<]?)([uai])", b="awuا%2%3%4"}, --p
   {a="(aw)(O)(\"?[uai])([%S]-O)", b="%1u"},
   {a="(aw)(%s)([%(%[%|%<]?)(\"?[uai])", b="%1u%2%3ا"}, --p
   {a="(ay)(O)(\"?[uai])([%S]-O)", b="%1i"},
   {a="(ay)(%s)([%(%[%|%<]?)(\"?[uai])", b="%1i%2%3ا"}, --p
   -- hyphen + initial alif without hamza:
   {a="([uai]%-)(\"?[uai])([%^%_%.%`]?)([%aإأؤئ])", b="%1ا%3%4"},
   -- initial alif without hamza
   {a="^([%(%[%|%<]?)(\"?[uai])", b="%1ا%2"}, --p
   -- initial alif without hamza
   {a="(O[%S]-)([uaiUAIY])(O)(\"?[uai])", b="ا"},
   {a="(%s)([%(%[%|%<]?)(\"?[uai])", b="%1%2ا"}, --p
   {a="%-%-", b="ـ"},
   {a="ؤؤ", b="ؤّ"},
   {a="أأ", b="أّ"},
   {a="ئئ", b="ئّ"},
   {a="bb", b="بّ"},
   {a="BB", b="ـّ"},
   {a="([%_%^%.])([tghdsz])([tghdsz])", b="%1%2|%3"},
   -- same as above for additional characters:
   {a="([%_%^%.])([cn])([cn])", b="%1%2|%3"},
   {a="tt", b="تّ"},
   {a="%_t%_t", b="ثّ"},
   {a="jj", b="جّ"},
   {a="%^g%^g", b="جّ"},
   {a="%.h%.h", b="حّ"},
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
   {a="%.y%.y", b="ىّ"},
   -- additional characters + šaddah (begin)
   {a="pp", b="پّ"},
   {a="vv", b="ڤّ"},
   {a="gg", b="گّ"},
   {a="%^c%^c", b="چّ"},
   {a="%^z%^z", b="ژّ"},
   {a="%^n%^n", b="ڭّ"},
   -- additional characters + šaddah (end)
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
   {a="%.y", b="ى"},
   -- additional characters (begin)
   {a="%^c", b="چ"},
   {a="%^z", b="ژ"},
   {a="%^n", b="ڭ"},
   -- additional characters (end)
   {a="(U)(A)", b="%1ا"},
   {a="WA", b="وا"},
   {a="(a)W\"", b="%1وْا"},
   {a="(a)W", b="%1وا"},
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

single = {
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
   -- additional characters (begin)
   {a="p", b="پ"},
   {a="v", b="ڤ"},
   {a="g", b="گ"},
   -- additional characters (end)
   {a="\"$", b="ْ"},
   {a="\"(%W)", b="ْ%1"},
   {a="\"([^uaiUAI])", b="ْ%1"},
   {a="o", b="ْ"}, -- hard-coded sukūn
   {a="([^0-9])%-([^0-9])", b="%1%2"},
   {a="B", b="ـ"}
}

longv = {
   {a="\"A", b="ا"},
   {a="\"U", b="و"},
   {a="\"I", b="ي"},
   {a="\"Y", b="ى"},
   {a="A", b="َا"},
   {a="U", b="ُو"},
   {a="I", b="ِي"},
   {a="aY", b="aى"},
   {a="iY", b="iى"},
   {a="Y", b="aى"}
}

shortv = {
   {a="\"u", b=""},
   {a="\"a", b=""},
   {a="\"i", b=""},
   {a="%-?%.u", b="ُ"},
   {a="%-?%.a", b="َ"},
   {a="%-?%.i", b="ِ"},
   {a="u", b="ُ"},
   {a="a", b="َ"},
   {a="i", b="ِ"}
}

punctuation = {
   {a="%(%(", b="﴿"},
   {a="%)%)", b="﴾"},
   {a="%(", b="+@("},
   {a="%)", b="-@("},
   {a="%+%@%(", b=")"},
   {a="%-%@%(", b="("},
   {a="%<", b="+@<"},
   {a="%>", b="-@<"},
   {a="%+%@%<", b=">"},
   {a="%-%@%<", b="<"},
   {a="%[", b="+@["},
   {a="%]", b="-@["},
   {a="%+%@%[", b="]"},
   {a="%-%@%[", b="["},
   {a="%.", b="."},
   -- replaced with the next two rules to make the Arabic comma work
   --   after \abraces{}
--   {a="([^0-9])%,", b="%1،"},
   {a="%,", b="،"},
   {a="([%d])%،", b="%1,"},
   {a="%?", b="؟"},
   {a="%;", b="؛"},
}

null = {
   {a="%&", b="‍"}, -- That is ^^^^200d, the zero-width joiner
   {a="%|", b=""},
   {a="^%-", b=""},
   {a="([^0-9])(%-)", b="%1"},
   {a="O[%S]-O", b=""},
   {a="[%^%_](.)", b=">??<%1"}
}
