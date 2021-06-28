--
-- This is file `unicode-math.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- unicode-math.dtx  (with options: `lua')
-- Copyright 2006-2013   Will Robertson <will.robertson@latex-project.org>
-- Copyright 2010-2013 Philipp Stephani <st_philipp@yahoo.de>
-- Copyright 2012-2013     Khaled Hosny <khaledhosny@eglug.org>
-- 
-- This package is free software and may be redistributed and/or modified under
-- the conditions of the LaTeX Project Public License, version 1.3c or higher
-- (your choice): <http://www.latex-project.org/lppl/>.
-- 
-- This work is "maintained" by Will Robertson.
local err, warn, info, log = luatexbase.provides_module({
  name        = "unicode-math",
  date        = "2013/05/04",
  version     = 0.3,
  description = "Unicode math typesetting for LuaLaTeX",
  author      = "Khaled Hosny, Will Robertson, Philipp Stephani",
  licence     = "LPPL v1.3+"
})
if luaotfload and luaotfload.module and luaotfload.module.version < 2 then
  local function set_sscale_dimens(fontdata)
    local mc = fontdata.MathConstants
    if mc then
      fontdata.parameters[10] = mc.ScriptPercentScaleDown or 70
      fontdata.parameters[11] = mc.ScriptScriptPercentScaleDown or 50
    end
  end
  luatexbase.add_to_callback("luaotfload.patch_font", set_sscale_dimens, "unicode_math.set_sscale_dimens")
  local function patch_cambria_domh(fontdata)
    local mc = fontdata.MathConstants
    if mc and fontdata.psname == "CambriaMath" then
      -- keeping backward compatibility with luaotfload v1
      local units_per_em
      local metadata = fontdata.shared and fontdata.shared.rawdata.metadata
      if metadata and metadata.units_per_em then
        units_per_em = metadata.units_per_em
      elseif fontdata.parameters.units then
        units_per_em = fontdata.parameters.units
      elseif fontdata.units then
        units_per_em = fontdata.units
      else
        units_per_em = 1000
      end
      local sz = fontdata.parameters.size or fontdata.size
      local mh = 2800 / units_per_em * sz
      if mc.DisplayOperatorMinHeight < mh then
        mc.DisplayOperatorMinHeight = mh
      end
    end
  end
  luatexbase.add_to_callback("luaotfload.patch_font", patch_cambria_domh, "cambria.domh")
end
