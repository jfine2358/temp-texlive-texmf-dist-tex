-----------------------------------------------------------------------
--         FILE:  xindex-norsk.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Herbert Voß
--     MODIFIED:  Sveinung Heggen (2020-01-02)
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-no'] = {
      version = 0.28,
      comment = "configuration to xindex.lua",
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

escape_chars = { -- by default " is the escape char
  {'""', "\\escapedquote",      '\"{}' },
  {'"@', "\\escapedat",         "@"    },
  {'"|', "\\escapedvert",       "|"    },
  {'"!', "\\escapedexcl",       "!"    },
  {'"(', "\\escapedparenleft",  "("   },
  {'")', "\\escapedparenright", ")"  }
}

alphabet_lower = { --   for sorting
    { ' ' },  -- only for internal tests
    { 'a', 'á', 'à', },
    { 'b' },
    { 'c', 'ç' },
    { 'd' },
    { 'e', 'é', 'è', 'ë', 'ê' },
    { 'f' },
    { 'g' },
    { 'h' },
    { 'i', 'í', 'ì', 'î', 'ï' },
    { 'j' },
    { 'k' },
    { 'l' },
    { 'm' },
    { 'n', 'ñ' },
    { 'o', 'ó', 'ò', 'ô' },
    { 'p' },
    { 'q' },
    { 'r' },
    { 's', 'š', 'ß' },
    { 't' },
    { 'u', 'ú', 'ù', 'û' },
    { 'v' },
    { 'w' },
    { 'x' },
    { 'y', 'ý', 'ÿ', 'ü' },
    { 'z', 'ž' },
    { 'æ', 'œ', 'ä' },
    { 'ø', 'ö' },
    { 'å' }
}
alphabet_upper = { -- for sorting
    { ' ' },
    { 'A', 'Á', 'À', 'Â'},
    { 'B' },
    { 'C', 'Ç' },
    { 'D' },
    { 'E', 'È', 'É', 'Ë', 'Ê' },
    { 'F' },
    { 'G' },
    { 'H' },
    { 'I', 'Í', 'Ì', 'Ï', 'Î' },
    { 'J' },
    { 'K' },
    { 'L' },
    { 'M' },
    { 'N', 'Ñ' },
    { 'O', 'Ó', 'Ò', 'Ô' },
    { 'P' },
    { 'Q' },
    { 'R' },
    { 'S', 'Š' },
    { 'T' },
    { 'U', 'Ú', 'Ù', 'Û' },
    { 'V' },
    { 'W' },
    { 'X' },
    { 'Y', 'Ý', 'Ÿ', 'Ü' },
    { 'Z', 'Ž' },
    { 'Æ', 'Œ', 'Ä' },
    { 'Ø', 'Ö' },
    { 'Å' }
}

--ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ

--A   Á   B   C   Č   D   Ð   E   F   G   H   I   J   K   L   M   N   Ŋ   O   P   Q   R   S   Š   T   Ŧ   U   V   W   X   Y   Z   Ž   Æ   Ä   Ø   Ö   Å   Aa  
--1   3   5   7   9   11  13  15  17  19  21  23  25  27  29  31  33  35  37  39  41  43  45  47  49  51  53  55  57  59  61  63  65  67  69  71  73  75  75  
--a   á   b   c   č   d   đ   e   f   g   h   i   j   k   l   m   n   ŋ   o   p   q   r   s   š   t   ŧ   u   v   w   x   y   z   ž   æ   ä   ø   ö   å   aa  
--2   4   6   8   10  12  14  16  18  20  22  24  26  28  30  32  34  36  38  40  42  44  46  48  50  52  54  56  58  60  62  64  66  68  70  72  74  76  76  

alphabet_sort = {
{"A"},  
{"a"},  
{"Á"},  
{"á"},  
{"B"},  
{"b"},  
{"C"},  
{"c"},  
{"Č"},  
{"č"},  
{"D"},  
{"d"},  
{"Ð"},  
{"đ"},  
{"E"},  
{"e"},  
{"F"},  
{"f"},  
{"G"},  
{"g"},  
{"H"},  
{"h"},  
{"I"},  
{"i"},  
{"J"},  
{"j"},  
{"K"},  
{"k"},  
{"L"},  
{"l"},  
{"M"},  
{"m"},  
{"N"},  
{"n"},  
{"Ŋ"},  
{"ŋ"},  
{"O", "Ö"},  
{"o", "ö"},  
{"P"},  
{"p"},  
{"Q"},  
{"q"},  
{"R"},  
{"r"},  
{"S"},  
{"s"},  
{"Š"},  
{"š"},  
{"T"},  
{"t"},  
{"Ŧ"},  
{"ŧ"},  
{"U"},  
{"u"},  
{"V"},  
{"v"},  
{"W"},  
{"w"},  
{"X"},  
{"x"},  
{"Y"},  
{"y"},  
{"Z"},  
{"z"},  
{"Ž"},  
{"ž"},  
{"Æ"},  
{"æ"},  
{"Ä"},  
{"ä"},  
{"Ø"},  
{"ø"},  
{"Ö"},  
{"ö"},  
{"Å", "Aa"},  
{"å", "aa"},
{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
}

--function getCharType(c)
--  return 2
--end
  
function SORTendhook(list)
  print ("We have "..#list.." total list entries")
  local alpha = {}
  local symbols = {}
  local numbers = {}
  local others = {}
  local firstChar, charType
  local firstCharNumber
  local v
  local latin = {}
  print ("#alphabet_sort: "..#alphabet_sort)
  for j=1,#alphabet_sort do
    print ("Check: "..alphabet_sort[j][1].."["..#alphabet_sort[j].."]")
    for i=1,#list do
      v = list[i]
      if #alphabet_sort[j] > 1 then
        for k = 1,#alphabet_sort[j] do
          if utf.sub(v["Entry"],1,1) == alphabet_sort[j][k] then
            print (alphabet_sort[j],v["Entry"])
            latin[#latin+1] = v
          end
        end
      else
        if utf.sub(v["Entry"],1,1) == alphabet_sort[j][1] then
          print (alphabet_sort[j][1],v["Entry"])
          latin[#latin+1] = v
        end
      end
    end
  end
--[[
  for i=1,#list do
    v = list[i]
    firstChar = NormalizedUppercase(utf.sub(v["sortChar"],1,1))
    v["sortChar"] = firstChar -- to be sure it is an uppercase unicode char
    firstCharNumber = string.utfvalue(firstChar)
    charType = getCharType(firstChar)
    if charType == 0 then 
      symbols[#symbols+1] = v
    elseif charType == 1 then 
      numbers[#numbers+1] = v
    elseif firstCharNumber > 0x052F then  -- 0x052F is last cyrillic character
      others[#others+1] = v
    end
  end
  print ("We have "..#letter.." Latin entries")
  print ("We have "..#symbols.." Symbol entries")
  print ("We have "..#numbers.." Number entries")
  print ("We have "..#others.." other entries")

  list = {}
  for i = 1,#letter do list[#list+1] = letter[i] end
  list[#list]["Macro"] = "\\vspace{1cm}"
  for i = 1,#symbols do list[#list+1] = symbols[i] end
  for i = 1,#numbers do list[#list+1] = numbers[i] end
  for i = 1,#others do list[#list+1] = others[i] end
  print ("Sorted "..#list.." entries")
  return list
]]
  return latin
end

