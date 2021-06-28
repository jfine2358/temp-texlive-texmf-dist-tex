-- 
--  This is file `luamplib-createmem.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luamplib.dtx  (with options: `gen-lua')
--  This is a generated file.
--  
--  Copyright (C) 2008-2009 by Hans Hagen, Taco Hoekwater and Elie Roux
--  <elie.roux@telecom-bretagne.eu>.
--  
--  This work is under the CC0 license.
--  
--  This Current Maintainer of this work is Elie Roux.
--  
--  This work consists of the main source file luamplib.dtx
--  and the derived files
--     luamplib.sty, luamplib.lua, luamplib-createmem.lua and luamplib.pdf.
--  

kpse.set_program_name("kpsewhich")

function finder (name, mode, ftype)
    if mode == "w" then
        return name
    else
        local result = kpse.find_file(name,ftype)
        return result
    end
end

local preamble = [[
input %s ; dump ;
]]


makeformat = function (name, mem_name)
    local mpx = mplib.new {
        ini_version = true,
        find_file = finder,
        job_name =  mem_name,
        }
    if mpx then
        local result
        result = mpx:execute(string.format(preamble,name))
        print(string.format("dumping format %s in %s", name, mem_name))
        mpx:finish()
    end
end

makeformat("plain", "luatex-plain.mem")

-- 
--  End of File `luamplib-createmem.lua'.
