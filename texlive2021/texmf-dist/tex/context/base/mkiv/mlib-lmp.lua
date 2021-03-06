if not modules then modules = { } end modules ['mlib-lmp'] = {
    version   = 1.001,
    comment   = "companion to mlib-ctx.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files",
}

-- path relates stuff ... todo: use a stack (or numeric index to list)

local type = type

local aux       = mp.aux
local mpnumeric = aux.numeric
local mppair    = aux.pair

local p = nil
local n = 0

local function mf_path_reset()
    p = nil
    n = 0
end

local get       = mp.get
local mpgetpath = get.path

local function mf_path_length(name)
    p = mpgetpath(name)
    n = p and #p or 0
    mpnumeric(n)
end

local function mf_path_point(i)
    if i > 0 and i <= n then
        local pi = p[i]
        mppair(pi[1],pi[2])
    end
end

local function mf_path_left(i)
    if i > 0 and i <= n then
        local pi = p[i]
        mppair(pi[5],pi[6])
    end
end

local function mf_path_right(i)
    if i > 0 and i <= n then
        local pn
        if i == 1 then
            pn = p[2] or p[1]
        else
            pn = p[i+1] or p[1]
        end
        mppair(pn[3],pn[4])
    end
end

mp.mf_path_length = mf_path_length   mp.pathlength = mf_path_length
mp.mf_path_point  = mf_path_point    mp.pathpoint  = mf_path_point
mp.mf_path_left   = mf_path_left     mp.pathleft   = mf_path_left
mp.mf_path_right  = mf_path_right    mp.pathright  = mf_path_right
mp.mf_path_reset  = mf_path_reset    mp.pathreset  = mf_path_reset

