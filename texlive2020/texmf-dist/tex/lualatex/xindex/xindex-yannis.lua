-----------------------------------------------------------------------
--         FILE:  xindex-yannis.lua
--  DESCRIPTION:  configuration file for xindex.lua 
-- REQUIREMENTS:  
--       AUTHOR:  Herbert Voß
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-yannis'] = {
      version = 0.20,
      comment = "main configuration to xindex.lua",
       author = "Herbert Voss",
    copyright = "Herbert Voss",
      license = "LPPL 1.3"
}

itemPageDelimiter = ","     -- Hello, 14
compressPages     = true    -- something like 12--15, instaead of 12,13,14,15. the |( ... |) syntax is still valid
fCompress	  = false    -- 3f -> page 3, 4 and 3ff -> page 3, 4, 5
minCompress       = 2       -- 14--17 or 
rangeSymbol       = "-"     -- 14-17 instead of -- 
numericPage       = true    -- for non numerical pagenumbers, like "VI-17"
sublabels         = {"", "-\\,", "--\\,", "---\\,"} -- for the (sub(sub(sub-items  first one is for item
pageNoPrefixDel   = ""     -- a delimiter for page numbers like "VI-17"  -- not used !!!
indexOpening      = ""     -- commands after \begin{theindex}
idxnewletter      = "\\textbf"  -- Only valid if -n is not set


--[[
    Each character's position in this array-like table determines its 'priority'.
    Several characters in the same slot have the same 'priority'.
]]
alphabet_lower = { --   for sorting
    { 'α', 'ά', 'ὰ', 'ᾶ', 'ἀ', 'ἄ', 'ἂ', 'ἆ', 'ἁ', 'ἅ', 'ἃ', 'ἇ', 'ᾳ', 'ᾴ', 'ᾲ', 'ᾷ', 'ᾀ', 'ᾄ', 'ᾂ', 'ᾆ', 'ᾁ', 'ᾅ', 'ᾃ', 'ᾇ' },
    { 'β', 'ϐ' },
    { 'γ' },
    { 'δ' },
    { 'ε', 'έ', 'ὲ', 'ἐ', 'ἔ', 'ἒ', 'ἑ', 'ἕ', 'ἓ' },
    { 'ζ' },
    { 'η', 'ή', 'ὴ', 'ῆ', 'ἠ', 'ἤ', 'ἢ', 'ἦ', 'ἡ', 'ἥ', 'ἣ', 'ἧ', 'ῃ', 'ῄ', 'ῂ', 'ῇ', 'ᾐ', 'ᾔ', 'ᾒ', 'ᾖ', 'ᾑ', 'ᾕ', 'ᾓ', 'ᾗ' },
    { 'θ' },
    { 'ι', 'ί', 'ὶ', 'ῖ', 'ἰ', 'ἴ', 'ἲ', 'ἶ', 'ἱ', 'ἵ', 'ἳ', 'ἷ', 'ϊ', 'ΐ', 'ῒ', 'ῗ' },
    { 'κ' },
    { 'λ' },
    { 'μ' },
    { 'ν' },
    { 'ξ' },
    { 'ο', 'ό', 'ὸ', 'ὀ', 'ὄ', 'ὂ', 'ὁ', 'ὅ', 'ὃ' },
    { 'π' },
    { 'ρ' },
    { 'σ', 'ς' },
    { 'τ' },
    { 'υ', 'ύ', 'ὺ', 'ῦ', 'ὐ', 'ὔ', 'ὒ', 'ὖ', 'ὑ', 'ὕ', 'ὓ', 'ὗ', 'ϋ', 'ΰ', 'ῢ', 'ῧ' },
    { 'φ' },
    { 'χ' },
    { 'ψ' },
    { 'ω', 'ώ', 'ὼ', 'ῶ', 'ὠ', 'ὤ', 'ὢ', 'ὦ', 'ὡ', 'ὥ', 'ὣ', 'ὧ', 'ῳ', 'ῴ', 'ῲ', 'ῷ', 'ᾠ', 'ᾤ', 'ᾢ', 'ᾦ', 'ᾡ', 'ᾥ', 'ᾣ', 'ᾧ' },
    { 'a', 'á', 'à', 'ä', 'å', 'æ', },
    { 'b' },
    { 'c', 'ç' },
    { 'd' },
    { 'e', 'é', 'è', 'ë' },
    { 'f' },
    { 'g' },
    { 'h' },
    { 'i', 'í', 'ì', 'ï' },
    { 'j' },
    { 'k' },
    { 'l' },
    { 'm' },
    { 'n', 'ñ' },
    { 'o', 'ó', 'ò', 'ö', 'ø', 'œ'},
    { 'p' },
    { 'q' },
    { 'r' },
    { 's', 'š', 'ß' },
    { 't' },
    { 'u', 'ú', 'ù', 'ü' },
    { 'v' },
    { 'w' },
    { 'x' },
    { 'y', 'ý', 'ÿ' },
    { 'z', 'ž' },
    { 'а' },
    { 'б' },
    { 'в' },
    { 'г', 'ѓ' },
    { 'д' },
    { 'е', 'ё' },
    { 'ж' },
    { 'з' },
    { 'и', 'і' },
    { 'й' },
    { 'к' },
    { 'л' },
    { 'м' },
    { 'н' },
    { 'о' },
    { 'п' },
    { 'р' },
    { 'с' },
    { 'т' },
    { 'у' },
    { 'ф' },
    { 'х' },
    { 'ц' },
    { 'ч' },
    { 'ш' },
    { 'щ' },
    { 'ъ' },
    { 'ы' },
    { 'ь' },
    { 'э' },
    { 'ю' },
    { 'я' },
}
alphabet_upper = { -- for sorting
    { 'Α', 'Ά', 'Ἀ', 'Ἄ', 'Ἂ', 'Ἆ', 'Ἁ', 'Ἅ', 'Ἃ', 'Ἇ', 'ᾼ', 'ᾈ', 'ᾌ', 'ᾊ', 'ᾎ', 'ᾉ', 'ᾍ', 'ᾋ', 'ᾏ' },
    { 'Β' },
    { 'Γ' },
    { 'Δ' },
    { 'Ε', 'Έ', 'Ἐ', 'Ἔ', 'Ἒ', 'Ἑ', 'Ἕ', 'Ἓ' },
    { 'Ζ' },
    { 'Η', 'Ή', 'Ἠ', 'Ἤ', 'Ἢ', 'Ἦ', 'Ἡ', 'Ἥ', 'Ἣ', 'Ἧ', 'ῌ', 'ᾘ', 'ᾜ', 'ᾚ', 'ᾞ', 'ᾙ', 'ᾝ', 'ᾟ' },
    { 'Θ' },
    { 'Ι', 'Ί', 'Ἰ', 'Ἴ', 'Ἲ', 'Ἶ', 'Ἱ', 'Ἵ', 'Ἳ', 'Ἷ', 'Ϊ' },
    { 'Κ' },
    { 'Λ' },
    { 'Μ' },
    { 'Ν' },
    { 'Ξ' },
    { 'Ο', 'Ό', 'Ὀ', 'Ὄ', 'Ὂ', 'Ὁ', 'Ὅ', 'Ὃ' },
    { 'Π' },
    { 'Ρ' },
    { 'Σ' },
    { 'Τ' },
    { 'Υ', 'Ύ', 'Ὑ', 'Ὕ', 'Ὓ', 'Ὗ', 'Ϋ' },
    { 'Φ' },
    { 'Χ' },
    { 'Ψ' },
    { 'Ω', 'Ώ', 'Ὠ', 'Ὤ', 'Ὢ', 'Ὦ', 'Ὡ', 'Ὥ', 'Ὣ', 'Ὧ', 'ῼ', 'ᾩ', 'ᾭ', 'ᾫ', 'ᾯ', 'ᾨ', 'ᾬ', 'ᾪ', 'ᾮ' },
    { 'A', 'Á', 'À', 'Ä', 'Å', 'Æ'},
    { 'B' },
    { 'C', 'Ç' },
    { 'D' },
    { 'E', 'È', 'È', 'Ë' },
    { 'F' },
    { 'G' },
    { 'H' },
    { 'I', 'Í', 'Ì', 'Ï' },
    { 'J' },
    { 'K' },
    { 'L' },
    { 'M' },
    { 'N', 'Ñ' },
    { 'O', 'Ó', 'Ò', 'Ö', 'Ø','Œ' },
    { 'P' },
    { 'Q' },
    { 'R' },
    { 'S', 'Š' },
    { 'T' },
    { 'U', 'Ú', 'Ù', 'Ü' },
    { 'V' },
    { 'W' },
    { 'X' },
    { 'Y', 'Ý', 'Ÿ' },
    { 'Z', 'Ž' },
    { 'А' },
    { 'Б' },
    { 'В' },
    { 'Г', 'Ѓ' },
    { 'Д' },
    { 'Е', 'Ё' },
    { 'Ж' },
    { 'З' },
    { 'И', 'І' },
    { 'Й' },
    { 'К' },
    { 'Л' },
    { 'М' },
    { 'Н' },
    { 'О' },
    { 'П' },
    { 'Р' },
    { 'С' },
    { 'Т' },
    { 'У' },
    { 'Ф' },
    { 'Х' },
    { 'Ц' },
    { 'Ч' },
    { 'Ш' },
    { 'Щ' },
    { 'Ъ' },
    { 'Ы' },
    { 'Ь' },
    { 'Э' },
    { 'Ю' },
    { 'Я' },
}


function SORTendhook(list)
  print ("We have "..#list.." total list entries")
  local greek = {}
  local latin = {}
  local cyrillic = {}
  local symbols = {}
  local numbers = {}
  local others = {}
  local firstChar, charType
  local firstCharNumber
  local v
  for i=1,#list do
    v = list[i]
    firstChar = NormalizedUppercase(utf.sub(v["sortChar"],1,1))
    v["sortChar"] = firstChar -- to be sure it is an uppercase unicode char
    firstCharNumber = string.utfvalue(firstChar)
    charType = getCharType(firstChar)
--    print (utf.sub(v["sortChar"],1,1).."->"..firstChar.." ("..firstCharNumber..") ".." ("..charType..")")
    if charType == 0 then 
      symbols[#symbols+1] = v
    elseif charType == 1 then 
      numbers[#numbers+1] = v
    elseif firstCharNumber > 0x052F then  -- 0x052F is last cyrillic character
      others[#others+1] = v
    elseif firstCharNumber >= 0x0400 then -- 0x0400-0x052F cyrillic characters
      cyrillic[#cyrillic+1] = v
    elseif firstCharNumber <= 0x03FF then -- 0x03FF is last greek character
      if firstCharNumber >= 0x0370 then
        greek[#greek+1] = v               -- 0x0370-0x03FF greek characters
      elseif firstCharNumber <= 0x024F then
        if firstCharNumber >= 0x041 then  -- 0x041-0x024F latin character
          latin[#latin+1] = v
        else
          others[#others+1] = v           -- everything else
        end
      end
    end
  end
  print ("We have "..#greek.." Greek entries")
  print ("We have "..#latin.." Latin entries")
  print ("We have "..#cyrillic.." Cyrillic entries")
  print ("We have "..#symbols.." Symbol entries")
  print ("We have "..#numbers.." Number entries")
  print ("We have "..#others.." other entries")
  list = {}
  for i = 1,#greek do list[#list+1] = greek[i] end
  list[#list]["Macro"] = "\\vspace{1cm}"
  for i = 1,#latin do list[#list+1] = latin[i] end
  list[#list]["Macro"] = "\\vspace{1cm}"
  for i = 1,#cyrillic do list[#list+1] = cyrillic[i] end
  list[#list]["Macro"] = "\\vspace{1cm}"
  for i = 1,#symbols do list[#list+1] = symbols[i] end
  for i = 1,#numbers do list[#list+1] = numbers[i] end
  for i = 1,#others do list[#list+1] = others[i] end
  print ("Sorted "..#list.." entries")
  return list
end

