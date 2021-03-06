if not modules then modules = { } end modules ['util.deb'] = {
    version   = 1.001,
    comment   = "companion to luat-lib.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- the <anonymous> tag is kind of generic and used for functions that are not
-- bound to a variable, like node.new, node.copy etc (contrary to for instance
-- node.has_attribute which is bound to a has_attribute local variable in mkiv)

local debug = require "debug"

local getinfo = debug.getinfo
local type, next, tostring = type, next, tostring
local format, find = string.format, string.find
local is_boolean = string.is_boolean

utilities          = utilities or { }
utilities.debugger = utilities.debugger or { }
local debugger     = utilities.debugger

local counters = { }
local names    = { }

-- one

local function hook()
    local f = getinfo(2) -- "nS"
    if f then
        local n = "unknown"
        if f.what == "C" then
            n = f.name or '<anonymous>'
            if not names[n] then
                names[n] = format("%42s",n)
            end
        else
            -- source short_src linedefined what name namewhat nups func
            n = f.name or f.namewhat or f.what
            if not n or n == "" then
                n = "?"
            end
            if not names[n] then
                names[n] = format("%42s : % 5i : %s",n,f.linedefined or 0,f.short_src or "unknown source")
            end
        end
        counters[n] = (counters[n] or 0) + 1
    end
end

function debugger.showstats(printer,threshold) -- hm, something has changed, rubish now
    printer   = printer or texio.write or print
    threshold = threshold or 0
    local total, grandtotal, functions = 0, 0, 0
    local dataset = { }
    for name, count in next, counters do
        dataset[#dataset+1] = { name, count }
    end
    table.sort(dataset,function(a,b) return a[2] == b[2] and b[1] > a[1] or a[2] > b[2] end)
    for i=1,#dataset do
        local d = dataset[i]
        local name  = d[1]
        local count = d[2]
        if count > threshold and not find(name,"for generator") then -- move up
            printer(format("%8i  %s\n", count, names[name]))
            total = total + count
        end
        grandtotal = grandtotal + count
        functions = functions + 1
    end
    printer("\n")
    printer(format("functions  : % 10i\n", functions))
    printer(format("total      : % 10i\n", total))
    printer(format("grand total: % 10i\n", grandtotal))
    printer(format("threshold  : % 10i\n", threshold))
end

function debugger.savestats(filename,threshold)
    local f = io.open(filename,'w')
    if f then
        debugger.showstats(function(str) f:write(str) end,threshold)
        f:close()
    end
end

function debugger.enable()
    debug.sethook(hook,"c")
end

function debugger.disable()
    debug.sethook()
--~ counters[debug.getinfo(2,"f").func] = nil
end

--~ debugger.enable()

--~ print(math.sin(1*.5))
--~ print(math.sin(1*.5))
--~ print(math.sin(1*.5))
--~ print(math.sin(1*.5))
--~ print(math.sin(1*.5))

--~ debugger.disable()

--~ print("")
--~ debugger.showstats()
--~ print("")
--~ debugger.showstats(print,3)

local is_node = node and node.is_node
local is_lpeg = lpeg and lpeg.type

function inspect(i) -- global function
    local ti = type(i)
    if ti == "table" then
        table.print(i,"table")
    elseif is_node and is_node(i) then
        table.print(nodes.astable(i),tostring(i))
    elseif is_lpeg and is_lpeg(i) then
        lpeg.print(i)
    else
        print(tostring(i))
    end
end

-- from the lua book:

function traceback()
    local level = 1
    while true do
        local info = debug.getinfo(level, "Sl")
        if not info then
            break
        elseif info.what == "C" then
            print(format("%3i : C function",level))
        else
            print(format("%3i : [%s]:%d",level,info.short_src,info.currentline))
        end
        level = level + 1
    end
end
