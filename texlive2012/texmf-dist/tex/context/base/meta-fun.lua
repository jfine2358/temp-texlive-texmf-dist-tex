if not modules then modules = { } end modules ['meta-fun'] = {
    version   = 1.001,
    comment   = "companion to meta-fun.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files",
}

-- very experimental, actually a joke ... see metafun manual for usage

local format, loadstring, type = string.format, loadstring, type

local metapost = metapost

metapost.metafun = metapost.metafun or { }
local metafun    = metapost.metafun

function metafun.topath(t,connector)
    context("(")
    if #t > 0 then
        for i=1,#t do
            if i > 1 then
                context(connector or "..")
            end
            local ti = t[i]
            if type(ti) == "string" then
                context(ti)
            else
                context("(%s,%s)",ti.x or ti[1] or 0,ti.y or ti[2] or 0)
            end
        end
    else
        context("origin")
    end
    context(")")
end

function metafun.interpolate(f,b,e,s,c)
    local done = false
    context("(")
    for i=b,e,(e-b)/s do
        local d = loadstring(format("return function(x) return %s end",f))
        if d then
            d = d()
            if done then
                context(c or "...")
            else
                done = true
            end
            context("(%s,%s)",i,d(i))
        end
    end
    if not done then
        context("origin")
    end
    context(")")
end
