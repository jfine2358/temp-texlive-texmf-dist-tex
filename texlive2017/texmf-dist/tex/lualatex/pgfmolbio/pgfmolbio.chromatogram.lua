--
-- This is file `pgfmolbio.chromatogram.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- pgfmolbio.dtx  (with options: `pmb-chr-lua')
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
module("pgfmolbio.chromatogram", package.seeall)


if luatexbase then
  luatexbase.provides_module{
    name          = "pgfmolbio.chromatogram",
    version       = 0.2,
    date          = "2012/10/01",
    description   = "DNA sequencing chromatograms",
    author        = "Wolfgang Skala",
    copyright     = "Wolfgang Skala",
    license       = "LPPL",
  }
end

local ALL_BASES = {"A", "C", "G", "T"}
local PGFKEYS_PATH = "/pgfmolbio/chromatogram/"

local stringToDim = pgfmolbio.stringToDim
local dimToString = pgfmolbio.dimToString
local packageError = pgfmolbio.packageError
local packageWarning = pgfmolbio.packageWarning
local getRange = pgfmolbio.getRange

local function stdProbStyle(prob)
  local color = ""
  if prob >= 0 and prob < 10 then
    color = "black"
  elseif prob >= 10 and prob < 20 then
    color = "pmbTraceRed"
  elseif prob >= 20 and prob < 30 then
    color = "pmbTraceYellow"
  else
    color = "pmbTraceGreen"
  end
  return "ultra thick, " .. color
end

local function findBasesInStr(target)
  if not target then return end
  local result = {}
  for _, v in ipairs(ALL_BASES) do
    if target:upper():find(v) then
      table.insert(result, v)
    end
  end
  return result
end

local function readInt(file, n, offset)
  if offset then file:seek("set", offset) end
  local result = 0
  for i = 1, n do
    result = result * 0x100 + file:read(1):byte()
  end
  return result
end

Chromatogram = {}

function Chromatogram:new()
  newChromatogram = {
    sampleMin = 1,
    sampleMax = 500,
    sampleStep = 1,
    peakMin = -1,
    peakMax = -1,
    xUnit = stringToDim("0.2mm"),
    yUnit = stringToDim("0.01mm"),
    samplesPerLine = 500,
    baselineSkip = stringToDim("3cm"),
    canvasHeight = stringToDim("2cm"),
    traceStyle = {
      A = PGFKEYS_PATH .. "trace A style",
      C = PGFKEYS_PATH .. "trace C style",
      G = PGFKEYS_PATH .. "trace G style",
      T = PGFKEYS_PATH .. "trace T style"
    },
    tickStyle = {
      A = PGFKEYS_PATH .. "tick A style",
      C = PGFKEYS_PATH .. "tick C style",
      G = PGFKEYS_PATH .. "tick G style",
      T = PGFKEYS_PATH .. "tick T style"
    },
    tickLength = stringToDim("1mm"),
    baseLabelText = {
      A = "\\pgfkeysvalueof{" .. PGFKEYS_PATH .. "base label A text}",
      C = "\\pgfkeysvalueof{" .. PGFKEYS_PATH .. "base label C text}",
      G = "\\pgfkeysvalueof{" .. PGFKEYS_PATH .. "base label G text}",
      T = "\\pgfkeysvalueof{" .. PGFKEYS_PATH .. "base label T text}"
    },
    baseLabelStyle = {
      A = PGFKEYS_PATH .. "base label A style",
      C = PGFKEYS_PATH .. "base label C style",
      G = PGFKEYS_PATH .. "base label G style",
      T = PGFKEYS_PATH .. "base label T style"
    },
    showBaseNumbers = true,
    baseNumberMin = -1,
    baseNumberMax = -1,
    baseNumberStep = 10,
    probDistance = stringToDim("0.8cm"),
    probStyle = stdProbStyle,
    tracesDrawn = ALL_BASES,
    ticksDrawn = "ACGT",
    baseLabelsDrawn = "ACGT",
    probabilitiesDrawn = "ACGT",
  }
  setmetatable(newChromatogram, self)
  self.__index = self
  return newChromatogram
end

function Chromatogram:getMinMaxProbability()
  local minProb = 0
  local maxProb = 0
  for _, currPeak in ipairs(self.selectedPeaks) do
    for __, currProb in pairs(currPeak.prob) do
      if currProb > maxProb then maxProb = currProb end
      if currProb < minProb then minProb = currProb end
    end
  end
  return minProb, maxProb
end

function Chromatogram:getSampleAndPeakIndex(baseIndex, isLowerLimit)
  local sampleId, peakId

  sampleId = tonumber(baseIndex)
  if sampleId then
    for i, v in ipairs(self.peaks) do
      if isLowerLimit then
        if v.offset >= sampleId then
          peakId = i
          break
        end
      else
        if v.offset == sampleId then
          peakId = i
          break
        elseif v.offset > sampleId then
          peakId = i - 1
          break
        end
      end
    end
  else
    peakId = tonumber(baseIndex:match("base%s*(%d+)"))
    if peakId then
      sampleId = self.peaks[peakId].offset
    end
  end
  return sampleId, peakId
end

function Chromatogram:readScfFile(filename)
  if filename ~= self.lastScfFile then
    self.lastScfFile = filename
    local scfFile, errorMsg = io.open(filename, "rb")
    if not scfFile then packageError(errorMsg) end

    self.samples = {A = {}, C = {}, G = {}, T = {}}
    self.peaks = {}
    self.header = {
      magicNumber = readInt(scfFile, 4, 0),
      samplesNumber = readInt(scfFile, 4),
      samplesOffset = readInt(scfFile, 4),
      basesNumber = readInt(scfFile, 4),
      leftClip = readInt(scfFile, 4),
      rightClip = readInt(scfFile, 4),
      basesOffset = readInt(scfFile, 4),
      comments = readInt(scfFile, 4),
      commentsOffset = readInt(scfFile, 4),
      version = readInt(scfFile, 4),
      sampleSize = readInt(scfFile, 4),
      codeSet = readInt(scfFile, 4),
      privateSize = readInt(scfFile, 4),
      privateOffset = readInt(scfFile, 4)
    }
    if self.header.magicNumber ~= 0x2E736366 then
      packageError(
        "Magic number in scf scfFile '" ..
        self.lastScfFile ..
        "' corrupt!"
      )
    end
    if self.header.version ~= 0x332E3030 then
      packageError(
        "Scf scfFile '" ..
        self.lastScfFile ..
        "' is not version 3.00!"
      )
    end
    scfFile:seek("set", self.header.samplesOffset)
    for baseIndex, baseName in ipairs(ALL_BASES) do
      for i = 1, self.header.samplesNumber do
        self.samples[baseName][i] =
          readInt(scfFile, self.header.sampleSize)
      end

      for _ = 1, 2 do
        local preValue = 0
        for i = 1, self.header.samplesNumber do
          self.samples[baseName][i] = self.samples[baseName][i] + preValue
          if self.samples[baseName][i] > 0xFFFF then
            self.samples[baseName][i] = self.samples[baseName][i] - 0x10000
          end
          preValue = self.samples[baseName][i]
        end
      end
    end
    for i = 1, self.header.basesNumber do
      self.peaks[i] = {
        offset = readInt(scfFile, 4),
        prob = {A, C, G, T},
        base
      }
    end

    for i = 1, self.header.basesNumber do
      self.peaks[i].prob.A = readInt(scfFile, 1)
    end

    for i = 1, self.header.basesNumber do
      self.peaks[i].prob.C = readInt(scfFile, 1)
    end

    for i = 1, self.header.basesNumber do
      self.peaks[i].prob.G = readInt(scfFile, 1)
    end

    for i = 1, self.header.basesNumber do
      self.peaks[i].prob.T = readInt(scfFile, 1)
    end

    for i = 1, self.header.basesNumber do
      self.peaks[i].base = string.char(readInt(scfFile, 1))
    end

    scfFile:close()
  end
end

function Chromatogram:setParameters(newParms)
  local keyHash = {
    sampleRange = function(v)
      local sampleRangeMin, sampleRangeMax, sampleRangeStep =
        getRange(
          v:trim(),
          "^([base]*%s*%d+)%s*%-",
          "%-%s*([base]*%s*%d+)",
          "step%s*(%d+)$"
        )
      self.sampleMin, self.peakMin =
        self:getSampleAndPeakIndex(sampleRangeMin, true)
      self.sampleMax, self.peakMax =
        self:getSampleAndPeakIndex(sampleRangeMax, false)
      if self.sampleMin >= self.sampleMax then
        packageError("Sample range is smaller than 1.")
      end
      self.sampleStep = sampleRangeStep or self.sampleStep
    end,
    xUnit = stringToDim,
    yUnit = stringToDim,
    samplesPerLine = tonumber,
    baselineSkip = stringToDim,
    canvasHeight = stringToDim,
    tickLength = stringToDim,
    showBaseNumbers = function(v)
      if v == "true" then return true else return false end
    end,
    baseNumberRange = function(v)
      local baseNumberRangeMin, baseNumberRangeMax, baseNumberRangeStep =
        getRange(
          v:trim(),
          "^([auto%d]*)%s+%-",
          "%-%s+([auto%d]*$)"
        )
      if tonumber(baseNumberRangeMin) then
        self.baseNumberMin = tonumber(baseNumberRangeMin)
      else
        self.baseNumberMin = self.peakMin
      end
      if tonumber(baseNumberRangeMax) then
        self.baseNumberMax = tonumber(baseNumberRangeMax)
      else
        self.baseNumberMax = self.peakMax
      end
      if self.baseNumberMin >= self.baseNumberMax then
        packageError("Base number range is smaller than 1.")
      end
      if self.baseNumberMin < self.peakMin then
        self.baseNumberMin = self.peakMin
        packageWarning("Lower base number range is smaller than lower sample range. It was adjusted to " .. self.baseNumberMin .. ".")
      end
      if self.baseNumberMax > self.peakMax then
        self.baseNumberMax = self.peakMax
        packageWarning("Upper base number range exceeds upper sample range. It was adjusted to " .. self.baseNumberMax .. ".")
      end
      self.baseNumberStep = tonumber(baseNumberRangeStep)
        or self.baseNumberStep
    end,
    probDistance = stringToDim,
    probStyle = function(v) return v end,
    tracesDrawn = findBasesInStr,
    ticksDrawn = function(v) return v end,
    baseLabelsDrawn = function(v) return v end,
    probabilitiesDrawn = function(v) return v end,
    probStyle = function(v) return v end
  }
  for key, value in pairs(newParms) do
    if keyHash[key] then
      self[key] = keyHash[key](value)
    end
  end
end

function Chromatogram:printTikzChromatogram()
  if pgfmolbio.errorCatched then return end
  self.selectedPeaks = {}
  local tIndex = 1
  for rPeakIndex, currPeak in ipairs(self.peaks) do
    if currPeak.offset >= self.sampleMin
        and currPeak.offset <= self.sampleMax then
      self.selectedPeaks[tIndex] = {
        offset = currPeak.offset + 1 - self.sampleMin,
        base = currPeak.base,
        prob = currPeak.prob,
        baseIndex = rPeakIndex,
        probXRight = self.sampleMax + 1 - self.sampleMin
      }
      if tIndex > 1 then
        self.selectedPeaks[tIndex-1].probXRight =
          (self.selectedPeaks[tIndex-1].offset
          + self.selectedPeaks[tIndex].offset) / 2
      end
      tIndex = tIndex + 1
    end
  end

  if tIndex > 1 then
    if self.baseNumberMin == -1 then
      self.baseNumberMin = self.selectedPeaks[1].baseIndex
    end
    if self.baseNumberMax == -1 then
      self.baseNumberMax = self.selectedPeaks[tIndex-1].baseIndex
    end
  end

  local samplesLeft = self.sampleMax - self.sampleMin + 1
  local currLine = 0
  while samplesLeft > 0 do
    local yLower = -currLine * self.baselineSkip
    local yUpper = -currLine * self.baselineSkip + self.canvasHeight
    local xRight =
      (math.min(self.samplesPerLine, samplesLeft) - 1) * self.xUnit
    tex.sprint(
      "\n\t\\draw [" .. PGFKEYS_PATH .. "canvas style] (" ..
      dimToString(0) ..
      ", " ..
      dimToString(yLower) ..
      ") rectangle (" ..
      dimToString(xRight) ..
      ", " ..
      dimToString(yUpper) ..
      ");"
    )
    samplesLeft = samplesLeft - self.samplesPerLine
    currLine = currLine + 1
  end

  for _, baseName in ipairs(self.tracesDrawn) do
    tex.sprint("\n\t\\draw [" .. self.traceStyle[baseName] .. "] ")
    local currSampleIndex = self.sampleMin
    local sampleX = 1
    local x = 0
    local y = 0
    local currLine = 0
    local firstPointInLine = true

    while currSampleIndex <= self.sampleMax do
      x = ((sampleX - 1) % self.samplesPerLine) * self.xUnit
      y = self.samples[baseName][currSampleIndex] * self.yUnit
        - currLine * self.baselineSkip
      if sampleX % self.sampleStep == 0 then
        if not firstPointInLine then
          tex.sprint(" -- ")
        else
          firstPointInLine = false
        end
        tex.sprint(
          "(" ..
          dimToString(x) ..
          ", " ..
          dimToString(y) ..
          ")"
        )
      end
      if sampleX ~= self.sampleMax + 1 - self.sampleMin then
        if sampleX >= (currLine + 1) * self.samplesPerLine then
          currLine = currLine + 1
          tex.sprint(";\n\t\\draw [" .. self.traceStyle[baseName] .. "] ")
          firstPointInLine = true
        end
      else
        tex.sprint(";")
      end
    sampleX = sampleX + 1
    currSampleIndex = currSampleIndex + 1
    end
  end

  local currLine = 0
  local lastProbX = 1
  local probRemainder = false

  for _, currPeak in ipairs(self.selectedPeaks) do
    while currPeak.offset > (currLine + 1) * self.samplesPerLine do
      currLine = currLine + 1
    end

    local x = ((currPeak.offset - 1) % self.samplesPerLine) * self.xUnit
    local yUpper = -currLine * self.baselineSkip
    local yLower = -currLine * self.baselineSkip - self.tickLength
    local tickOperation = ""
    if self.ticksDrawn:upper():find(currPeak.base) then
      tickOperation = "--"
    end

    tex.sprint(
      "\n\t\\draw [" ..
      self.tickStyle[currPeak.base] ..
      "] (" ..
      dimToString(x) ..
      ", " ..
      dimToString(yUpper) ..
      ") " ..
      tickOperation ..
      " (" ..
      dimToString(x) ..
      ", " ..
      dimToString(yLower) ..
      ")"
    )
    if self.baseLabelsDrawn:upper():find(currPeak.base) then
      tex.sprint(
        " node [" ..
        self.baseLabelStyle[currPeak.base] ..
        "] {" ..
        self.baseLabelText[currPeak.base] ..
        "}"
      )
    end

    if self.showBaseNumbers
        and currPeak.baseIndex >= self.baseNumberMin
        and currPeak.baseIndex <= self.baseNumberMax
        and (currPeak.baseIndex - self.baseNumberMin)
          % self.baseNumberStep == 0 then
      tex.sprint(
        " node [" ..
        PGFKEYS_PATH ..
        "base number style] {\\strut " ..
        currPeak.baseIndex ..
        "}"
      )
    end
    tex.sprint(";")

    if probRemainder then
      tex.sprint(probRemainder)
      probRemainder = false
    end
    local drawCurrProb =
      self.probabilitiesDrawn:upper():find(currPeak.base)
    local xLeft = lastProbX - 1 - currLine * self.samplesPerLine
    if xLeft < 0 then
      local xLeftPrev = (self.samplesPerLine + xLeft) * self.xUnit
      local xRightPrev = (self.samplesPerLine - 1) * self.xUnit
      local yPrev = -(currLine-1) * self.baselineSkip - self.probDistance
      if drawCurrProb then
        tex.sprint(
          "\n\t\\draw [" ..
          self.probStyle(currPeak.prob[currPeak.base]) ..
          "] (" ..
          dimToString(xLeftPrev) ..
          ", " ..
          dimToString(yPrev) ..
          ") -- (" ..
          dimToString(xRightPrev) ..
          ", " ..
          dimToString(yPrev) ..
          ");"
        )
      end
      xLeft = 0
    else
      xLeft = xLeft * self.xUnit
    end

    local xRight = currPeak.probXRight - 1 - currLine * self.samplesPerLine
    if xRight >= self.samplesPerLine then
      if drawCurrProb then
        local xRightNext = (xRight - self.samplesPerLine) * self.xUnit
        local yNext = -(currLine+1) * self.baselineSkip - self.probDistance
        probRemainder =
          "\n\t\\draw [" ..
          self.probStyle(currPeak.prob[currPeak.base]) ..
          "] (" ..
          dimToString(0) ..
          ", " ..
          dimToString(yNext) ..
          ") -- (" ..
          dimToString(xRightNext) ..
          ", " ..
          dimToString(yNext) ..
          ");"
      end
      xRight = (self.samplesPerLine - 1) * self.xUnit
    else
      xRight = xRight * self.xUnit
    end

    local y = -currLine * self.baselineSkip - self.probDistance
    if drawCurrProb then
      tex.sprint(
        "\n\t\\draw [" ..
        self.probStyle(currPeak.prob[currPeak.base]) ..
        "] (" ..
        dimToString(xLeft) ..
        ", " ..
        dimToString(y) ..
        ") -- (" ..
        dimToString(xRight) ..
        ", " ..
        dimToString(y) ..
        ");"
      )
    end
    lastProbX = currPeak.probXRight
  end
end
--
-- End of file `pgfmolbio.chromatogram.lua'.
