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

arabluatex = {}

require("arabluatex_voc")
require("arabluatex_fullvoc")
require("arabluatex_novoc")
require("arabluatex_trans")

-- lpeg equivalent for string.gsub()
local function gsub(s, patt, repl)
  patt = lpeg.P(patt)
  patt = lpeg.Cs((patt / repl + 1)^0)
  return lpeg.match(patt, s)
end

-- makeatletter, makeatother
local atletter = "\\makeatletter{}"
local atother = "\\makeatother{}"

-- some basic patterns:
local ascii = lpeg.R("az", "AZ", "@@")
local dblbkslash = lpeg.Cs("\\")
local bsqbrackets = lpeg.Cs{ "[" * ((1 - lpeg.S"[]") + lpeg.V(1))^0 * "]" }
local bcbraces = lpeg.Cs{ "{" * ((1 - lpeg.S"{}") + lpeg.V(1))^0 * "}" }
local spce = lpeg.Cs(" ")
local spcenc = lpeg.P(" ")
local cmdstar = lpeg.Cs(spce * lpeg.P("*"))
local bsqbracketsii = lpeg.Cs(bsqbrackets^-2)
local bcbracesii = lpeg.Cs(bcbraces^-2)
local cmd = lpeg.Cs(dblbkslash * ascii^1 * cmdstar^-1)
local rawcmd = lpeg.Cs(dblbkslash * ascii^1)
local aftercmd = lpeg.Cs(lpeg.S("*[{,.?;:'`\"") + dblbkslash)
local cmdargs = lpeg.Cs(spce^-1 * bsqbracketsii * bcbracesii * bsqbrackets^-1)
local arbargs = lpeg.Cs(spce^-1 * bsqbrackets^-1 * bcbraces)
local baytargs = lpeg.Cs(spce * bcbraces * bsqbrackets^-1 * bcbraces)
local arind = lpeg.Cs(dblbkslash * lpeg.P("arind") * spce^-1 * bsqbracketsii)

local function protectarb(str)
   str = string.gsub(str, "(\\arb%s?)(%[.-%])(%b{})", "\\al@brk{\\arb%2%3}")
   str = string.gsub(str, "(\\LR%s?)(%b{})", "\\@LR%2")
   str = string.gsub(str, "(\\RL%s?)(%b{})", "\\@RL%2")
   return str
end

local function unprotectarb(str)
   str = string.gsub(str, "(\\@arb)(%[.-%])(%b{})", "\\arb%2%3")
   str = string.gsub(str, "(\\@LR)(%b{})", "\\LR%2")
   str = string.gsub(str, "(\\@RL)(%b{})", "\\RL%2")
   str = gsub(str, lpeg.Cs("\\al@brk") * bcbraces, function(tag, body)
		 body = string.sub(body, 2, -2)
		 return string.format("%s", body)
   end)
   return str
end

-- the following is to be taken out of \arb{}
local outofarb = {
   "LRfootnote",
   "RLfootnote",
   "edtext",
   "pstart",
   "pend"
}
-- commands the arguments of which must not be processed by arabluatex
-- inside \arb{}.  'albrkcmds' is what is set by default.  'brkcmds'
-- collects the commands set in the preamble with \MkArbBreak{}
local albrkcmds = {
   "begin",
   "end",
   "par",
   "LRmarginpar",
   "arbmark",
   "abjad",
   "ayah"
}
local brkcmds = {}

function arabluatex.mkarbbreak(str, opt)
   str = str ..","
   str = string.gsub(str, "%s+", "")
   local fieldstart = 1
   if opt == "dflt" then
      repeat
	 local nexti = string.find(str, "%,", fieldstart)
	 table.insert(brkcmds, string.sub(str, fieldstart, nexti-1))
	 fieldstart = nexti +1
      until fieldstart > string.len(str)
      return brkcmds
   elseif opt == "out" then
      repeat
	 local nexti = string.find(str, "%,", fieldstart)
	 table.insert(outofarb, string.sub(str, fieldstart, nexti-1))
	 fieldstart = nexti +1
      until fieldstart > string.len(str)
      return outofarb
   end
end

local function breakcmd(str)
   -- process \item[], then \item[]
	str = string.gsub(str, "\\(item.?)(%b[])",
	  function(tag, body)
	  body = string.sub(body, 2, -2)
	  return string.format("\\al@brk{\\item[\\arb{%s}] }", body)
	end)
	str = string.gsub(str, "(\\item)(%s+)", "%1{}%2")
   -- \textcolor
	str = string.gsub(str, "\\(textcolor%s?)(%b{})(%b{})",
			  function(tag, bodycolor, bodytext)
			     bodycolor = string.sub(bodycolor, 2, -2)
			     bodytext = string.sub(bodytext, 2, -2)
			     return string.format("\\al@brk{\\%s{%s}{\\arb{%s}}}", tag, bodycolor, bodytext)
	end)
   -- commands set by default in outofarb
   for i = 1,#outofarb do
      str = gsub(str, dblbkslash * lpeg.Cs(outofarb[i]) * cmdargs, "}%1%2%3\\arb{")
   end
   -- commands set by default in albrkcmds
   for i = 1,#albrkcmds do
      str = gsub(str, dblbkslash * lpeg.Cs(albrkcmds[i]) * cmdargs, "\\al@brk{%1%2%3}")
   end
   -- user commands (brkcmds)
   if next(brkcmds) == nil then
      -- nothing to do
   else
      for i = 1,#brkcmds do
	 str = gsub(str, dblbkslash * lpeg.Cs(brkcmds[i]) * cmdargs, "\\al@brk{%1%2%3}")
      end
   end
   return str
end

local function holdcmd(str)
   str = gsub(str, lpeg.Cs("\\arb") * bcbraces, function(tag, body)
	body = string.sub(body, 2, -2)
	body = gsub(body, cmd * spcenc^-1 * bsqbracketsii * spcenc^-1 * bcbraces, function(btag, bopt, bbody)
	bbody = string.sub(bbody, 2, -2)
	if string.find(btag, "@") then
	   return holdcmd(string.format("}%s%s{%s}\\arb{", btag, bopt, bbody))
	else
	   return holdcmd(string.format("}%s%s{\\arb{%s}}\\arb{", btag, bopt, bbody))
	end
	end)
	return string.format("%s{%s}", tag, body)
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
			   return string.format("O%sO", body)
      end)
   end
   return str
end

local function takeout_abjad_ayah(str)
   str = string.gsub(str, "(\\abjad.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   str = string.gsub(str, "(\\ayah.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			if tonumber(body) ~= nil and str.len(body) < 4 then
			   return string.format("(%s)", body)
			else
			   return "<??>"
			end
   end)
   return str
end

local function takeoutcapetc(str)
   str = string.gsub(str, "(\\arb.?%[trans%])(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			body = string.gsub(body, "(\\uc%s?)(%b{})", "\\Uc%2")
			return string.format("%s{%s}", tag, body)
   end)
   str = string.gsub(str, "(\\arbup.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   str = string.gsub(str, "(\\uc%s?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   str = string.gsub(str, "\\uc%s", "")
   str = string.gsub(str, "\\linebreak", "")
   str = string.gsub(str, "\\%-", "")
   return str
end

local function checkwrnested(str)
   for i = 1,#outofarb do
      str = gsub(str, dblbkslash * lpeg.Cs(lpeg.P("LR") + lpeg.P("RL")) * cmdargs,
		 function(prefix, tag, body)
		    body = string.sub(body, 2, -2)
		    if string.find(body, "\\"..outofarb[i]) then
		       return atletter.."\\al@wrong@nesting{}"..atother
		    else
		       -- nothing to do, so proceed.
		    end
      end)
   end
   return str
end

local function takeoutarb(str)
   str = checkwrnested(str)
   for i = 1,#outofarb do
      str = gsub(str, dblbkslash * lpeg.Cs(outofarb[i]) * cmdargs,
   		 function(prefix, tag, body)
   		    body = gsub(body, lpeg.P("\\arb"), "\\@rb")
   		    return string.format("%s%s%s", prefix, tag, body)
      end)
   end
   str = string.gsub(str, "(\\arb%s?)(%b{})", function(tag, body)
   			body = string.sub(body, 2, -2)
			return string.format("\\al@brk{%s{%s}}", tag, body)
   end)
   str = string.gsub(str, "\\@rb", "\\arb")
   str = "\\arb{"..str.."}"
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("\\arabicfont{}%s", inside)
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
   return string.format("%s", inside)
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
   return string.format("%s", inside)
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
   return string.format("%s", inside)
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

local function processarind(str, mode)
   str = gsub(str, arind * bcbraces, function(tag, arg)
		 arg = string.sub(arg, 2, -2)
		 if mode == "trans" then
		    return string.format("%s{\\txtrans{%s}}", tag, arg)
		 else
		    arg = novoc(arg)
		    arg = string.gsub(arg, "\\arabicfont%s?{}", "")
		    return string.format("%s{\\txarb{%s}}", tag, arg)
		 end
   end)
   return str
end

-- The following functions produce a copy of the original .tex source
-- file in which all arabtex strings are replaced with Unicode
-- equivalents
local utffilesuffix = "_out"
local export_utf = "no"

function arabluatex.utffilesuffix(str)
   utffilesuffix = str
   return true
end

function arabluatex.doexport(str)
   export_utf = str
   return true
end

function arabluatex.openstream()
   local f = io.open(tex.jobname..utffilesuffix.."_tmp.tex", "a+")
   local preamble = io.open(tex.jobname..".tex", "r")
   for line in preamble:lines() do
      f:write(line, "\n")
      if string.find(line, "^%s-\\begin%s?{document}") then
	 break
      end
   end
   preamble:close()
   f:close()
   return true
end

local function processarbtoutf(str)
   if export_utf ~= "arabverse" then
      str = "\\begin{arabexport}"..str
   else end
   --[[ -- of no use, see above takeout_abjad_ayah()
   str = string.gsub(str, "(\\txtrans%s?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			body = string.gsub(body, "(\\abjad%s?)(%b{})", function(btag, bbody)
					      bbody = string.sub(bbody, 2, -2)
					      return string.format("%s", bbody)
			end)
			body = string.gsub(body, "(\\ayah%s?)(%b{})", function(btag, bbody)
					      bbody = string.sub(bbody, 2, -2)
					      return string.format("(%s)", bbody)
			end)
			return string.format("%s{%s}", tag, body)
   end)
   --]]
   str = string.gsub(str, "(\\txarb%s?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			body = string.gsub(body, "(\\abjad%s?)(%b{})", function(btag, bbody)
					      bbody = string.sub(bbody, 2, -2)
					      if tonumber(bbody) ~= nil then
						 bbody = arabluatex.abjadify(bbody)
						 return string.format("\\aoline*{\\arb[novoc]{%s}}", bbody)
					      else
						 return string.format("%s{%s}", btag, bbody)
					      end
			end)
			body = string.gsub(body, "(\\arbmark%s?)(%b{})", function(btag, bbody)
					      bbody = string.sub(bbody, 2, -2)
					      return string.format("%s[rl]{%s}", btag, bbody)
			end)
			body = string.gsub(body, "(\\ayah%s?)(%b{})", function(btag, bbody)
					      bbody = string.sub(bbody, 2, -2)
					      return string.format("\\arb[novoc]{%s^^^^06dd}", bbody)
			end)
			return string.format("%s{%s}", tag, body)
   end)
   str = string.gsub(str, "(\\bayt)%s?(%b{})(%b[])(%b{})", function(tag, argi, argii, argiii)
   			argi = string.sub(argi, 2, -2)
   			argii = string.sub(argii, 2, -2)
   			argiii = string.sub(argiii, 2, -2)
   			return string.format("%s*{\\arb{%s}}[\\arb{%s}]{\\arb{%s}}", tag, argi, argii, argiii)
   end)
   str = string.gsub(str, "(\\bayt)%s?(%b{})(%b{})", function(tag, argi, argii)
   			argi = string.sub(argi, 2, -2)
   			argii = string.sub(argii, 2, -2)
			return string.format("%s*{\\arb{%s}}{\\arb{%s}}", tag, argi, argii)
   end)
   str = string.gsub(str, "(\\prname)%s?(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			if string.find(body, "\\uc%s?%b{}") then
			   return string.format("%s*{%s}", tag, body)
			else
			   return string.format("%s{\\arb[trans]{\\uc{%s}}}", tag, body)
			end
   end)
   str = string.gsub(str, "(\\begin%s?{arab})(%b[])", "\\bgroup\\arb%2{")
   str = string.gsub(str, "(\\begin%s?{arab})", "\\bgroup\\arb{")
   str = string.gsub(str, "\\end%s?{arab}", "}\\egroup")
   -- This does not work, while the following two do. Look into this later.
   -- str = gsub(str, lpeg.Cs("\\arb") * spcenc * bsqbrackets^-1 * bcbraces, function(tag, opt, body)
   -- 		 body = string.sub(body, 2, -2)
   -- 		 return string.format("%s%s\\@al@pr@ob%s\\@al@pr@cb", tag, opt, body)
   -- end)
   str = string.gsub(str, "(\\arb%s?)(%b[])(%b{})", function(tag, opt, body)
   			body = string.sub(body, 2, -2)
   			return string.format("%s%s\\@al@pr@ob%s\\@al@pr@cb", tag, opt, body)
   end)
   str = string.gsub(str, "(\\arb)%s?(%b{})", function(tag, body)
   			body = string.sub(body, 2, -2)
   			return string.format("%s\\@al@pr@ob%s\\@al@pr@cb", tag, body)
   end)
   str = string.gsub(str, "(\\arbmark)%s?(%b[])(%b{})", function(tag, opt, body)
   			body = string.sub(body, 2, -2)
   			return string.format("%s%s\\@al@pr@ob%s\\@al@pr@cb", tag, opt, body)
   end)
   str = string.gsub(str, "(\\arbmark)%s?(%b{})", function(tag, body)
   			body = string.sub(body, 2, -2)
   			return string.format("%s\\@al@pr@ob%s\\@al@pr@cb", tag, body)
   end)
   str = string.gsub(str, "(\\[Uu]c)%s?(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s\\@al@pr@ob%s\\@al@pr@cb", tag, body)
   end)
   str = string.gsub(str, "{", "\\@al@ob")
   str = string.gsub(str, "} ", "\\@al@cb@sp")
   str = string.gsub(str, "}", "\\@al@cb")
   str = string.gsub(str, "\\@al@pr@ob", "{")
   str = string.gsub(str, "\\@al@pr@cb", "}")
   str = string.gsub(str, "(%b{})", function(body)
			body = string.sub(body, 2, -2)
			body = string.gsub(body, "(%s?)(\\@al@ob)", "%1{")
			body = string.gsub(body, "(\\@al@cb@sp)", "} ")
			body = string.gsub(body, "(\\@al@cb)(%s?)", "}%2")
			return string.format("{%s}", body)
   end)
   if export_utf ~= "arabverse" then
      str = str.."\\end{arabexport}"
   else end
   return str
end

function arabluatex.arbtoutf(str)
   str = processarbtoutf(str)
   str = "\\ArbOutFile{"..str.."}"
   str = string.gsub(str, "(\\ArbOutFile)%s?(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			body = gsub(body, lpeg.Cs("\\arb") * arbargs, "}%1%2\\ArbOutFile{")
			return string.format("%s{%s}", tag, body)
   end)
   str = string.gsub(str, "(\\ArbOutFile)%s?(%b{})", function(tag, body)
   			body = string.sub(body, 2, -2)
   			body = string.gsub(body, "(\\[Uu]c)%s?(%b{})", "}%1%2\\ArbOutFile{")
   			return string.format("%s{%s}", tag, body)
   end)
   str = string.gsub(str, "(\\ArbOutFile)%s?(%b{})", function(tag, body)
   			body = string.sub(body, 2, -2)
   			body = gsub(body, lpeg.Cs("\\arbmark") * arbargs, "}%1%2\\ArbOutFile{")
   			return string.format("%s{%s}", tag, body)
   end)
   return str
end

function arabluatex.tooutfile(str, nl)
   local f = io.open(tex.jobname..utffilesuffix.."_tmp.tex", "a+")
   if nl == "newline" then
      f:write(str, "\n\n")
   else
      f:write(str)
   end
   f:close()
   return str
end

function arabluatex.closestream()
   local f = io.open(tex.jobname..utffilesuffix.."_tmp.tex", "r")
   local o = io.open(tex.jobname..utffilesuffix..".tex", "w")
   local t = f:read("*a")
   t = string.gsub(t, "\\arabicfont{}", "")
   t = string.gsub(t, "\\par ", "\n\n")
   t = string.gsub(t, "(\\@al@ob)", "{")
   t = string.gsub(t, "(\\@al@cb@sp)", "} ")
   t = string.gsub(t, "(\\@al@cb)(%s?)", "}")
   t = string.gsub(t, "(\\bgroup%s?)(\\txarb%s?)(%b{})(\\egroup%s?)", function(tagio, tag, body, tagic)
		      body = string.sub(body, 2, -2)
		      return string.format("\\begin{txarab}%s\\end{txarab}", body)
   end)
   t = string.gsub(t, "(\\bgroup%s?)(\\txtrans%s?)(%b{})(\\egroup%s?)", function(tagio, tag, body, tagic)
		      body = string.sub(body, 2, -2)
		      return string.format("\\begin{txarabtr}%s\\end{txarabtr}", body)
   end)
   t = gsub(t, lpeg.Cs("\\begin") * spcenc^-1 * bcbraces * cmdargs,
	    "\n%1%2%3\n")
   t = string.gsub(t, "(\\\\)(%s?)", "%1\n")
   t = string.gsub(t, "(\\\\)(\n)(\\end%s?)(%b{})", "%1%3%4")
   t = string.gsub(t, "%s-\n(\\begin%s?)(%b{})", "\n%1%2")
   t = string.gsub(t, "(\\item)", "\n%1")
   t = string.gsub(t, "\n\n(\\item)", "\n%1")
   t = string.gsub(t, "(\\end%s?)(%b{})", "%1%2\n")
   t = string.gsub(t, "([^\n]%s-)(\\end)%s?(%b{})", "%1\n%2%3")
   t = string.gsub(t, "\n\n\n", "\n\n")
   t = string.gsub(t, "(\\txarb%s?%{)(\\txarb%s?)(%b{})(%})",
		   function(tagio, tagii, body, tagic)
		      body = string.sub(body, 2, -2)
		      return
			 string.format("%s%s%s", tagio, body, tagic)
   end)
   t = string.gsub(t, "(\\prname%s?%*%{)(\\txtrans%s?)(%b{})(%})",
		   function(tagio, tagii, body, tagic)
   		      body = string.sub(body, 2, -2)
   		      return string.format("%s%s%s", tagio, body, tagic)
   end)
   if string.find(t, "\\begin%s?{document}.-\\arb%s?[%[%{]")
      or
      string.find(t, "\\begin%s?{document}.-\\[Uu]c%s?%b{}")
      or
      string.find(t, "\\begin%s?{document}.-\\abjad%s?%b{}")
      or
      string.find(t, "\\begin%s?{document}.-\\ayah%s?%b{}")
   then
      -- issue a warning:
      tex.print([[\unexpanded{\PackageWarningNoLine{arabluatex}{]]
	 ..
	 [[There are still 'arabtex' strings to be converted. ]]
	 ..
	 [[Please open ]] .. tex.jobname .. utffilesuffix .. ".tex" ..
	 [[ and compile it one more time}}]])
      --
   else end
   t = gsub(t, rawcmd * spce^1 * aftercmd, "%1%3")
   t = t.."\n\\end{document}"
   io.write(t)
   o:write(t)
   f:close()
   o:close()
   os.remove(tex.jobname..utffilesuffix.."_tmp.tex")
   return true
end

-- Process standard arabluatex modes:
function arabluatex.processvoc(str, rules, scheme)
   str = takeoutarb(str)
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   str = processarind(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
      else end
   if rules == "easy" or rules == "easynosukun" then
      str = voceasy(str)
   elseif rules == "dflt" or rules == "idgham" then
      str = voc(str, rules)
      else end
   str = unprotectarb(str)
   if export_utf == "yes" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

function arabluatex.processfullvoc(str, rules, scheme)
   str = takeoutarb(str)
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   str = processarind(str)
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
   if export_utf == "yes" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

function arabluatex.processnovoc(str, rules, scheme)
   str = takeoutarb(str)
   str = processarbnull(str, scheme)
   str = takeoutcapetc(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   str = processarind(str)
   if scheme == "buckwalter" then
      str = processbuckw(str)
      else end
   if rules == "easy" or rules == "easynosukun" then
      str = novoceasy(str)
   elseif rules == "dflt" or rules == "idgham" then
      str = novoc(str)
      else end
   str = unprotectarb(str)
   if export_utf == "yes" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = "\\txarb{"..str.."}"
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

function arabluatex.processtrans(str, mode, rules, scheme)
   str = takeoutarb(str)
   str = processdiscretionary(str)
   str = processarbnull(str, scheme)
   str = takeout_abjad_ayah(str)
   str = protectarb(str)
   str = breakcmd(str)
   str = holdcmd(str)
   str = processarind(str, "trans")
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
   if export_utf == "yes" then
      tofile = "\\txtrans{"..str.."}"
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = "\\txtrans{"..str.."}"
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

function arabluatex.newarbmark(abbr, rtlmk, ltrmk)
   abbr = "@"..abbr
   rtlmk = "\\arabicfont{}"..rtlmk
   table.insert(arbmarks, {a = abbr, b = rtlmk, c = ltrmk})
   table.sort(arbmarks, function(a ,b) return(#a.a > #b.a) end)
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

function arabluatex.processarbmarks(str, dir)
   str = "@"..str
   if not isintable(arbmarks, str) then
      str = "\\LR{<??>}"..atletter.."\\al@wrong@mark{}"..atother
   else
      if dir == "lr" then
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].c)
	 end
      elseif dir == "rl" then
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].b)
	 end
      elseif tex.textdir == "TLT" then
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].c)
	 end
      else
	 for i = 1,#arbmarks do
	    str  = string.gsub(str, arbmarks[i].a, arbmarks[i].b)
	 end
      end
   end
   if export_utf == "yes" then
      tofile = str
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = str
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

function arabluatex.uc(str)
   str = string.gsub(str, "(\\txtrans.?)(%b{})", function(tag, body)
			body = string.sub(body, 2, -2)
			return string.format("%s", body)
   end)
   str = string.gsub(str, "{", "\\@al@ob")
   str = string.gsub(str, "} ", "\\@al@cb@sp ")
   str = string.gsub(str, "}", "\\@al@cb")
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
   str = string.gsub(str, "{", "")
   str = string.gsub(str, "}", "")
   str = string.gsub(str, "\\@al@ob", "{")
   str = string.gsub(str, "\\@al@cb@sp ", "} ")
   str = string.gsub(str, "\\@al@cb", "}")
   if export_utf == "yes" then
      tofile = str
      arabluatex.tooutfile(tofile)
   elseif export_utf == "arabverse" then
      tofile = str
      arabluatex.tooutfile(tofile)
   else
      return str
   end
   return ""
end

-- this function is adapted from an 'obsolete project' of Khaled
-- Hosny's that dates back to 2010. Thanks to him.
-- See https://github.com/khaledhosny/lualatex-arabic
function arabluatex.abjadify(n)
   local abjadnum = ""
   n = tonumber(n)
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

function arabluatex.abraces(str)
   if tex.textdir == "TRT" then
      str = "\\}"..str.."\\{"
   elseif tex.textdir == "TLT" then
      str = "\\{"..str.."\\}"
   end
   return str
end

function arabluatex.aemph(str, opt)
   if tex.textdir == "TRT" then
      str = "\\aoline{\\textdir TRT{}"..str.."}"
   elseif tex.textdir == "TLT" then
      if opt == "over" then
	 str = "\\aoline{"..str.."}"
      else
	 str = "\\auline{"..str.."}"
      end
   end
   return str
end

function arabluatex.ayah(str)
   if tonumber(str) ~= nil and str.len(str) < 4 then
      if tex.textdir == "TRT" then
	 str = indnum(str).."^^^^06dd"
      elseif tex.textdir == "TLT" then
	 str = "\\arb[trans]{("..str..")}"
      end
      return str
   else
      return "\\LR{<??>}"
   end
end
