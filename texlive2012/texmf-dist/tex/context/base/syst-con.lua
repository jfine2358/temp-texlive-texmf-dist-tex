if not modules then modules = { } end modules ['syst-con'] = {
    version   = 1.001,
    comment   = "companion to syst-con.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

converters = converters or { }

--[[ldx--
<p>For raw 8 bit characters, the offset is 0x110000 (bottom of plane 18) at
the top of <l n='luatex'/>'s char range but outside the unicode range.</p>
--ldx]]--

local tonumber = tonumber
local utfchar = unicode.utf8.char
local gsub, format = string.gsub, string.format

function converters.hexstringtonumber(n) tonumber(n,16)   end
function converters.octstringtonumber(n) tonumber(n, 8)   end
function converters.rawcharacter     (n) utfchar(0x110000+n) end
function converters.lchexnumber      (n) format("%x"  ,n) end
function converters.uchexnumber      (n) format("%X"  ,n) end
function converters.lchexnumbers     (n) format("%02x",n) end
function converters.uchexnumbers     (n) format("%02X",n) end
function converters.octnumber        (n) format("%03o",n) end

function commands.hexstringtonumber(n) context(tonumber(n,16)) end
function commands.octstringtonumber(n) context(tonumber(n, 8)) end
function commands.rawcharacter     (n) context(utfchar(0x110000+n)) end
function commands.lchexnumber      (n) context("%x"  ,n) end
function commands.uchexnumber      (n) context("%X"  ,n) end
function commands.lchexnumbers     (n) context("%02x",n) end
function commands.uchexnumbers     (n) context("%02X",n) end
function commands.octnumber        (n) context("%03o",n) end

function commands.format(fmt,...) -- used ?
    fmt = gsub(fmt,"@","%%")
    context(fmt,...)
end
