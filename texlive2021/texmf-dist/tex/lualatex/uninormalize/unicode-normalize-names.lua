-- Unicode names

if not characters then
  require "char-def"
end

unicode = unicode or { }
unicode.conformance = unicode.conformance or { }

unidata = characters.data

if not math.div then -- from l-math.lua
  function math.div(n, m)
    return math.floor(n/m)
  end
end

local function is_hangul(char)
  return char >= 0xAC00 and char <= 0xD7A3
end

local function is_han_character(char) -- from font-otf.lua (check)
  return
     (char>=0x04E00 and char<=0x09FFF) or
     (char>=0x03400 and char<=0x04DFF) or
     (char>=0x20000 and char<=0x2A6DF) or
     (char>=0x0F900 and char<=0x0FAFF) or
     (char>=0x2F800 and char<=0x2FA1F)
end

local SBase, LBase, VBase, TBase = 0xAC00, 0x1100, 0x1161, 0x11A7
local LCount, VCount, TCount = 19, 21, 28
local NCount = VCount * TCount
local SCount = LCount * NCount

local JAMO_L_TABLE = { [0] = "G", "GG", "N", "D", "DD", "R", "M", "B", "BB",
  "S", "SS", "", "J", "JJ", "C", "K", "T", "P", "H" }
local JAMO_V_TABLE = { [0] = "A", "AE", "YA", "YAE", "EO", "E", "YEO", "YE",
  "O", "WA", "WAE", "OE", "YO", "U", "WEO", "WE", "WI", "YU", "EU", "YI", "I" }
local JAMO_T_TABLE = { [0] = "", "G", "GG", "GS", "N", "NJ", "NH", "D", "L",
  "LG", "LM", "LB", "LS", "LT", "LP", "LH", "M", "B", "BS", "S", "SS", "NG",
  "J", "C", "K", "T", "P", "H" }

function unicode.conformance.name(char)
  if is_hangul(char) then
    local SIndex = char - SBase
    local LIndex = math.div(SIndex, NCount)
    local VIndex = math.div(SIndex % NCount, TCount)
    local TIndex = SIndex % TCount
    return string.format("HANGUL SYLLABLE %s%s%s", JAMO_L_TABLE[LIndex],
      JAMO_V_TABLE[VIndex], JAMO_T_TABLE[TIndex])
  elseif is_han_character(char)
  then return string.format("CJK UNIFIED IDEOGRAPH-%04X", char)
  elseif unidata[char] -- if unidata[char] exists, the name exists
  then return unidata[char].description
  end
end
