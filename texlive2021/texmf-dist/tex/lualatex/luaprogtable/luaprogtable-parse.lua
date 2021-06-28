require "luaprogtable-utility.lua"

local _std_shape = {1, 1}

function _lpt_parse_new_cell()
    local cur_cell = {data={}, shape=_std_shape}
    return cur_cell
end

function _lpt_parse_table_view(str)
    local str = _lpt_strip(str)

    local level = 0
    local pos = 1

    local cur_cell = nil
    local cur_row = {}
    local ret = {cur_row}

    function _add_str(s)
        if level > 0 then
            table.insert(cur_cell["data"], s)
        end
    end

    while pos <= str:len() do
        local chr = str:sub(pos, pos)
        local next_pos = pos + 1

        if chr == "\\" then
            local next_chr = str:sub(pos + 1, pos + 1)
            if next_chr == nil then
                -- do nothing
            elseif next_chr == "\\" then
                if level == 0 then
                    cur_row = {}
                    -- change of row
                    table.insert(ret, cur_row)
                end
            elseif next_chr == "{"  or next_chr == "}" then
                next_pos = pos + 2
                _add_str(str:sub(pos, pos + 1))
            else
                _add_str(chr)
            end
        elseif chr == "{" then
            if level == 0 then
                cur_cell = _lpt_parse_new_cell()
            else
                _add_str(chr)
            end
            level = level + 1
        elseif chr == "}" then
            level = level - 1
            if level < 0 then
                raise_error("extra '}' found when parsing table view expression")
            elseif level == 0 then
                local data_str = table.concat(cur_cell["data"], "")
                cur_cell["data"] = data_str
                table.insert(cur_row, cur_cell)
                cur_cell = nil
            else
                _add_str(chr)
            end
        elseif chr == "[" then
            if level == 0 then
                local close = string.find(str, "]", pos + 1)

                if close == nil then
                    raise_error("unable to find closing ']'")
                end

                local size_str = str:sub(pos + 1, close - 1)
                size_str = _lpt_strip(size_str)
                
                local size_1 = size_str:sub(1, 1)
                local shape = nil

                if size_1 == "|" then
                    local nrow = _lpt_tonumber(size_str:sub(2))
                    shape = {nrow, 1}
                elseif size_1 == "-" then
                    local ncol = _lpt_tonumber(size_str:sub(2))
                    shape = {1, ncol}
                else
                    raise_error(string.format("invalid size '[%s]' in table view, size_str", size_str))
                end

                if shape[1] < 1 or shape[2] < 1 then
                    raise_error(string.format("invalid size '[%s]' in table view, size_str", size_str))
                end

                local n_cell = #cur_row
                local cell = cur_row[n_cell]
                if cell == nil then
                    raise_error(string.format("no suitable cell for size [%s]", size_str))
                end
                cell["shape"] = shape

                pos = close + 1
            else
                _add_str(chr)
            end
        else
            _add_str(chr)
        end

        pos = next_pos
    end

    if level ~= 0 then
        raise_error("extra '{' found when parsing table view expression")
    end

    return ret
end