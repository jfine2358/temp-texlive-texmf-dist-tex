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

require("arabluatex_voc")
require("arabluatex_fullvoc")
require("arabluatex_novoc")
require("arabluatex_trans")

local function protectarb(str)
   str = string.gsub(str, "(\\arb.?)(%[.-%])(%b{})", "\\@arb%2%3")
   str = string.gsub(str, "\\par", "\\p@r{}")
   str = string.gsub(str, "\\@@par", "\\p@r{}")
return str
end

local function unprotectarb(str)
   str = string.gsub(str, "(\\@arb)(%[.-%])(%b{})", "\\arb%2%3")
   str = string.gsub(str, "\\p@r{}", "\\par")
return str
end

local function breakcmd(str)
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

local function takeoutabjad(str)
   str = string.gsub(str, "(\\abjad.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   return str
end

local function takeoutcap(str)
   str = string.gsub(str, "(\\cap.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   return str
end

local function voc(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamza do
      inside = string.gsub(inside, hamza[i].a, hamza[i].b)
   end
   for i = 1,#tanwin do
      inside  = string.gsub(inside, tanwin[i].a, tanwin[i].b)
   end
   for i = 1,#trigraphs do
      inside = string.gsub(inside, trigraphs[i].a, trigraphs[i].b)
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

local function fullvoc(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzafv do
      inside = string.gsub(inside, hamzafv[i].a, hamzafv[i].b)
   end
   for i = 1,#tanwinfv do
      inside  = string.gsub(inside, tanwinfv[i].a, tanwinfv[i].b)
   end
   for i = 1,#trigraphsfv do
      inside = string.gsub(inside, trigraphsfv[i].a, trigraphsfv[i].b)
   end
   for i = 1,#digraphsfv do
      inside = string.gsub(inside, digraphsfv[i].a, digraphsfv[i].b)
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

local function fullvoceasy(str)
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
   for i = 1,#digraphsfveasy do
      inside = string.gsub(inside, digraphsfveasy[i].a, digraphsfveasy[i].b)
   end
   for i = 1,#singlefveasy do
      inside = string.gsub(inside, singlefveasy[i].a, singlefveasy[i].b)
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

local function transdmg(str)
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

local function transdmgeasy(str)
   str = string.gsub(str, "\\arb(%b{})", function(inside)
   inside = string.sub(inside, 2, -2)
   for i = 1,#hamzatrdmg do
      inside = string.gsub(inside, hamzatrdmg[i].a, hamzatrdmg[i].b)
   end
   for i = 1,#tanwintrdmg do
      inside  = string.gsub(inside, tanwintrdmg[i].a, tanwintrdmg[i].b)
   end
   for i = 1,#trigraphstrdmgeasy do
  inside = string.gsub(inside, trigraphstrdmgeasy[i].a, trigraphstrdmgeasy[i].b)
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

function processvoc(str, rules)
   str = "\\arb{".. str.."}"
   str = takeoutcap(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if rules == "easy" then
      str = voceasy(str)
   elseif rules == "dflt" then
      str = voc(str)
      else end
   str = unprotectarb(str)
return str
end

function processfullvoc(str, rules)
   str = "\\arb{".. str.."}"
   str = takeoutcap(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if rules == "easy" then
      str = fullvoceasy(str)
   elseif rules == "dflt" then
      str = fullvoc(str)
      else end
   str = unprotectarb(str)
return str
end

function processnovoc(str)
   str = "\\arb{".. str.."}"
   str = takeoutcap(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   str = novoc(str)
   str = unprotectarb(str)
return str
end

function processtrans(str, mode, rules)
   str = "\\arb{".. str.."}"
   str = takeoutabjad(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   if mode == "dmg" then
      if rules == "easy" then
	 str = transdmgeasy(str)
      elseif rules == "dflt" then
	 str = transdmg(str)
	 else end
   elseif mode == "loc" then
      str = transloc(str)
      else end
   str = unprotectarb(str)
return str
end

function cap(str)
   str = string.gsub(str, "(\\txtrans.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   if string.find(str, "%-['`ʾʿ]") then
      str = string.gsub(str, "(%-['`])", "%1\\MakeUppercase ")
      str = string.gsub(str, "(%-ʿ)", "%1\\MakeUppercase ")
      str = string.gsub(str, "(%-ʾ)", "%1\\MakeUppercase ")
   elseif string.find(str, "%-[^'`ʾʿ]") then
      str = string.gsub(str, "(%-)", "%1\\MakeUppercase ")
   elseif string.find(str, "^['`ʾʿ]") then
      str = string.gsub(str, "^(['`])", "%1\\MakeUppercase ")
      str = string.gsub(str, "^(ʿ)", "%1\\MakeUppercase ")
      str = string.gsub(str, "^(ʾ)", "%1\\MakeUppercase ")
   else
      str = "\\MakeUppercase "..str
   end
return str
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
