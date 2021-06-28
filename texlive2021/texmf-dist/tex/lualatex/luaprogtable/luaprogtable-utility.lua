inspect = require "inspect.lua"

function raise_error(...)
    local arg = {...}
    local description = "a luaprogtable package exception occured:\n" .. table.concat(arg, ", ")
    tex.error(description)
    error(description)
end

local _spacer = lpeg.S(" \t\f\v\n\r")
local _non_spacer = 1 - _spacer
local _stripper = _spacer^0 * lpeg.C((_spacer^0 * _non_spacer^1)^0)


function _lpt_strip(s)
    return s and lpeg.match(_stripper,s) or ""
end

function _lpt_split(s, sep)
  sep = lpeg.P(sep)
  local elem = lpeg.C((1 - sep)^0)
  local p = lpeg.Ct(elem * (sep * elem)^0)   -- make a table capture
  return lpeg.match(p, s)
end


function _lpt_tonumber(s)
    local n = tonumber(s)
    if n == nil then
        raise_error(string.format("'{%s}' is not a valid number expression", s))
    end
    return n
end


function _lpt_parse_index_expr(expr)
    local expr = _lpt_strip(expr)
    local parts = _lpt_split(expr, ",")
    local ret = {}

    for i=1,#parts do
        local subexpr = _lpt_strip(parts[i])

        if subexpr:len() == 0 then
            raise_error(string.format("empty field in index expression '%s'", expr))
        end

        local colon_pos = subexpr:find(":")
        local str_l = ""
        local str_r = ""

        if colon_pos == nil then
            str_l = subexpr
            str_r = subexpr
        else
            local subsubexpr = _lpt_split(subexpr, ":")
            str_l = _lpt_strip(subsubexpr[1])
            str_r = _lpt_strip(subsubexpr[2])
            if str_l:len() == 0 then
                str_l = "1"
            end
            if str_r:len() == 0 then
                str_r = "-1"
            end
        end

        local n_l = _lpt_tonumber(str_l)
        local n_r = _lpt_tonumber(str_r)

        table.insert(ret, {n_l, n_r})
    end

    return ret
end

function _lpt_parse_shape(shape_expr)
    local shape_expr = _lpt_strip(shape_expr)
    local parts = _lpt_split(shape_expr, ",")
    if #parts ~= 2 then
        raise_error(string.format("invalid shape: '%s'", shape_expr))
    end
    local shape1 = _lpt_tonumber(parts[1])
    local shape2 = _lpt_tonumber(parts[2])
    if shape1 < 1 or shape2 < 1 then
        raise_error(string.format("invalid shape: '%s'", shape_expr))
    end
    return {shape1, shape2}
end

function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

function table.find(tbl, item, index)
    for i=index or 1, #tbl do
        local tbl_item = tbl[i]
        if tbl_item == item then
            return i
        end
    end
    return nil
end

