--
-- This is file `pgfmolbio.domains.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- pgfmolbio.dtx  (with options: `pmb-dom-lua')
--
-- Copyright (C) 2013 by Wolfgang Skala
--
-- This work may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either version 1.3
-- of this license or (at your option) any later version.
-- The latest version of this license is in
--   http://www.latex-project.org/lppl.txt
-- and version 1.3 or later is part of all distributions of LaTeX
-- version 2005/12/01 or later.
--
module("pgfmolbio.domains", package.seeall)


if luatexbase then
  luatexbase.provides_module({
    name          = "pgfmolbio.domains",
    version       = 0.2,
    date          = "2012/10/01",
    description   = "Domain graphs",
    author        = "Wolfgang Skala",
    copyright     = "Wolfgang Skala",
    license       = "LPPL",
  })
end

local stringToDim = pgfmolbio.stringToDim
local dimToString = pgfmolbio.dimToString
local packageError = pgfmolbio.packageError
local packageWarning = pgfmolbio.packageWarning
local getRange = pgfmolbio.getRange

function printSequenceFeature(feature, xLeft, xRight, yMid, xUnit, yUnit)
  xLeft = xLeft + 0.5
  for currResidue in feature.sequence:gmatch(".") do
    tex.sprint("\n\t\t\\def\\xMid{" .. dimToString(xLeft * xUnit) .. "}")
    tex.sprint("\n\t\t\\def\\yMid{" .. dimToString(yMid * yUnit) .. "}")
    tex.sprint("\n\t\t\\def\\currentResidue{" .. currResidue .. "}")
    tex.sprint("\n\t\t\\pmbdomdrawfeature{other/sequence}")
    xLeft = xLeft + 1
  end
end

function printHelixFeature(feature, xLeft, xRight, yMid, xUnit, yUnit)
  local residuesLeft, currX
  tex.sprint("\n\t\t\\pgfmolbioset[domains]{current style}")

  residuesLeft = feature.stop - feature.start + 1
  currX = xLeft
  tex.sprint("\n\t\t\\def\\xLeft{" .. dimToString(currX * xUnit) .. "}")
  tex.sprint("\n\t\t\\def\\yMid{" .. dimToString(yMid * yUnit) .. "}")
  tex.sprint("\n\t\t\\pmbdomdrawfeature{helix/half upper back}")
  residuesLeft = residuesLeft - 2
  currX = currX + 2.5

  while residuesLeft > 0 do
    if residuesLeft == 1 then
      tex.sprint(
        "\n\t\t\\def\\xRight{" ..
        dimToString((currX + 0.5) * xUnit) ..
        "}"
      )
      tex.sprint("\n\t\t\\def\\yMid{" .. dimToString(yMid * yUnit) .. "}")
      tex.sprint("\n\t\t\\pmbdomdrawfeature{helix/half lower back}")
    else
      tex.sprint("\n\t\t\\def\\xMid{" .. dimToString(currX * xUnit) .. "}")
      tex.sprint(
        "\n\t\t\\def\\yLower{" ..
        dimToString(yMid * yUnit - 1.5 * xUnit) ..
        "}"
      )
      tex.sprint("\n\t\t\\pmbdomdrawfeature{helix/full back}")
    end
    residuesLeft = residuesLeft - 2
    currX = currX + 2
  end

  residuesLeft = feature.stop - feature.start
  currX = xLeft + 1.5
  while residuesLeft > 0 do
    if residuesLeft == 1 then
      tex.sprint(
        "\n\t\t\\def\\xRight{" ..
        dimToString((currX + 0.5) * xUnit) ..
        "}"
      )
      tex.sprint("\n\t\t\\def\\yMid{" .. dimToString(yMid * yUnit) .. "}")
      tex.sprint("\n\t\t\\pmbdomdrawfeature{helix/half upper front}")
    else
      tex.sprint("\n\t\t\\def\\xMid{" .. dimToString(currX * xUnit) .. "}")
      tex.sprint(
        "\n\t\t\\def\\yLower{" ..
        dimToString(yMid * yUnit - 1.5 * xUnit) ..
        "}"
      )
      tex.sprint("\n\t\t\\pmbdomdrawfeature{helix/full front}")
    end
    residuesLeft = residuesLeft - 2
    currX = currX + 2
  end
end

SpecialKeys = {}

function SpecialKeys:new(parms)
  parms = parms or {}
  local newSpecialKeys = {
    disulfideKeys = {},
    featureStyles = {},
    printFunctions = {}
  }

  for keyList, listContents in pairs(parms) do
    for key, value in pairs(listContents) do
      newSpecialKeys[keyList][key] = value
    end
  end

  setmetatable(newSpecialKeys, self)
  self.__index = self
  return newSpecialKeys
end

function SpecialKeys:setKeys(keylist, keys, value)
  for key in keys:gmatch("([^,]+)") do
    key = key:trim()
    self[keylist][key] = value
  end
end

function SpecialKeys:setFeatureStyle(key, style)
  local newStyleList, styleCycles, styleContents

  newStyleList = {}
  while style ~= "" do
    styleCycles = 1
    if style:sub(1,1) == "{" then
      styleContents = style:match("%b{}")
      style = style:match("%b{}(.*)")
    elseif style:sub(1,1) == "*" then
      styleCycles, styleContents = style:match("%*(%d*)(%b{})")
      if styleCycles == "" then styleCycles = 1 end
      style = style:match("%*%d*%b{}(.*)")
    elseif style:sub(1,1) == "," or style:sub(1,1) == " " then
      style = style:match("[,%s]+(.*)")
      styleCycles, styleContents = nil, nil
    else
      styleContents = style:match("([^,]+),")
      if not styleContents then
        styleContents = style
        style = ""
      else
        style = style:match("[^,]+,(.*)")
      end
    end
    if styleCycles then
      table.insert(
        newStyleList,
        {cycles = styleCycles, style = styleContents}
      )
    end
  end
  self.featureStyles[key] = newStyleList
end

function SpecialKeys:aliasFeatureStyle(newKey, oldKey)
  self.featureStyles[newKey] = {alias = oldKey}
end

function SpecialKeys:getBaseKey(key)
  if self.featureStyles[key] then
    if self.featureStyles[key].alias then
      return self.featureStyles[key].alias
    end
  end
  return key
end

function SpecialKeys:clearKeys(keylist)
  self[keylist] = {}
end

function SpecialKeys:selectStyleFromList(key, styleID)
  local styleList

  if not self.featureStyles[key] then
    packageWarning(
      "Feature style `" ..
      key ..
      "' unknown, using `default'."
      )
    styleList = self.featureStyles.default
  elseif self.featureStyles[key].alias then
    styleList = self.featureStyles[self.featureStyles[key].alias]
  else
    styleList = self.featureStyles[key]
  end

  while true do
    for _, v in ipairs(styleList) do
      styleID = styleID - v.cycles
      if styleID < 1 then
        return v.style
      end
    end
  end
end

Protein = {}

function Protein:new()
  local newProtein = {
    name = "",
    sequenceLength = -1,
    ft = {},
    sequence = "",
    xUnit = stringToDim("0.5mm"),
    yUnit = stringToDim("6mm"),
    residuesPerLine = 250,
    residueRangeMin = 1,
    residueRangeMax = 100,
    residueNumbering = {},
    revResidueNumbering = {},
    baselineSkip = 3,
    rulerRange = {},
    defaultRulerStepSize = 50,
    showRuler = true,
    currentStyle = {},
    specialKeys = SpecialKeys:new()
  }
  setmetatable(newProtein, self)
  self.__index = self
  return newProtein
end

function Protein:toAbsoluteResidueNumber(value)
  local result = value:match("%b()")
  if result then
    result = tonumber(result:sub(2, -2))
  else
    result = self.revResidueNumbering[(value:gsub("[<>%?]", ""))]
  end
  if not result then
    packageError("Bad or missing start/end point value: " .. value)
  end
  return result
end

function Protein:readUniprotFile(filename)
  local uniprotFile, errorMsg = io.open(filename, "r")
  if not uniprotFile then packageError(errorMsg) end

  local sequence = {}
  local inSequence = false
  local featureTable = {}

  for currLine in uniprotFile:lines() do
    local lineCode = currLine:sub(1, 2)
    local lineContents = currLine:sub(3)
    if lineCode == "ID" then
      local name, sequenceLength =
        lineContents:match("%s*(%S+)%s*%a+;%s*(%d+)%s*AA%.")
      self.name = name
      self.sequenceLength = tonumber(sequenceLength)
      self.residueRangeMax = self.sequenceLength
    elseif lineCode == "FT" then
      local key = currLine:sub(6, 13):trim()
      local start, stop, description =
        currLine:sub(15, 20), currLine:sub(22, 27), currLine:sub(35, 75)
      if key ~= "" then
        table.insert(featureTable, {
          key = key,
          start = "(" .. start .. ")",
          stop = "(" .. stop .. ")",
          description = description,
          style = "",
          kvList = ""
        })
      else
        featureTable[#featureTable].description =
          featureTable[#featureTable].description .. description
      end
    elseif lineCode == "SQ" then
      inSequence = true
    elseif lineCode == "  " and inSequence then
      table.insert(sequence, (lineContents:gsub("%s+", "")))
    elseif lineCode == "\\\\" then
      break
    end
  end
  uniprotFile:close()
  if next(sequence) then self.sequence = table.concat(sequence) end
  for _, v in ipairs(featureTable) do self:addFeature(v) end
end

function Protein:readGffFile(filename)
  local gffFile, errorMsg = io.open(filename, "r")
  local lineContents, fields, lineNumber

  if not gffFile then packageError(errorMsg) end
  lineNumber = 1
  for currLine in gffFile:lines() do
    lineContents = currLine:gsub("#.*$", "")
    fields = {}
    if lineContents ~= "" then
      for currField in lineContents:gmatch("([^\t]+)") do
        table.insert(fields, currField)
      end
      if not fields[5] then
        packageError("Bad line (" .. lineNumber .. ") in gff file '" ..
          filename .. "':\n" .. currLine)
        break
      end
      self:addFeature{
        key = fields[3],
        start = "(" .. fields[4] .. ")",
        stop = "(" .. fields[5] .. ")",
        description = fields[9] or "",
        style = "",
        kvList = ""
      }
    end
    lineNumber = lineNumber + 1
  end
  gffFile:close()
end

function Protein:getParameters()
  tex.sprint(
    "\\pgfmolbioset[domains]{name={" ..
    self.name ..
    "},sequence={" ..
    self.sequence ..
    "},sequence length=" ..
    self.sequenceLength ..
    "}"
  )
end

function Protein:setParameters(newParms)
  local keyHash = {
    sequenceLength = function(v)
      v = tonumber(v)
      if not v then return self.sequenceLength end
      if v < 1 then
        packageError("Sequence length must be larger than zero.")
      end
      return v
    end,
    residueNumbering = function(v)
      local ranges = {}
      local start, startNumber, startLetter, stop
      self.revResidueNumbering = {}
      if v:trim() == "auto" then
        for i = 1, self.sequenceLength do
          table.insert(ranges, tostring(i))
        end
      else --example list: `1-4,5,6A-D'
        for _, value in ipairs(v:explode(",+")) do
          value = value:trim()
          start, stop = value:match("(%w*)%s*%-%s*(%w*)$")
          if not start then
            start = value:match("(%w*)")
          end
          if not start or start == "" then --invalid range
            packageError("Unknown residue numbering range: " .. value)
          end
          if stop then
            if tonumber(start) and tonumber(stop) then
              --process range `1-4'
              for currNumber = tonumber(start), tonumber(stop) do
                table.insert(ranges, tostring(currNumber))
              end
            else --process range `6A-D'
              startNumber, startLetter = start:match("(%d*)(%a)")
              stop = stop:match("(%a)")
              for currLetter = startLetter:byte(), stop:byte() do
                table.insert(ranges,
                  startNumber .. string.char(currLetter))
              end
            end
          else --process range `5'
            table.insert(ranges, start)
          end
        end
      end
      for i, value in ipairs(ranges) do
        if self.revResidueNumbering[value] then
          packageError("The range value " .. value ..
            " appears more than once.")
        else
          self.revResidueNumbering[value] = i
        end
      end
      return ranges
    end,
    residueRange = function(v)
      local num
      local residueRangeMin, residueRangeMax =
        getRange(v:trim(), "^([%w%(%)]+)%s*%-", "%-%s*([%w%(%)]+)$")
      if residueRangeMin == "auto" then
        self.residueRangeMin = 1
      else
        num = residueRangeMin:match("%b()")
        if num then
          self.residueRangeMin = tonumber(num:sub(2, -2))
        elseif self.revResidueNumbering[residueRangeMin] then
          self.residueRangeMin = self.revResidueNumbering[residueRangeMin]
        else
          packageError("Invalid residue range: " .. residueRangeMin)
        end
      end

      if residueRangeMax == "auto" then
        self.residueRangeMax = self.sequenceLength
      else
        num = residueRangeMax:match("%b()")
        if num then
          self.residueRangeMax = tonumber(num:sub(2, -2))
        elseif self.revResidueNumbering[residueRangeMax] then
          self.residueRangeMax = self.revResidueNumbering[residueRangeMax]
        else
          packageError("Invalid residue range: " .. residueRangeMax)
        end
      end

      if self.residueRangeMin >= self.residueRangeMax then
        packageError("Residue range is smaller than 1.")
      end
    end,
    defaultRulerStepSize = tonumber,
    name = tostring,
    sequence = tostring,
    xUnit = stringToDim,
    yUnit = stringToDim,
    residuesPerLine = tonumber,
    baselineSkip = tonumber,
    rulerRange = function(v)
      local num
      local ranges = {}
      local rulerRangeMin, rulerRangeMax, rulerRangeStep
      for _, value in ipairs(v:explode(",+")) do
        rulerRangeMin, rulerRangeMax, rulerRangeStep =
          getRange(value:trim(), "^([%w%(%)]+)",
            "%-%s*([%w%(%)]+)", "step%s*(%d+)$")

        if rulerRangeMin == "auto" then
          rulerRangeMin = self.residueRangeMin
        else
          num = rulerRangeMin:match("%b()")
          if num then
            rulerRangeMin = tonumber(num:sub(2, -2))
          elseif self.revResidueNumbering[rulerRangeMin] then
            rulerRangeMin = self.revResidueNumbering[rulerRangeMin]
          else
            packageError("Invalid lower ruler range: " .. rulerRangeMin)
          end
        end

        if rulerRangeMax then
          if rulerRangeMax == "auto" then
            rulerRangeMax = self.residueRangeMax
          else
            num = rulerRangeMax:match("%b()")
            if num then
              rulerRangeMax = tonumber(num:sub(2, -2))
            elseif self.revResidueNumbering[rulerRangeMax] then
              rulerRangeMax = self.revResidueNumbering[rulerRangeMax]
            else
              packageError("Invalid upper ruler range: " .. rulerRangeMax)
            end
          end

          if rulerRangeMin >= rulerRangeMax then
            packageError("Ruler range is smaller than 1.")
          end
          if rulerRangeMin < self.residueRangeMin then
            rulerRangeMin = self.residueRangeMin
            packageWarning(
              "Lower ruler range is smaller than" ..
              "lower residue range. It was adjusted to " ..
              rulerRangeMin .. "."
            )
          end
          if rulerRangeMax > self.residueRangeMax then
            rulerRangeMax = self.residueRangeMax
            packageWarning(
              "Upper ruler range exceeds" ..
              "upper residue range. It was adjusted to " ..
              rulerRangeMax .. "."
            )
          end
        else
          rulerRangeMax = rulerRangeMin
        end
        rulerRangeStep = tonumber(rulerRangeStep)
          or self.defaultRulerStepSize

        for i = rulerRangeMin, rulerRangeMax, rulerRangeStep do
          table.insert(
            ranges,
            {pos = i, number = self.residueNumbering[i]}
          )
        end
      end
      return ranges
    end,
    showRuler = function(v)
      if v == "true" then return true else return false end
    end
  }
  for key, value in pairs(newParms) do
    if keyHash[key] then
      self[key] = keyHash[key](value)
      if pgfmolbio.errorCatched then return end
    end
  end
end

function Protein:addFeature(newFeature)
  local baseKey, ftEntry

  baseKey = self.specialKeys:getBaseKey(newFeature.key)
  if self.currentStyle[baseKey] then
    self.currentStyle[baseKey] = self.currentStyle[baseKey] + 1
  else
    self.currentStyle[baseKey] = 1
  end

  ftEntry = {
    key = newFeature.key,
    start = self:toAbsoluteResidueNumber(newFeature.start),
    stop = self:toAbsoluteResidueNumber(newFeature.stop),
    kvList = "style={" ..
      self.specialKeys:selectStyleFromList(baseKey,
        self.currentStyle[baseKey]) .. "}",
    level = newFeature.level or nil
  }
  if newFeature.kvList ~= "" then
    ftEntry.kvList = ftEntry.kvList .. "," .. newFeature.kvList
  end
  if newFeature.description then
    ftEntry.kvList = ftEntry.kvList ..
      ",description={" .. newFeature.description .. "}"
    ftEntry.description = newFeature.description
  end
  table.insert(self.ft, newFeature.layer or #self.ft + 1, ftEntry)
end

function Protein:calculateDisulfideLevels()
  if pgfmolbio.errorCatched then return end
  local disulfideGrid, currLevel, levelFree
  disulfideGrid = {}

  for i, v in ipairs(self.ft) do
    if self.specialKeys.disulfideKeys[v.key] then
      if v.level then
        if not disulfideGrid[v.level] then
          disulfideGrid[v.level] = {}
        end
        for currPos = v.start, v.stop do
          disulfideGrid[v.level][currPos] = true
        end
      else
        currLevel = 1
        repeat
          levelFree = true
          if disulfideGrid[currLevel] then
            for currPos = v.start, v.stop do
              levelFree = levelFree
                and not disulfideGrid[currLevel][currPos]
            end
            if levelFree then
              self.ft[i].level = currLevel
              for currPos = v.start, v.stop do
                disulfideGrid[currLevel][currPos] = true
              end
            end
          else
            self.ft[i].level = currLevel
            disulfideGrid[currLevel] = {}
            for currPos = v.start, v.stop do
              disulfideGrid[currLevel][currPos] = true
            end
            levelFree = true
          end
          currLevel = currLevel + 1
        until levelFree == true
      end
    end
  end
end

function Protein:printTikzDomains()
  if pgfmolbio.errorCatched then return end
  local xLeft, xMid, xRight, yMid, xLeftClip, xRightClip,
    currLine, residuesLeft, currStyle

  for _, currFeature in ipairs(self.ft) do
    currLine = 0
    xLeft = currFeature.start - self.residueRangeMin -
      currLine * self.residuesPerLine + 1
    while xLeft > self.residuesPerLine do
      xLeft = xLeft - self.residuesPerLine
      currLine = currLine + 1
    end
    xLeft = xLeft - 1
    xRight = currFeature.stop - self.residueRangeMin -
      currLine * self.residuesPerLine + 1
    residuesLeft = self.residueRangeMax - self.residueRangeMin -
      currLine * self.residuesPerLine + 1
    xLeftClip = stringToDim("-5cm")
    xRightClip = self.residuesPerLine * self.xUnit

    if currFeature.start <= self.residueRangeMax
        and currFeature.stop >= self.residueRangeMin then
      repeat
        if residuesLeft <= self.residuesPerLine then
          if residuesLeft < xRight then
            xRightClip = residuesLeft * self.xUnit
          else
            xRightClip = xRight * self.xUnit + stringToDim("5cm")
          end
        else
          if xRight <= self.residuesPerLine then
            xRightClip = xRight * self.xUnit + stringToDim("5cm")
          end
        end
        if xLeft < 0 then xLeftClip = stringToDim("0cm") end

        xMid = (xLeft + xRight) / 2
        yMid = -currLine * self.baselineSkip
        if currFeature.level then
          currFeature.kvList = currFeature.kvList ..
            ",level=" .. currFeature.level
        end
        currFeature.sequence =
          self.sequence:sub(currFeature.start, currFeature.stop)

        tex.sprint("\n\t\\begin{scope}\\begin{pgfinterruptboundingbox}")
        tex.sprint("\n\t\t\\def\\xLeft{" ..
          dimToString(xLeft * self.xUnit) .. "}")
        tex.sprint("\n\t\t\\def\\xMid{" ..
          dimToString(xMid * self.xUnit) .. "}")
        tex.sprint("\n\t\t\\def\\xRight{" ..
          dimToString(xRight * self.xUnit) .. "}")
        tex.sprint("\n\t\t\\def\\yMid{" ..
          dimToString(yMid * self.yUnit) .. "}")
        tex.sprint("\n\t\t\\def\\featureSequence{" ..
          currFeature.sequence .. "}")
        tex.sprint(
          "\n\t\t\\clip (" ..
          dimToString(xLeftClip) ..
          ", \\yMid + " ..
          dimToString(stringToDim("10cm")) ..
          ") rectangle (" ..
          dimToString(xRightClip) ..
          ", \\yMid - " ..
          dimToString(stringToDim("10cm")) ..
          ");"
        )
        tex.sprint(
          "\n\t\t\\pgfmolbioset[domains]{" ..
          currFeature.kvList ..
          "}"
        )
        if self.specialKeys.printFunctions[currFeature.key] then
          self.specialKeys.printFunctions[currFeature.key](
            currFeature, xLeft, xRight, yMid, self.xUnit, self.yUnit)
        else
          tex.sprint("\n\t\t\\pmbdomdrawfeature{" ..
            currFeature.key .. "}")
        end
        tex.sprint("\n\t\\end{pgfinterruptboundingbox}\\end{scope}")

        currLine = currLine + 1
        xLeft = xLeft - self.residuesPerLine
        xRight = xRight - self.residuesPerLine
        residuesLeft = residuesLeft - self.residuesPerLine
      until xRight < 1 or residuesLeft < 1
    end
  end

  if self.showRuler then
    currStyle = 1
    tex.sprint("\n\t\\begin{scope}")
    for _, currRuler in ipairs(self.rulerRange) do
      currLine = 0
      xMid = currRuler.pos - self.residueRangeMin -
        currLine * self.residuesPerLine + 1
      while xMid > self.residuesPerLine do
        xMid = xMid - self.residuesPerLine
        currLine = currLine + 1
      end
      xMid = xMid - 0.5
      yMid = -currLine * self.baselineSkip
      tex.sprint(
        "\n\t\t\\pgfmolbioset[domains]{current style/.style={" ..
        self.specialKeys:selectStyleFromList("other/ruler", currStyle) ..
        "}}"
      )
      tex.sprint("\n\t\t\t\\def\\xMid{" ..
        dimToString(xMid * self.xUnit) .. "}")
      tex.sprint("\n\t\t\t\\let\\xLeft\\xMid\\let\\xRight\\xMid")
      tex.sprint("\n\t\t\t\\def\\yMid{" ..
        dimToString(yMid * self.yUnit) .. "}")
      tex.sprint("\n\t\t\t\\def\\residueNumber{" ..
        currRuler.number .. "}")
      tex.sprint("\n\t\t\t\\pmbdomdrawfeature{other/ruler}")
      currStyle = currStyle + 1
    end
    tex.sprint("\n\t\\end{scope}")
  end

  xMid =
    math.min(
      self.residuesPerLine,
      self.residueRangeMax - self.residueRangeMin + 1
    ) / 2
  tex.sprint("\n\t\\begin{scope}")
  tex.sprint(
    "\n\t\t\\pgfmolbioset[domains]{current style/.style={" ..
    self.specialKeys:selectStyleFromList("other/name", 1) ..
    "}}"
  )
  tex.sprint("\n\t\t\\def\\xLeft{0mm}")
  tex.sprint("\n\t\t\\def\\xMid{" .. dimToString(xMid * self.xUnit) .. "}")
  tex.sprint("\n\t\t\\def\\xRight{" ..
    dimToString(self.residuesPerLine * self.xUnit) .. "}")
  tex.sprint("\n\t\t\\def\\yMid{0mm}")
  tex.sprint("\n\t\t\\pmbdomdrawfeature{other/name}")
  tex.sprint("\n\t\\end{scope}")

  tex.sprint(
    "\n\t\\pmbprotocolsizes{" ..
    "\\pmbdomvalueof{enlarge left}}{\\pmbdomvalueof{enlarge top}}"
  )
  currLine =
    math.ceil(
      (self.residueRangeMax - self.residueRangeMin + 1) /
        self.residuesPerLine
    ) - 1
  xRight =
    math.min(
      self.residuesPerLine,
      self.residueRangeMax - self.residueRangeMin + 1
    )
  tex.sprint(
    "\n\t\\pmbprotocolsizes{" ..
    dimToString(xRight * self.xUnit) ..
    " + \\pmbdomvalueof{enlarge right}}{" ..
    dimToString(-currLine * self.baselineSkip * self.yUnit) ..
    " + \\pmbdomvalueof{enlarge bottom}}"
  )
end

function Protein:__tostring()
  local result = {}
  local currLine

  currLine = "\\begin{pmbdomains}\n\t\t[name={" ..
    self.name ..
    "}"
  if self.sequence ~= "" then
    currLine = currLine ..
      ",\n\t\tsequence=" ..
      self.sequence
  end
  currLine = currLine ..
    "]{" ..
    self.sequenceLength ..
    "}"
  table.insert(result, currLine)

  for i, v in ipairs(self.ft) do
    if v.key ~= "other/main chain" then
      currLine = "\t\\addfeature"
      if self.includeDescription and v.description then
        currLine =
          currLine ..
          "[description={" ..
          v.description ..
          "}]"
      end
      currLine =
        currLine ..
        "{" ..
        v.key ..
        "}{" ..
        v.start ..
        "}{" ..
        v.stop ..
        "}"
      table.insert(result, currLine)
    end
  end
  table.insert(result,
    "\\end{pmbdomains}"
  )
  return table.concat(result, "\n")
end
--
-- End of file `pgfmolbio.domains.lua'.
