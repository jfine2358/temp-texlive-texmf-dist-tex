-- Do not edit this file!
-- Created from LineBreak.txt by ltj-unicode-ccfix_make.pl on 2015年 10月 24日 土曜日 16:45:46 JST.
-- In case of errors, fix the Perl script instead.
local tex_catcode = tex.setcatcode
local tex_getcc = tex.getcatcode
local function set_letter(b,e)
  if tex_getcc(b)~=11 then
    for i=b,e do tex_catcode('global', i, 11) end
  end
end
set_letter(0x231A,0x231B)
set_letter(0x23F0,0x23F3)
set_letter(0x2600,0x2603)
set_letter(0x2614,0x2615)
set_letter(0x2618,0x2618)
set_letter(0x261A,0x261F)
set_letter(0x2639,0x263B)
set_letter(0x2668,0x2668)
set_letter(0x267F,0x267F)
set_letter(0x26BD,0x26C8)
set_letter(0x26CD,0x26CD)
set_letter(0x26CF,0x26D1)
set_letter(0x26D3,0x26D4)
set_letter(0x26D8,0x26D9)
set_letter(0x26DC,0x26DC)
set_letter(0x26DF,0x26E1)
set_letter(0x26EA,0x26EA)
set_letter(0x26F1,0x26F5)
set_letter(0x26F7,0x26FA)
set_letter(0x26FD,0x26FF)
set_letter(0x2700,0x2704)
set_letter(0x2708,0x270D)
set_letter(0x2E80,0x2E99)
set_letter(0x2E9B,0x2EF3)
set_letter(0x2F00,0x2FD5)
set_letter(0x2FF0,0x2FFB)
set_letter(0x3003,0x3003)
set_letter(0x3004,0x3004)
set_letter(0x3006,0x3006)
set_letter(0x3007,0x3007)
set_letter(0x3012,0x3013)
set_letter(0x3020,0x3020)
set_letter(0x3021,0x3029)
set_letter(0x3030,0x3030)
set_letter(0x3031,0x3034)
set_letter(0x3036,0x3037)
set_letter(0x3038,0x303A)
set_letter(0x303D,0x303D)
set_letter(0x303E,0x303F)
set_letter(0x3042,0x3042)
set_letter(0x3044,0x3044)
set_letter(0x3046,0x3046)
set_letter(0x3048,0x3048)
set_letter(0x304A,0x3062)
set_letter(0x3064,0x3082)
set_letter(0x3084,0x3084)
set_letter(0x3086,0x3086)
set_letter(0x3088,0x308D)
set_letter(0x308F,0x3094)
set_letter(0x309F,0x309F)
set_letter(0x30A2,0x30A2)
set_letter(0x30A4,0x30A4)
set_letter(0x30A6,0x30A6)
set_letter(0x30A8,0x30A8)
set_letter(0x30AA,0x30C2)
set_letter(0x30C4,0x30E2)
set_letter(0x30E4,0x30E4)
set_letter(0x30E6,0x30E6)
set_letter(0x30E8,0x30ED)
set_letter(0x30EF,0x30F4)
set_letter(0x30F7,0x30FA)
set_letter(0x30FF,0x30FF)
set_letter(0x3105,0x312D)
set_letter(0x3131,0x318E)
set_letter(0x3190,0x3191)
set_letter(0x3192,0x3195)
set_letter(0x3196,0x319F)
set_letter(0x31A0,0x31BA)
set_letter(0x31C0,0x31E3)
set_letter(0x3200,0x321E)
set_letter(0x3220,0x3229)
set_letter(0x322A,0x3247)
set_letter(0x3250,0x3250)
set_letter(0x3251,0x325F)
set_letter(0x3260,0x327F)
set_letter(0x3280,0x3289)
set_letter(0x328A,0x32B0)
set_letter(0x32B1,0x32BF)
set_letter(0x32C0,0x32FE)
set_letter(0x3300,0x33FF)
set_letter(0x3400,0x4DB5)
set_letter(0x4DB6,0x4DBF)
set_letter(0x4E00,0x9FD5)
set_letter(0x9FD6,0x9FFF)
set_letter(0xA000,0xA014)
set_letter(0xA016,0xA48C)
set_letter(0xA490,0xA4C6)
set_letter(0xF900,0xFA6D)
set_letter(0xFA6E,0xFA6F)
set_letter(0xFA70,0xFAD9)
set_letter(0xFADA,0xFAFF)
set_letter(0xFE30,0xFE30)
set_letter(0xFE31,0xFE32)
set_letter(0xFE33,0xFE34)
set_letter(0xFE45,0xFE46)
set_letter(0xFE49,0xFE4C)
set_letter(0xFE4D,0xFE4F)
set_letter(0xFE51,0xFE51)
set_letter(0xFE58,0xFE58)
set_letter(0xFE5F,0xFE61)
set_letter(0xFE62,0xFE62)
set_letter(0xFE63,0xFE63)
set_letter(0xFE64,0xFE66)
set_letter(0xFE68,0xFE68)
set_letter(0xFE6B,0xFE6B)
set_letter(0xFF02,0xFF03)
set_letter(0xFF06,0xFF07)
set_letter(0xFF0A,0xFF0A)
set_letter(0xFF0B,0xFF0B)
set_letter(0xFF0D,0xFF0D)
set_letter(0xFF0F,0xFF0F)
set_letter(0xFF10,0xFF19)
set_letter(0xFF1C,0xFF1E)
set_letter(0xFF20,0xFF20)
set_letter(0xFF21,0xFF3A)
set_letter(0xFF3C,0xFF3C)
set_letter(0xFF3E,0xFF3E)
set_letter(0xFF3F,0xFF3F)
set_letter(0xFF40,0xFF40)
set_letter(0xFF41,0xFF5A)
set_letter(0xFF5C,0xFF5C)
set_letter(0xFF5E,0xFF5E)
set_letter(0xFFE2,0xFFE2)
set_letter(0xFFE3,0xFFE3)
set_letter(0xFFE4,0xFFE4)
set_letter(0x1B000,0x1B001)
set_letter(0x1F000,0x1F02B)
set_letter(0x1F030,0x1F093)
set_letter(0x1F0A0,0x1F0AE)
set_letter(0x1F0B1,0x1F0BF)
set_letter(0x1F0C1,0x1F0CF)
set_letter(0x1F0D1,0x1F0F5)
set_letter(0x1F200,0x1F202)
set_letter(0x1F210,0x1F23A)
set_letter(0x1F240,0x1F248)
set_letter(0x1F250,0x1F251)
set_letter(0x1F300,0x1F39B)
set_letter(0x1F39E,0x1F3B4)
set_letter(0x1F3B7,0x1F3BB)
set_letter(0x1F3BD,0x1F3FA)
set_letter(0x1F400,0x1F49F)
set_letter(0x1F4A1,0x1F4A1)
set_letter(0x1F4A3,0x1F4A3)
set_letter(0x1F4A5,0x1F4AE)
set_letter(0x1F4B0,0x1F4B0)
set_letter(0x1F4B3,0x1F4FF)
set_letter(0x1F507,0x1F516)
set_letter(0x1F525,0x1F531)
set_letter(0x1F54A,0x1F579)
set_letter(0x1F57B,0x1F5A3)
set_letter(0x1F5A5,0x1F5D3)
set_letter(0x1F5DC,0x1F5F3)
set_letter(0x1F5FA,0x1F5FF)
set_letter(0x1F600,0x1F64F)
set_letter(0x1F680,0x1F6D0)
set_letter(0x1F6E0,0x1F6EC)
set_letter(0x1F6F0,0x1F6F3)
set_letter(0x1F910,0x1F918)
set_letter(0x1F980,0x1F984)
set_letter(0x1F9C0,0x1F9C0)
set_letter(0x20000,0x2A6D6)
set_letter(0x2A6D7,0x2A6FF)
set_letter(0x2A700,0x2B734)
set_letter(0x2B735,0x2B73F)
set_letter(0x2B740,0x2B81D)
set_letter(0x2B81E,0x2B81F)
set_letter(0x2B820,0x2CEA1)
set_letter(0x2CEA2,0x2F7FF)
set_letter(0x2F800,0x2FA1D)
set_letter(0x2FA1E,0x2FFFD)
set_letter(0x30000,0x3FFFD)
