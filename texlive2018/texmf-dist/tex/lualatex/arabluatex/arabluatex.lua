--[[
This file is part of the `arabluatex' package

ArabLuaTeX -- Processing ArabTeX notation under LuaLaTeX
Copyright (C) 2016--2018  Robert Alessi

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

require("arabluatex_voc")
require("arabluatex_fullvoc")
require("arabluatex_novoc")
require("arabluatex_trans")

local function protectarb(str)
   str = string.gsub(str, "(\\arb.?)(%[.-%])(%b{})", "\\@arb%2%3")
   str = string.gsub(str, "(\\begin.?)(%b{})(%b[])", "\\@begin%3%2")
   str = string.gsub(str, "(\\begin.?)(%b{})", "\\@begin%2")
   str = string.gsub(str, "(\\end.?)(%b{})", "\\@end%2")
   str = string.gsub(str, "\\par", "\\p@r{}")
   str = string.gsub(str, "\\@@par", "\\p@r{}")
return str
end

local function unprotectarb(str)
   str = string.gsub(str, "(\\@arb)(%[.-%])(%b{})", "\\arb%2%3")
   str = string.gsub(str, "(\\@begin)(%b[])(%b{})", "\\begin%3%2")
   str = string.gsub(str, "(\\@begin)(%b{})", "\\begin%2")
   str = string.gsub(str, "(\\@end)(%b{})", "\\end%2")
   str = string.gsub(str, "\\p@r{}", "\\par")
return str
end

brkcmds = {}

function mkarbbreak(str)
   str = str ..","
   str = string.gsub(str, "%s+", "")
   local fieldstart = 1
   repeat
      local nexti = string.find(str, "%,", fieldstart)
      table.insert(brkcmds, string.sub(str, fieldstart, nexti-1))
      fieldstart = nexti +1
   until fieldstart > string.len(str)
   return brkcmds
end

local function breakcmd(str)
   -- user commands
   if next(brkcmds) == nil then
      -- nothing to do
   else
      for i = 1,#brkcmds do
	 str = string.gsub(str, "\\"..brkcmds[i].."%s?(%b{})",
		function(body)
		   body = string.sub(body, 2, -2)
		   return string.format("}\\"..brkcmds[i].."{%s}\\arb{", body)
	 end)
      end
   end
   -- process \item[], then \item[]
	str = string.gsub(str, "\\(item.?)(%b[])",
	  function(tag, body)
	  body = string.sub(body, 2, -2)
	  return string.format("}\\item[\\arb{%s}] \\arb{", body)
	end)
	str = string.gsub(str, "(\\item)(%s+)", "%1{}%2")
   -- \edtext
   str = string.gsub(str, "\\(edtext.-)(%b{})(%b{})",
	function(tag, bodylem, bodyvar)
	bodylem = string.sub(bodylem, 2, -2)
	bodyvar = string.sub(bodyvar, 2, -2)
	return string.format("\\LR{\\%s{%s}{%s}}", tag, bodylem, bodyvar)
	end)
   -- \RL
   str = string.gsub(str, "\\(RL.-)(%b{})",
		function(tag, body)
		body = string.sub(body, 2, -2)
		return string.format("}\\%s{%s}\\arb{", tag, body)
		end)
   -- \LR
   str = string.gsub(str, "\\(LR.-)(%b{})",
		function(tag, body)
		body = string.sub(body, 2, -2)
		return string.format("}\\%s{%s}\\arb{", tag, body)
		end)
   -- \textcolor
   str = string.gsub(str, "\\(textcolor.?)(%b{})(%b{})",
    function(tag, bodycolor, bodytext)
    bodycolor = string.sub(bodycolor, 2, -2)
    bodytext = string.sub(bodytext, 2, -2)
    return string.format("}\\%s{%s}{\\arb{%s}}\\arb{", tag, bodycolor, bodytext)
   end)
   -- Footnote
   str = string.gsub(str, "\\(Footnote.-)(%b{})",
		function(tag, body)
		body = string.sub(body, 2, -2)
		return string.format("}\\%s{%s}\\arb{", tag, body)
		end)
   -- Marginpar
   str = string.gsub(str, "\\(Marginpar.-)(%b{})",
		function(tag, body)
		body = string.sub(body, 2, -2)
		return string.format("}\\%s{%s}\\arb{", tag, body)
		end)
   -- Abjad
   str = string.gsub(str, "\\(abjad.-)(%b{})",
	function(tag, body)
	body = string.sub(body, 2, -2)
	return string.format("}\\aemph{\\%s{%s}}\\arb{", tag, body)
	end)
   -- Arbmark
   str = string.gsub(str, "\\(arbmark.-)(%b{})",
	function(tag, body)
	body = string.sub(body, 2, -2)
	return string.format("}\\%s{%s}\\arb{", tag, body)
	end)
   return str
end

local function holdcmd(str)
	str = string.gsub(str, "\\(arb)(%b{})", function(tag, body)
	body = string.sub(body, 2, -2)
	body = string.gsub(body, "\\(.-)(%b{})", function(btag, bbody)
	bbody = string.sub(bbody, 2, -2)
	if string.find(btag, "@") then
	return holdcmd(string.format("}\\%s{%s}\\arb{", btag, bbody))	
	else
	return holdcmd(string.format("}\\%s{\\arb{%s}}\\arb{", btag, bbody))
	end
	end)
	return string.format("\\%s{%s}", tag, body)
	end)
	str = string.gsub(str, "\\arb{}", "")
return str
end

local function arbnum(str)
   str = string.gsub(str, "([0-9%,%-%/]+)", function(num)
	return string.reverse(num)
   end)
   return str
end

local function indnum(str)
   str = string.gsub(str, "([0-9%,%-%/]+)", function(num)
	return string.reverse(num)
   end)
   for i = 1,#numbers do
      str = string.gsub(str, numbers[i].a, numbers[i].b)
   end
   return str
end

local function processdiscretionary(str)
   str = string.gsub(str, "\\%-", "\\-{}")
   return str
end

local function processarbnull(str, scheme)
   if scheme == "buckwalter" then
      str = string.gsub(str, "(\\arbnull.?)(%b{})", function(tag, body)
			   body = string.sub(body, 2, -2)
			   return string.format("P%sP", body)
      end)
   else
      str = string.gsub(str, "(\\arbnull.?)(%b{})", function(tag, body)
			   body = string.sub(body, 2, -2)
			   return string.format("o%so", body)
      end)
   end
   return str
end

local function takeoutabjad(str)
   str = string.gsub(str, "(\\abjad.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   return str
end

local function takeoutcapetc(str)
   str = string.gsub(str, "(\\arb.?%[trans%])(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			body = string.gsub(body, "(\\uc%s?)(%b{})", "\\Uc%2")
			return string.format("%s{%s}", tag, body)
   end)
   str = string.gsub(str, "(\\uc.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   str = string.gsub(str, "\\linebreak", "")
   str = string.gsub(str, "\\%-", "")
   return str
end

local function voc(str, rules)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamza do
      inside = string.gsub(inside, hamza[i].a, hamza[i].b)
   end
   if rules == "idgham" then
      for i = 1,#tanwin do
	 inside  = string.gsub(inside, tanwin[i].a, tanwin[i].b)
      end
   else
      for i = 1,#tanwineasy do
	 inside  = string.gsub(inside, tanwineasy[i].a, tanwineasy[i].b)
      end
   end
   for i = 1,#trigraphs do
      inside = string.gsub(inside, trigraphs[i].a, trigraphs[i].b)
   end
   if rules == "idgham" then
      for i = 1,#idgham do
	 inside = string.gsub(inside, idgham[i].a, idgham[i].b)
      end
   end
   for i = 1,#digraphs do
      inside = string.gsub(inside, digraphs[i].a, digraphs[i].b)
   end
   for i = 1,#single do
      inside = string.gsub(inside, single[i].a, single[i].b)
   end
   for i = 1,#longv do
      inside = string.gsub(inside, longv[i].a, longv[i].b)
   end
   for i = 1,#shortv do
      inside = string.gsub(inside, shortv[i].a, shortv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function voceasy(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzaeasy do
      inside = string.gsub(inside, hamzaeasy[i].a, hamzaeasy[i].b)
   end
   for i = 1,#tanwineasy do
      inside  = string.gsub(inside, tanwineasy[i].a, tanwineasy[i].b)
   end
   for i = 1,#trigraphseasy do
      inside = string.gsub(inside, trigraphseasy[i].a, trigraphseasy[i].b)
   end
   for i = 1,#digraphs do
      inside = string.gsub(inside, digraphs[i].a, digraphs[i].b)
   end
   for i = 1,#single do
      inside = string.gsub(inside, single[i].a, single[i].b)
   end
   for i = 1,#longv do
      inside = string.gsub(inside, longv[i].a, longv[i].b)
   end
   for i = 1,#shortv do
      inside = string.gsub(inside, shortv[i].a, shortv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function fullvoc(str, rules)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzafv do
      inside = string.gsub(inside, hamzafv[i].a, hamzafv[i].b)
   end
   if rules == "idgham" then
      for i = 1,#tanwinfv do
	 inside  = string.gsub(inside, tanwinfv[i].a, tanwinfv[i].b)
      end
   else
      for i = 1,#tanwinfveasy do
	 inside  = string.gsub(inside, tanwinfveasy[i].a, tanwinfveasy[i].b)
      end
   end
   for i = 1,#trigraphsfv do
      inside = string.gsub(inside, trigraphsfv[i].a, trigraphsfv[i].b)
   end
   if rules == "idgham" then
      for i = 1,#idgham do
	 inside = string.gsub(inside, idgham[i].a, idgham[i].b)
      end
   end
   if rules == "idgham" then
      for i = 1,#digraphsfvidgham do
	 inside = string.gsub(inside, digraphsfvidgham[i].a, digraphsfvidgham[i].b)
      end
   else
      for i = 1,#digraphsfv do
	 inside = string.gsub(inside, digraphsfv[i].a, digraphsfv[i].b)
      end
   end
   for i = 1,#singlefv do
      inside = string.gsub(inside, singlefv[i].a, singlefv[i].b)
   end
   for i = 1,#longv do
      inside = string.gsub(inside, longv[i].a, longv[i].b)
   end
   for i = 1,#shortv do
      inside = string.gsub(inside, shortv[i].a, shortv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function fullvoceasy(str, rules)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzafveasy do
      inside = string.gsub(inside, hamzafveasy[i].a, hamzafveasy[i].b)
   end
   for i = 1,#tanwinfveasy do
      inside  = string.gsub(inside, tanwinfveasy[i].a, tanwinfveasy[i].b)
   end
   for i = 1,#trigraphsfveasy do
      inside = string.gsub(inside, trigraphsfveasy[i].a, trigraphsfveasy[i].b)
   end
   if rules == "nosukun" then
      for i = 1,#digraphsfveasy do
	 inside = string.gsub(inside, digraphsfveasy[i].a, digraphsfveasy[i].b)
      end
   else
      for i = 1,#digraphsfv do
	 inside = string.gsub(inside, digraphsfv[i].a, digraphsfv[i].b)
      end
   end
   if rules == "nosukun" then
      for i = 1,#singlefveasy do
	 inside = string.gsub(inside, singlefveasy[i].a, singlefveasy[i].b)
      end
   else
      for i = 1,#singlefv do
	 inside = string.gsub(inside, singlefv[i].a, singlefv[i].b)
      end
   end
   for i = 1,#longv do
      inside = string.gsub(inside, longv[i].a, longv[i].b)
   end
   for i = 1,#shortv do
      inside = string.gsub(inside, shortv[i].a, shortv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function novoc(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamza do
      inside = string.gsub(inside, hamza[i].a, hamza[i].b)
   end
   for i = 1,#tanwinnv do
      inside  = string.gsub(inside, tanwinnv[i].a, tanwinnv[i].b)
   end
   for i = 1,#trigraphsnv do
      inside = string.gsub(inside, trigraphsnv[i].a, trigraphsnv[i].b)
   end
   for i = 1,#digraphs do
      inside = string.gsub(inside, digraphs[i].a, digraphs[i].b)
   end
   for i = 1,#single do
      inside = string.gsub(inside, single[i].a, single[i].b)
   end
   for i = 1,#longvnv do
      inside = string.gsub(inside, longvnv[i].a, longvnv[i].b)
   end
   for i = 1,#shortvnv do
      inside = string.gsub(inside, shortvnv[i].a, shortvnv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function novoceasy(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzaeasy do
      inside = string.gsub(inside, hamzaeasy[i].a, hamzaeasy[i].b)
   end
   for i = 1,#tanwinnv do
      inside  = string.gsub(inside, tanwinnv[i].a, tanwinnv[i].b)
   end
   for i = 1,#trigraphsnv do
      inside = string.gsub(inside, trigraphsnv[i].a, trigraphsnv[i].b)
   end
   for i = 1,#digraphs do
      inside = string.gsub(inside, digraphs[i].a, digraphs[i].b)
   end
   for i = 1,#single do
      inside = string.gsub(inside, single[i].a, single[i].b)
   end
   for i = 1,#longvnv do
      inside = string.gsub(inside, longvnv[i].a, longvnv[i].b)
   end
   for i = 1,#shortvnv do
      inside = string.gsub(inside, shortvnv[i].a, shortvnv[i].b)
   end
   for i = 1,#punctuation do
      inside = string.gsub(inside, punctuation[i].a, punctuation[i].b)
   end
   for i = 1,#null do
      inside = string.gsub(inside, null[i].a, null[i].b)
   end
   inside = indnum(inside)
   return string.format("\\txarb{%s}", inside)
   end)
return str
end

local function transdmg(str, rules)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzatrdmg do
      inside = string.gsub(inside, hamzatrdmg[i].a, hamzatrdmg[i].b)
   end
   for i = 1,#tanwintrdmg do
      inside  = string.gsub(inside, tanwintrdmg[i].a, tanwintrdmg[i].b)
   end
   for i = 1,#trigraphstrdmg do
      inside = string.gsub(inside, trigraphstrdmg[i].a, trigraphstrdmg[i].b)
   end
   if rules == "idgham" then
      for i = 1,#idghamtrdmg do
	 inside = string.gsub(inside, idghamtrdmg[i].a, idghamtrdmg[i].b)
      end
   end
   for i = 1,#digraphstrdmg do
      inside = string.gsub(inside, digraphstrdmg[i].a, digraphstrdmg[i].b)
   end
   for i = 1,#singletrdmg do
      inside = string.gsub(inside, singletrdmg[i].a, singletrdmg[i].b)
   end
   for i = 1,#longvtrdmg do
      inside = string.gsub(inside, longvtrdmg[i].a, longvtrdmg[i].b)
   end
   for i = 1,#shortvtrdmg do
      inside = string.gsub(inside, shortvtrdmg[i].a, shortvtrdmg[i].b)
   end
   for i = 1,#punctuationtr do
      inside = string.gsub(inside, punctuationtr[i].a, punctuationtr[i].b)
   end
   for i = 1,#nulltr do
      inside = string.gsub(inside, nulltr[i].a, nulltr[i].b)
   end
   return string.format("\\txtrans{%s}", inside)
   end)
return str
end

local function transloc(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzatrloc do
      inside = string.gsub(inside, hamzatrloc[i].a, hamzatrloc[i].b)
   end
   for i = 1,#tanwintrloc do
      inside  = string.gsub(inside, tanwintrloc[i].a, tanwintrloc[i].b)
   end
   for i = 1,#trigraphstrloc do
      inside = string.gsub(inside, trigraphstrloc[i].a, trigraphstrloc[i].b)
   end
   for i = 1,#digraphstrloc do
      inside = string.gsub(inside, digraphstrloc[i].a, digraphstrloc[i].b)
   end
   for i = 1,#singletrloc do
      inside = string.gsub(inside, singletrloc[i].a, singletrloc[i].b)
   end
   for i = 1,#longvtrloc do
      inside = string.gsub(inside, longvtrloc[i].a, longvtrloc[i].b)
   end
   for i = 1,#shortvtrloc do
      inside = string.gsub(inside, shortvtrloc[i].a, shortvtrloc[i].b)
   end
   for i = 1,#finaltrloc do
      inside = string.gsub(inside, finaltrloc[i].a, finaltrloc[i].b)
   end
   for i = 1,#punctuationtr do
      inside = string.gsub(inside, punctuationtr[i].a, punctuationtr[i].b)
   end
   for i = 1,#nulltr do
      inside = string.gsub(inside, nulltr[i].a, nulltr[i].b)
   end
   return string.format("\\txtrans{%s}", inside)
   end)
return str
end

local function transarabica(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzatrarabica do
      inside = string.gsub(inside, hamzatrarabica[i].a, hamzatrarabica[i].b)
   end
   for i = 1,#tanwintrloc do
      inside  = string.gsub(inside, tanwintrloc[i].a, tanwintrloc[i].b)
   end
   for i = 1,#trigraphstrarabica do
      inside = string.gsub(inside, trigraphstrarabica[i].a, trigraphstrarabica[i].b)
   end
   for i = 1,#digraphstrarabica do
      inside = string.gsub(inside, digraphstrarabica[i].a, digraphstrarabica[i].b)
   end
   for i = 1,#singletrarabica do
      inside = string.gsub(inside, singletrarabica[i].a, singletrarabica[i].b)
   end
   for i = 1,#longvtrarabica do
      inside = string.gsub(inside, longvtrarabica[i].a, longvtrarabica[i].b)
   end
   for i = 1,#shortvtrloc do
      inside = string.gsub(inside, shortvtrloc[i].a, shortvtrloc[i].b)
   end
   for i = 1,#punctuationtr do
      inside = string.gsub(inside, punctuationtr[i].a, punctuationtr[i].b)
   end
   for i = 1,#nulltr do
      inside = string.gsub(inside, nulltr[i].a, nulltr[i].b)
   end
   return string.format("\\txtrans{%s}", inside)
   end)
return str
end

local function processbuckw(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#buckwalter do
      inside = string.gsub(inside, buckwalter[i].a, buckwalter[i].b)
   end
   return string.format("\\arb{%s}", inside)
   end)
return str
end

function processvoc(str, rules, scheme)
   str = "\\arb{".. str.."}"
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
      else end
   if rules == "easy" or rules == "easynosukun" then
      str = voceasy(str)
   elseif rules == "dflt" or rules == "idgham" then
      str = voc(str, rules)
      else end
   str = unprotectarb(str)
return str
end

function processfullvoc(str, rules, scheme)
   str = "\\arb{".. str.."}"
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
      else end
   if rules == "easy" then
      str = fullvoceasy(str, "sukun")
   elseif rules == "easynosukun" then
      str = fullvoceasy(str, "nosukun")
   elseif rules == "dflt" or rules == "idgham" then
      str = fullvoc(str, rules)
      else end
   str = unprotectarb(str)
return str
end

function processnovoc(str, rules, scheme)
   str = "\\arb{".. str.."}"
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
      else end
   if rules == "easy" or rules == "easynosukun" then
      str = novoceasy(str)
   elseif rules == "dflt" or rules == "idgham" then
      str = novoc(str)
      else end
   str = unprotectarb(str)
return str
end

function processtrans(str, mode, rules, scheme)
   str = "\\arb{".. str.."}"
   str = processdiscretionary(str)
   str = processarbnull(str, scheme)
   str = takeoutabjad(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
   end
   if mode == "dmg" then
      str = transdmg(str, rules)
   elseif mode == "loc" then
      str = transloc(str)
   elseif mode == "arabica" then
      str = transarabica(str)
   end
   str = unprotectarb(str)
return str
end

function newarbmark(abbr, rtlmk, ltrmk)
   table.insert(arbmarks, {a = abbr, b = rtlmk, c = ltrmk})
   return true
end

local function isintable(table, element)
   for i = 1,#table do
      if table[i].a == element then
	 return true
      end
   end
   return false
end

function processarbmarks(str)
   if not isintable(arbmarks, str) then
      str = "\\LR{<??>}"
   else
      if tex.textdir == "TLT" then
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].c)
	 end
      else
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].b)
	 end
      end
   end
   return str
end

function uc(str)
   str = string.gsub(str, "(\\txtrans.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   -- Allah and ibn
   str = string.gsub(str, "(al%-lāh)([uai]?)", "{Allāh%2}")
   str = string.gsub(str, "([%'%-]?)(l%-lāh)([uai]?)", "%1{Llāh%3}")
   str = string.gsub(str, "(%s[%(%<%[]?)([i%']?b[n%.])", "%1{%2}")
   for i = 1,#lcuc do
      str = string.gsub(str, "^([%S]-%-[`']?)"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)([%S]-%-[`']?)"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^([%S]-%-ʿ)"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)([%S]-%-ʿ)"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^([%S]-%-ʾ)"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)([%S]-%-ʾ)"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^([`'])"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)([`'])"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^(ʾ)"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)(ʾ)"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^(ʿ)"..lcuc[i].a, "{%1"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)(ʿ)"..lcuc[i].a, "%1{%2"..lcuc[i].b.."}")
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "^"..lcuc[i].a, lcuc[i].b)
   end
   for i = 1,#lcuc do
      str = string.gsub(str, "(%s[%(%<%[]?)"..lcuc[i].a, "%1"..lcuc[i].b)
   end
   return "\\txtrans{"..str.."}"
end

-- this function is adapted from an 'obsolete project' of Khaled
-- Hosny's that dates back to 2010. Thanks to him.
-- See https://github.com/khaledhosny/lualatex-arabic
function abjadify(n)
    local abjadnum = ""
    if n >= 1000 then
        for i=1,math.floor(n/1000) do
            abjadnum = abjadnum .. abjad[4][1]
        end
        n = math.fmod(n,1000)
    end
    if n >= 100 then
        abjadnum = abjadnum .. abjad[3][math.floor(n/100)]
        n = math.fmod(n, 100)
    end
    if n >= 10 then
        abjadnum = abjadnum .. abjad[2][math.floor(n/10)]
        n = math.fmod(n, 10)
    end
    if n >= 1 then
        abjadnum = abjadnum .. abjad[1][math.floor(n/1)]
    end
    return "\\arb[novoc]{"..abjadnum.."}"
end

function abraces(str)
   if tex.textdir == "TRT" then
      str = "\\}"..str.."\\{"
   elseif tex.textdir == "TLT" then
      str = "\\{"..str.."\\}"
   end
   return str
end

function aemph(str)
   if tex.textdir == "TRT" then
      str = "$\\overline{\\text{"..str.."}}$"
   elseif tex.textdir == "TLT" then
      str = "$\\underline{\\text{"..str.."}}$"
   end
   return str
end
