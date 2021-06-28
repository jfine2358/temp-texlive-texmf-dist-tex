-- 
--  This is file `luatextra.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  luatextra.dtx  (with options: `lua')
--  This is a generated file.
--  
--  Copyright (C) 2009 by Elie Roux <elie.roux@telecom-bretagne.eu>
--  
--  This work is under the CC0 license.
--  
--  This work consists of the main source file luainputenc.dtx
--  and the derived files
--      luatextra.sty, luatextra.lua, luatextra-latex.tex, luatextra.pdf
--  
module("luatextra", package.seeall)
luatexbase.provides_module {
    version     = 0.97,
    name        = "luatextra",
    date        = "2010/05/10",
    description = "Additional low level functions for LuaTeX",
    author      = "Elie Roux and Manuel Pegourie-Gonnard",
    copyright   = "Elie Roux, 2009 and Manuel Pegourie-Gonnard, 2010",
    license     = "CC0",
}
local format = string.format
function luatextra.open_read_file(filename)
    local path = kpse.find_file(filename)
    local env = {
      ['filename'] = filename,
      ['path'] = path,
    }
    luatexbase.call_callback('pre_read_file', env)
    path = env.path
    if not path then
        return
    end
    local f = env.file
    if not f then
        f = io.open(path)
        env.file = f
    end
    if not f then
        return
    end
    env.reader = luatextra.reader
    env.close = luatextra.close
    return env
end
function luatextra.reader(env)
    local line = (env.file):read()
    line = luatexbase.call_callback('file_reader', env, line)
    return line
end
function luatextra.close(env)
    (env.file):close()
    luatexbase.call_callback('file_close', env)
end
function luatextra.default_reader(env, line)
    return line
end
function luatextra.default_close(env)
    return
end
function luatextra.default_pre_read(env)
    return env
end
do
  if tex.luatexversion < 36 then
      fontloader = fontforge
  end
end
function luatextra.find_font(name)
    local types = {'ofm', 'ovf', 'opentype fonts', 'truetype fonts'}
    local path = kpse.find_file(name)
    if path then return path end
    for _,t in pairs(types) do
        path = kpse.find_file(name, t)
        if path then return path end
    end
    return nil
end
function luatextra.font_load_error(error)
    luatextra.module_warning('luatextra', string.format('%s\nloading lmr10 instead...', error))
end
function luatextra.load_default_font(size)
    return font.read_tfm("lmr10", size)
end
function luatextra.define_font(name, size)
    if (size < 0) then size = (- 655.36) * size end
    local fontinfos = {
        asked_name = name,
        name = name,
        size = size
        }
    callback.call('font_syntax', fontinfos)
    name = fontinfos.name
    local path = fontinfos.path
    if not path then
        path = luatextra.find_font(name)
        fontinfos.path = luatextra.find_font(name)
    end
    if not path then
        luatextra.font_load_error("unable to find font "..name)
        return luatextra.load_default_font(size)
    end
    if not fontinfos.filename then
        fontinfos.filename = file.basename(path)
    end
    local ext = file.suffix(path)
    local f
    if ext == 'tfm' or ext == 'ofm' then
        f =  font.read_tfm(name, size)
    elseif ext == 'vf' or ext == 'ovf' then
        f =  font.read_vf(name, size)
    elseif ext == 'ttf' or ext == 'otf' or ext == 'ttc' then
        f = luatexbase.call_callback('open_otf_font', fontinfos)
    else
        luatextra.font_load_error("unable to determine the type of font "..name)
        f = luatextra.load_default_font(size)
    end
    if not f then
        luatextra.font_load_error("unable to load font "..name)
        f = luatextra.load_default_font(size)
    end
    luatexbase.call_callback('post_font_opening', f, fontinfos)
    return f
end
function luatextra.default_font_syntax(fontinfos)
    return
end
function luatextra.default_open_otf(fontinfos)
    return nil
end
function luatextra.default_post_font(f, fontinfos)
    return true
end
function luatextra.register_font_callback()
    luatexbase.add_to_callback('define_font', luatextra.define_font, 'luatextra.define_font')
end
    luatexbase.create_callback('pre_read_file', 'simple', luatextra.default_pre_read)
    luatexbase.create_callback('file_reader', 'data', luatextra.default_reader)
    luatexbase.create_callback('file_close', 'simple', luatextra.default_close)
    luatexbase.add_to_callback('open_read_file', luatextra.open_read_file, 'luatextra.open_read_file')
    luatexbase.create_callback('font_syntax', 'simple', luatextra.default_font_syntax)
    luatexbase.create_callback('open_otf_font', 'first', luatextra.default_open_otf)
    luatexbase.create_callback('post_font_opening', 'simple', luatextra.default_post_font)
-- 
--  End of File `luatextra.lua'.
