if not modules then modules = { } end modules ['strc-blk'] = {
    version   = 1.001,
    comment   = "companion to strc-blk.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- this one runs on top of buffers and structure

local type = type
local gmatch, find = string.gmatch, string.find
local lpegmatch = lpeg.match
local settings_to_set, settings_to_array = utilities.parsers.settings_to_set, utilities.parsers.settings_to_array
local allocate, mark = utilities.storage.allocate, utilities.storage.mark

local structures, context = structures, context

structures.blocks = structures.blocks or { }

local blocks      = structures.blocks
local sections    = structures.sections
local lists       = structures.lists

local collected   = allocate()
local tobesaved   = allocate()
local states      = allocate()

blocks.collected  = collected
blocks.tobesaved  = tobesaved
blocks.states     = states

local function initializer()
    collected = blocks.collected
    tobesaved = blocks.tobesaved
end

job.register('structures.blocks.collected', tobesaved, initializer)

local printer  = (lpeg.patterns.textline/tex.print)^0 -- can be shared
local listitem = utilities.parsers.listitem

function blocks.print(name,data,hide)
    if hide then
        context.dostarthiddenblock(name)
    else
        context.dostartnormalblock(name)
    end
    context.viafile(data)
    if hide then
        context.dostophiddenblock()
    else
        context.dostopnormalblock()
    end
end

function blocks.define(name)
    states[name] = { all = "hide" }
end

function blocks.setstate(state,name,tag)
    local all = tag == ""
    local tags = not all and settings_to_array(tag)
    for n in listitem(name) do
        local sn = states[n]
        if not sn then
            -- error
        elseif all then
            sn.all = state
        else
            for _, tag in next, tags do
                sn[tag] = state
            end
        end
    end
end

function blocks.select(state,name,tag,criterium)
    criterium = criterium or "text"
    if find(tag,"=") then tag = "" end
    local names = settings_to_set(name)
    local all = tag == ""
    local tags = not all and settings_to_set(tag)
    local hide = state == "process"
    local n = sections.numberatdepth(criterium)
    local result = lists.filtercollected("all", criterium, n, collected, { })
    for i=1,#result do
        local ri = result[i]
        local metadata = ri.metadata
        if names[metadata.name] then
            if all then
                blocks.print(name,ri.data,hide)
            else
                local mtags = metadata.tags
                for tag, sta in next, tags do
                    if mtags[tag] then
                        blocks.print(name,ri.data,hide)
                        break
                    end
                end
            end
        end
    end
end

function blocks.save(name,tag,buffer) -- wrong, not yet adapted
    local data = buffers.getcontent(buffer)
    local tags = settings_to_set(tag)
    local plus, minus = false, false
    if tags['+'] then plus  = true tags['+'] = nil end
    if tags['-'] then minus = true tags['-'] = nil end
    tobesaved[#tobesaved+1] = {
        metadata = {
            name = name,
            tags = tags,
            plus = plus,
            minus = minus,
        },
        references = {
            section  = sections.currentid(),
        },
        data = data or "error",
    }
    local allstate = states[name].all
    if not next(tags) then
        if allstate ~= "hide" then
            blocks.print(name,data)
        elseif plus then
            blocks.print(name,data,true)
        end
    else
        local sn = states[name]
        for tag, _ in next, tags do
            if sn[tag] == nil then
                if allstate ~= "hide" then
                    blocks.print(name,data)
                    break
                end
            elseif sn[tag] ~= "hide" then
                blocks.print(name,data)
                break
            end
        end
    end
    buffers.erase(buffer)
end
