#!/usr/bin/env texlua
-------------------------------------------------------------------------------
--
-- media4svg.lua
--
-- base64 encoding utility, version 2020/04/09
--
-- (C) 2020-today, Alexander Grahn, using code by Alex Kloss
--
-- Usage:
--
-- 1. as a commandline utility:
--
--   texlua media4svg.lua <file>
--
-- 2. as a library from within LuaTeX input:
--
--   \directlua{require('media4svg')}
--   \directlua{media4svg.base64("<file>",<chunksize>,"<end-of-line string>")}
--
--     <file>               string; file name
--     <chunksize>          integer, multiple of 3; size of binary data (bytes)
--                          to be converted at a time
--     <end-of-line string> a string to be appended at the end of every output
--                          line
--
--     The output is placed into LuaTeX's input stream.
--
-------------------------------------------------------------------------------

-- This work may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License.
--
-- The latest version of this license is in
--   http://mirrors.ctan.org/macros/latex/base/lppl.txt
--
-- This work has the LPPL maintenance status `maintained'.
--
-- The Current Maintainer of this work is A. Grahn.

local P = {}
media4svg = P

-----------------------------------------------------------------------
-- function `base64' taken from http://lua-users.org/wiki/BaseSixtyFour
-- code by Alex Kloss <alexthkloss@web.de>
-----------------------------------------------------------------------
local bs = { [0] =
   'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
   'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
   'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
   'w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/',
}

local function base64(s)
   local byte, rep = string.byte, string.rep
   local pad = 2 - ((#s-1) % 3)
   s = (s..rep('\0', pad)):gsub("...", function(cs)
      local a, b, c = byte(cs, 1, 3)
      return bs[a>>2] .. bs[(a&3)<<4|b>>4] .. bs[(b&15)<<2|c>>6] .. bs[c&63]
   end)
   return s:sub(1, #s-pad) .. rep('=', pad)
end
-----------------------------------------------------------------------

-- wrapper, to be called from within TeX code
function P.base64(filename, chunksize, endofline)
  local foundfile = kpse.find_file(filename, 'tex', true)
  if foundfile then
    local filehandle = io.open(foundfile, 'rb')
    chunksize = tonumber(chunksize)
    if filehandle then
      while true do
        local data = filehandle:read(chunksize)
        if not data then break end
        tex.write('', base64(data), endofline)
      end
      filehandle:close()
    end
  end
end

-- if used as command line utility, encodes the file given
-- as the first argument
if (string.find(arg[0],'media4svg%.lua$') and arg[1] ~= nil) then
  kpse.set_program_name('kpsewhich')
  local foundfile = kpse.find_file(arg[1], 'tex', true)
  if not foundfile then
    io.stderr:write(arg[1]..': File not found.\n')
    os.exit(1)
  end
  local filehandle = io.open(foundfile,'rb')
  if not filehandle then os.exit(1) end
  while true do
    local data = filehandle:read(72)
    if not data then break end
    print(base64(data))
  end
  filehandle:close()
end

return P
