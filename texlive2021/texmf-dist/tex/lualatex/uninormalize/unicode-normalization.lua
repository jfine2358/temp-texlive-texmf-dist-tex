-- char-def now contains all necessary fields, no need for a custom file
if not characters then
  require "char-def"
end

if not unicode then require('unicode') end
unicode.conformance = unicode.conformance or { }

unicharacters = unicharacters or {}
uni = unicode.utf8
unidata = characters.data

function printf(s, ...) print(string.format(s, ...)) end
-- function debug(s, ...) io.write("DEBUG: ", string.format(s, ...), "\n") end
function warn(s, ...) io.write("Warning: ", string.format(s, ...), "\n") end

function md5sum(any) return md5.hex(md5.sum(any)) end

-- Rehash the character data
unicharacters.combinee = { }
unicharacters.context = unicharacters.context or { }
local charu = unicode.utf8.char

function unicharacters.context.rehash2()
  for ucode, udata in pairs(unidata) -- *not* ipairs :-)
  do
    local sp = udata.specials
    if sp then
      if sp[1] == 'char' then
        -- local ucode = udata.unicodeslot
        local entry = { combinee = sp[2], combining = sp[3], combined = ucode }
        if not unicharacters.combinee[sp[2]]
        then unicharacters.combinee[sp[2]] = { } end
        local n = #unicharacters.combinee[sp[2]]
        unicharacters.combinee[sp[2]][n+1] = entry
      end
    end
    -- copy context's combining field to combclass field
    -- this field was in the custom copy of the char-def.lua that we no longer use
    udata.combclass = udata.combining
  end
end


unicharacters.context.rehash2()
combdata = unicharacters.combinee

--[[ function unicode.conformance.is_hangul(ucode)
  return ucode >= 0xAC00 and ucode <= 0xD7A3
end ]] -- Make it local for the moment
local function is_hangul(char)
  return char >= 0xAC00 and char <= 0xD7A3
end

local function is_jamo(char)
  if char < 0x1100 then return false
  elseif char < 0x1160 then return 'choseong'
  elseif char < 0x11A8 then return 'jungseong'
  elseif char < 0x11FA then return 'jongseong'
  else return false
  end
end

local function decompose(ucode, compat) -- if compat then compatibility
  local invbuf = { }
  local sp = unidata[ucode].specials
  if not sp
  then return { ucode } else
    if compat then compat = (sp[1] == 'compat') else compat = false end
    while sp[1] == 'char' or compat do
      head, tail = sp[2], sp[3]
      if not tail then invbuf[#invbuf + 1] = head break end -- singleton
      invbuf[#invbuf + 1] = tail
        sp = unidata[head].specials
        if not sp then invbuf[#invbuf + 1] = head sp = { } end
      -- end -- not unidata[head]
    end -- while sp[1] == 'char' or compat
  end -- not sp

  local seq = { }
  for i = #invbuf, 1, -1
  do seq[#seq + 1] = invbuf[i]
  end
  return seq
end

local function canon(seq) -- Canonical reordering
  if #seq < 3 then return seq end
  local c1, c2, buf
  -- I'd never thought I'd implement an actual bubble sort some day ;-)
  for k = #seq - 1, 1, -1 do
    for i = 2, k do -- was k - 1!  Argh!
      c1 = unidata[seq[i]].combclass
      c2 = unidata[seq[i+1]].combclass
      if c1 and c2 then
        if c1 > c2 then
          buf = seq[i]
          seq[i] = seq[i+1]
          seq[i+1] = buf
        end
      end
    end
  end
  return seq
end

if not math.div then -- from l-math.lua
  function math.div(n, m)
    return math.floor(n/m)
  end
end

local SBase, LBase, VBase, TBase = 0xAC00, 0x1100, 0x1161, 0x11A7
local LCount, VCount, TCount = 19, 21, 28
local NCount = VCount * TCount
local SCount = TCount * NCount

local function decompose_hangul(ucode) -- assumes input is really a Hangul
  local SIndex = ucode - SBase
  local L = LBase + math.div(SIndex, NCount)
  local V = VBase + math.div((SIndex % NCount), TCount)
  local T = TBase + SIndex % TCount
  if T == TBase then T = nil end
  return { L, V, T }
end

-- To NFK?D.
function toNF_D_or_KD(unistring, compat)
  local nfd, seq = { }, { }
  for uchar in uni.gmatch(unistring, '.') do
    local ucode = uni.byte(uchar)
    if is_hangul(ucode) then
      seq = decompose_hangul(ucode)
      for  _, c in ipairs(seq)
      do nfd[#nfd + 1] = c
      end
      seq = { }
    elseif not unidata[ucode]
    then nfd[#nfd + 1] = ucode else
      local ccc = unidata[ucode].combclass
      if not ccc or ccc == 0 then
        seq = canon(seq)
        for _, c in ipairs(seq) do nfd[#nfd + 1] = c end
        seq = decompose(ucode, compat)
      else seq[#seq + 1] = ucode
      end -- not ccc or ccc == 0
    end -- if is_hangul(ucode) / elseif not unidata[ucode]
  end -- for uchar in uni.gmatch(unistring, ".")

  if #seq > 0 then
    seq = canon(seq)
    for _, c in ipairs(seq) do nfd[#nfd + 1] = c end
  end

  local nfdstr = ""
  for _, chr in ipairs(nfd)
  do nfdstr = string.format("%s%s", nfdstr, uni.char(chr)) end
  return nfdstr, nfd
end

function unicode.conformance.toNFD(unistring)
  return toNF_D_or_KD(unistring, false)
end

function unicode.conformance.toNFKD(unistring)
  return toNF_D_or_KD(unistring, true)
end

local function compose(seq)
  local base = seq[1]
  if not combdata[base] then return seq else
    local i = 2
    while i <= #seq do -- can I play with 'i' in a for loop?
      local cbng = seq[i]
      local cccprev
      if unidata[seq[i-1]] then cccprev = unidata[seq[i-1]].combclass end
      if not cccprev then cccprev = -1 end
      if unidata[cbng].combclass > cccprev then
        if not combdata[base] then return seq else
          for _, cbdata in ipairs(combdata[base]) do
            if cbdata.combining == cbng then
              seq[1] = cbdata.combined
              base = seq[1]
              for k = i, #seq - 1
              do seq[k] = seq[k+1]
              end -- for k = i, #seq - 1
              seq[#seq] = nil
              i = i - 1
            end -- if cbdata.combining == cbng
          end -- for _, cbdata in ipairs(combdata[base])
        end -- if unidata[cbng.combclass > cccprev
      end -- if not combdata[base]
    i = i + 1
    end -- while i <= #seq
  end -- if not combdata[base]
  return seq
end

-- To NFC from NFD.
-- Does not yet take all the composition exclusions in account
-- (missing types 1 and 2 as defined by UAX #15 X6)
function unicode.conformance.toNFC_fromNFD(nfd)
  local nfc = { }
  local seq = { }
  for uchar in uni.gmatch(nfd, '.') do
    local ucode = uni.byte(uchar)
    if not unidata[ucode]
    then nfc[#nfc + 1] = ucode else
      local cb = unidata[ucode].combclass
      if not cb or (cb == 0) then
        -- if seq ~= { } then -- Dubious ...
        if #seq > 0 then
          seq = compose(seq) -- There was a check for #seq == 1 here
          for i = 1, #seq do nfc[#nfc + 1] = seq[i] end
        end -- #seq > 0
        seq = { ucode } 
      else seq[#seq + 1] = ucode --[[ Maybe check if seq is not empty ... ]]
      end -- not cb or cb == 0
    end
  end

  seq = compose(seq)
  for i = 1, #seq do nfc[#nfc + 1] = seq[i] end

  local nfcstr = ""
  for _, chr in ipairs(nfc)
  do nfcstr = string.format("%s%s", nfcstr, uni.char(chr)) end
  return nfcstr, nfc
end

local function cancompose(seq, compat)
  local dec = { } -- new table to hold the decomposed sequence

  local shift
  if #seq >= 2 then -- let's do it the brutal way :-)
    if is_jamo(seq[1]) == 'choseong' and
       is_jamo(seq[2]) == 'jungseong' then
      LIndex = seq[1] - LBase
      VIndex = seq[2] - VBase
      if #seq == 2 or is_jamo(seq[3]) ~= 'jongseong' then
        TIndex = 0
        shift = 1
      else
        TIndex = seq[3] - TBase
        shift = 2
      end
      seq[1] = (LIndex * VCount + VIndex) * TCount + TIndex + SBase
      for i = 2, #seq -- this shifts and shrinks the table at the same time
      do seq[i] = seq[i + shift]
      end
    end
  end

  dec[1] = seq[1]
  for i = 2, #seq do
    local u = seq[i]
    local sp = unidata[u].specials
    if sp then
      if compat then compat = (sp[1] == 'compat') else compat = false end
      if (sp[1] == 'char') or compat then
        for i = 2, #sp
        do dec[#dec + 1] = sp[i]
        end
      end
    else dec[#dec + 1] = u
    end
  end -- we have the fully decomposed sequence; now sort it

  for i = #dec - 1, 2, -1 do -- bubble sort!
    for j = 2, #dec - 1 do
      local u = dec[j]
      local ccc1 = unidata[u].combclass
      local v = dec[j+1]
      local ccc2 = unidata[v].combclass
      if ccc1 > ccc2 then -- swap
        dec[j+1] = u
        dec[j] = v
      end
    end
  end -- dec sorted; now recursively compose

  local base, i, n = dec[1], 2, #dec
  local cbd = combdata[base]
  local incr_i = true
  while i <= n do
    local cbg = dec[i]
    if cbd then
      for _, cb in ipairs(cbd) do
        if cb.combining == cbg then
      -- NO :-) -- if cbd[cbg] then -- base and cbg combine; compose
          dec[1] = cb.combined
          base = dec[1]
          cbd = combdata[base]
          for j = i, n-1 -- shift table elements right of i
          do dec[j] = dec[j+1] end
          dec[n] = nil
          n = n-1 -- table has shrunk by 1, and i doesn't grow
          incr_i = false
        end
      end
    end
    if incr_i then i = i + 1
    else incr_i = true end
  end -- we're finally through! return
  return dec
end

function toNF_C_or_KC(unistring, compat)
  if unistring == "" then return "" end
  local nfc, seq = "", { }
  local start, space = true, ""
  for uchar in uni.gmatch(unistring, '.') do
    local ucode = uni.byte(uchar)
    if start then space = ", " start = true end
    if not unidata[ucode] then -- unknown to the UCD, will not compose
      nfc = string.format("%s%s", nfc, uchar)
    else
      local ccc = unidata[ucode].combclass 
      if not (ccc or is_jamo(ucode) == 'jongseong'
              or is_jamo(ucode) == 'jungseong')
         or ccc == 0 or (is_jamo(ucode) == 'choseong') then
      -- and is actually good :-) -- Well, yes and no ;-)
        if #seq == 0 then -- add ucode and go to next item of the loop
          seq = { ucode }
        else -- seq contains unicharacters, try and compose them
          if #seq == 1 then nfc = string.format("%s%s", nfc, uni.char(seq[1]))
          else dec = cancompose(seq, compat)
            for _, c in ipairs(dec) -- add the whole sequence to nfc
            do nfc = string.format("%s%s", nfc, uni.char(c)) end
          end
          seq = { ucode } -- don't forget to reinitialize seq with current char
        end
      else -- not ccc or ccc == 0 and is_choseong:
           -- character is combining, add it to seq
        seq[#seq + 1] = ucode
      end
    end
  end
  if #seq > 0 then dec = cancompose(seq, compat) end
  for _, c in ipairs(dec)
  do nfc = string.format("%s%s", nfc, uni.char(c)) end
  return nfc
end

function unicode.conformance.toNFC(unistring)
  return toNF_C_or_KC(unistring, false)
end

function unicode.conformance.toNFKC(unistring)
  return toNF_C_or_KC(unistring, true)
end
