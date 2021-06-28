require "luaprogtable-parse.lua"
require "luaprogtable-stringbuffer.lua"

TeXTable = {}
TeXTable.__index = TeXTable

function TeXTable:new()
    local ret = {
        rows = {}
    }
    setmetatable(ret, TeXTable)
    return ret
end

TeXTableCell = {}
TeXTableCell.__index = TeXTableCell

local _std_shape = {1, 1}

function TeXTableCell:new(default_val)
    local ret = {
        data=default_val,
        shape=_std_shape,
        parent=nil
    }
    setmetatable(ret, TeXTableCell)
    return ret
end


TeXTableRow = {}
TeXTableRow.__index = TeXTableRow

function TeXTableRow:new(tex_table)
    
    local ncols = tex_table.ncols
    local default_val = rawget(tex_table, "default value")

    local cells = {}

    for i=1,ncols do
        table.insert(cells, TeXTableCell:new(default_val))
    end

    local ret = {
        ["before line"] = "",
        ["after line"] = rawget(tex_table, "default after line"),
        ["after spacing"] = rawget(tex_table, "default after spacing"),
        ["cells"] = cells
    }

    setmetatable(ret, TeXTableRow)
    return ret
end


function TeXTable:resize(nrows, ncols)
    local now_nrows = #self.rows
    local now_ncols = self.ncols

    if nrows < now_nrows or ncols < now_ncols then
        raise_error("'TeXTable:resize' doesn not support table truncation")
    end

    local nrows_delta = nrows - now_nrows
    local ncols_delta = ncols - now_ncols

    -- change column for existing rows
    self.ncols = ncols
    for i=1,now_nrows do
        local row = self.rows[i]
        for j=1,ncols_delta do
            table.insert(row.cells, TeXTableCell:new(rawget(self, "default value")))
        end
    end

    -- add new rows
    for i=1,nrows_delta do
        table.insert(self.rows, TeXTableRow:new(self))
    end
end

function TeXTable:to_string(no_linebreak)
    local ret = {}
    local no_linebreak = no_linebreak or false
    local lb = "\n"
    if no_linebreak then
        lb = " "
    end

    table.insert(ret, string.format([[\begin{%s}{%s}]], self.backend, rawget(self, "table preamble")))
    
    local nrows = #self.rows
    for i=1,nrows do

        local row = self.rows[i]

        local cell_data = {}
        local j = 1

        while j <= self.ncols do
            local cell = row.cells[j]

            local next_j = nil

            if cell.shape ~= nil then
                table.insert(cell_data, cell.data)
                next_j = j + cell.shape[2]
            else
                local parent_row = cell.parent[1]
                local parent_col = cell.parent[2]
                local parent_cell = self:get_cell(parent_row, parent_col)
                table.insert(cell_data, "")
                next_j = j + parent_cell.shape[2]
            end

            j = next_j
        end

        local row_str = ""

        if string.len(rawget(row, "before line")) > 0 then
            row_str = rawget(row, "before line") .. lb .. row_str
        end

        row_str = row_str .. table.concat(cell_data, " & ") .. [[ \\]] 

        if string.len(rawget(row, "after spacing")) > 0 then
            row_str = row_str .. "[" .. rawget(row, "after spacing") .. "]"
        end

        row_str = row_str .. rawget(row, "after line")
        
        table.insert(ret, row_str)
    end

    table.insert(ret, string.format([[\end{%s}]], self.backend))

    return table.concat(ret, lb)

end


function TeXTable:get_cell(row_id, cell_id)
    local row = self.rows[row_id]
    if row == nil then
        raise_error(string.format("row id '%d' is invalid for table '%s'", row_id, rawget(self, "table name")))
    end
    local cell = row.cells[cell_id]
    if cell == nil then
        raise_error(string.format("cell location '(%d,%d)' is invalid for table '%s'", row_id, cell_id, rawget(self, "table name")))
    end
    return cell
end

function TeXTable:set_cell(row_id, cell_id, data, shape)
    local cell = self:get_cell(row_id, cell_id)

    -- check if we can modify this cell
    if cell.parent ~= nil then
        local parent_1 = cell.parent[1]
        local parent_2 = cell.parent[2]
        raise_error(string.format("cell location '(%d,%d)' of table '%s' is not acceesible because it is overlapped by cell '(%d,%d)'", row_id, cell_id, rawget(self, "table name"), parent_1, parent_2))
    end

    
    -- check cell boundary
    local max_row = row_id + shape[1] - 1
    local max_col = cell_id + shape[2] - 1
    if max_row > #self.rows or max_col > self.ncols then
        raise_error(string.format("cell '(%d,%d)' is too large for table '%s'", row_id, col_id, rawget(self, "table name")))
    end


    local old_shape = cell.shape

    local std_shape = {1, 1}
    -- clear control info for children
    for i=1, old_shape[1] do
        local row_id = row_id + i - 1
        for j = 1, old_shape[2] do
            local col_id = cell_id + j - 1
            local other_cell = self:get_cell(row_id, col_id)
            other_cell.parent = nil
            other_cell.shape = std_shape
        end
    end

    local parent_t = {row_id, cell_id}
    -- adjust control info based on new shape
    for i=1, shape[1] do
        local row_id = row_id + i - 1
        for j = 1, shape[2] do
            local col_id = cell_id + j - 1
            local other_cell = self:get_cell(row_id, col_id)
            other_cell.parent = parent_t
            other_cell.shape = nil
        end
    end

    -- adjust control info for this cell
    cell.parent = nil
    cell.shape = shape
    cell.data = data
end

function TeXTable:fill(data)
    local nrows = #self.rows
    for i=1,nrows do
        for j=1,self.ncols do
            local cell = self:get_cell(i, j)
            cell.shape = _std_shape
            cell.parent = nil
            cell.data = data
        end
    end
end

function TeXTable:fix_row_index(index_pair)
    local ret = {index_pair[1], index_pair[2]}

    if ret[1] < 0 then
        ret[1] = #self.rows + ret[1] + 1
    end
    if ret[2] < 0  then
        ret[2] = #self.rows + ret[2] + 1
    end

    if ret[2] < ret[1] then
        raise_error("invalid index expression: second element must not be smaller than the first")
    end

    if ret[1] <= 0 then
        raise_error("invalid index expression: index must be greater than zero after conversion")
    end

    return ret
end

function TeXTable:fix_col_index(index_pair)
    local ret = {index_pair[1], index_pair[2]}

    if ret[1] < 0 then
        ret[1] = self.ncols + ret[1] + 1
    end
    if ret[2] < 0  then
        ret[2] = self.ncols + ret[2] + 1
    end

    if ret[2] < ret[1] then
        raise_error("invalid index expression: second element must not be smaller than the first")
    end

    if ret[1] <= 0 then
        raise_error("invalid index expression: index must be greater than zero after conversion")
    end

    return ret
end

-- fix the index of a single cell
function TeXTable:fix_cell_index(index_expr)
    local the_table = self
    local index_parse = _lpt_parse_index_expr(index_expr)
    if #index_parse ~= 2 then
        raise_error(string.format("invalid index expression for cell: '%s'", index_expr))
    end

    local row_expr = the_table:fix_row_index(index_parse[1])
    local col_expr = the_table:fix_col_index(index_parse[2])

    if row_expr[1] ~= row_expr[2] then
        raise_error(string.format("invalid row index expression for cell: '%s'", index_expr))
    end
    if col_expr[1] ~= col_expr[2] then
        raise_error(string.format("invalid column index expression for cell: '%s'", index_expr))
    end

    return {row_expr[1], col_expr[1]}
end

-- make sure table views do not cut through multicol/multirow
function TeXTable:check_view_validity(start_row, start_col, row_span, col_span)
    local max_row = start_row + row_span - 1
    local max_col = start_col + col_span - 1

    for i = 1, row_span do
        local row_id = start_row + i - 1
        for j=1,col_span do
            local col_id = start_col + j - 1
            local cell = self:get_cell(row_id, col_id)
            if cell.shape ~= nil then
                local boundary_1 = row_id + cell.shape[1] - 1
                local boundary_2 = col_id + cell.shape[2] - 1
                if boundary_1 > max_row or boundary_2 > max_col then
                    raise_error(string.format("invalid table view: cell '(%d, %d)' has shape '(%d, %d)', which does not fit into viewed region", row_id, col_id, cell.shape[1], cell.shape[2]))
                end
            end
        end
    end
end


lpt_info = {}

function _lpt_get_table(table_name)
    local table_name = _lpt_strip(table_name)
    local the_table = lpt_info[table_name]
    if the_table == nil then
        raise_error(string.format("table '%s' does not exist", table_name))
    end
    return the_table
end


_verb_lines = {}
_verb_end_env = ""

function _lpt_store_verbatim_lines(str)
    if string.find(str , _verb_end_env) then
        luatexbase.remove_from_callback("process_input_buffer" , "lpt_store_verbatim_lines")
        return _verb_end_env
    else
        if str ~= nil then
            table.insert(_verb_lines, str)
        end
        return ""
    end
end

function _lpt_register_verbatim(end_env)
    for k in next, _verb_lines do rawset(_verb_lines, k, nil) end
    _verb_end_env = end_env
    luatexbase.add_to_callback("process_input_buffer", _lpt_store_verbatim_lines, "lpt_store_verbatim_lines")
end

local _lpt_ignored_fields = {nrows=true}
local _lpt_numeric_fields = {ncols=true}



function lpt_new_table(param)
    local new_table = TeXTable:new()

    for key, val in pairs(param) do
        if _lpt_numeric_fields[key] then
            rawset(new_table, key, _lpt_tonumber(val))
        elseif _lpt_ignored_fields[key] then
            -- do nothing
        else
            rawset(new_table, key, val)
        end
    end

    local table_name = new_table["table name"]

    local table_fetch = lpt_info[table_name]
    if table_fetch ~= nil then
        raise_error(string.format("table '%s' already exists", table_name))
    end

    local nrows = _lpt_tonumber(param["nrows"])

    -- integrity check
    if nrows < 0 then
        raise_error(string.format("'nrows' (%d) of table '%s' is invalid", nrows, table_name))
    end
    if new_table.ncols <= 0 then
        raise_error(string.format("'ncols' (%d) of table '%s' is invalid", new_table.ncols, table_name))
    end
    
    -- create table
    new_table:resize(nrows, new_table.ncols)

    lpt_info[table_name] = new_table
end

function lpt_table_fill(table_name, index_expr, env_content)
    local the_table = _lpt_get_table(table_name)
    local env_content = env_content or table.concat(_verb_lines, " ")

    if index_expr:len() == 0 then
        the_table:fill(env_content)
    else
        local index_parse = _lpt_parse_index_expr(index_expr)
        if #index_parse ~= 2 then
            raise_error(string.format("invalid index expr '%s' for table '%s'", index_expr, table_name))
        end

        local row_expr = the_table:fix_row_index(index_parse[1])
        local col_expr = the_table:fix_col_index(index_parse[2])

        local row_span = row_expr[2] - row_expr[1] + 1
        local col_span = col_expr[2] - col_expr[1] + 1

        the_table:check_view_validity(row_expr[1], col_expr[1], row_span, col_span)

        for i=1,row_span do
            local row_id = i + row_expr[1] - 1
            for j=1,col_span do
                local col_id = j + col_expr[1] - 1
                the_table:set_cell(row_id, col_id, env_content, _std_shape)
            end
        end
    end
end


function lpt_table_view(table_name, index_expr)
    local env_content = table.concat(_verb_lines, "\n")
    local the_table = _lpt_get_table(table_name)

    local index_parse = _lpt_parse_index_expr(index_expr)
    if #index_parse ~= 2 then
        raise_error(string.format("invalid index expr '%s' for table '%s'", index_expr, table_name))
    end

    local row_expr = the_table:fix_row_index(index_parse[1])
    local col_expr = the_table:fix_col_index(index_parse[2])

    local row_span = row_expr[2] - row_expr[1] + 1
    local col_span = col_expr[2] - col_expr[1] + 1

    the_table:check_view_validity(row_expr[1], col_expr[1], row_span, col_span)

    local parsed_table = _lpt_parse_table_view(env_content)

    if #parsed_table ~= row_span then
        raise_error(string.format("lpttableview: expecting '%d' rows, but get '%d' instead for table '%s'", row_span, #parsed_table, table_name))
    end

    for i=1,row_span do
        local row_id = i + row_expr[1] - 1
        local cols = parsed_table[i]

        -- sum the number of total columns in this row
        local n_table_cols = 0
        local max_row_size = 0
        for _, val in ipairs(cols) do
            n_table_cols = n_table_cols + val["shape"][2]
            max_row_size = math.max(max_row_size, val["shape"][1])
        end

        local max_row = row_id + max_row_size - 1
        if max_row > row_expr[2] then
            raise_error("lpttableview: the height of table is greater than table view")
        end


        -- count the numbers of columns needs to be filled in this row
        local pending_table_cols = 0
        for j=1,col_span do
            local col_id = j + col_expr[1] - 1
            local cell = the_table:get_cell(row_id, col_id)
            if cell.shape ~= nil then
                pending_table_cols = pending_table_cols + 1
            else
                local parent_row = cell.parent[1]
                -- if the parent is in the same row,
                -- then this space needs to be filled in the same row
                if parent_row == row_id then
                    pending_table_cols = pending_table_cols + 1
                end
            end
        end

        if n_table_cols ~= pending_table_cols then
            raise_error(string.format("lpttableview: expecting '%d' cols for row '%d', but get '%d' instead for table '%s'", pending_table_cols, i, n_table_cols, table_name))
        end
        

        --[[
        if n_table_cols ~= col_span then
            raise_error(string.format("lpttableview: expecting '%d' cols for row '%d', but get '%d' instead for table '%s'", col_span, i, n_table_cols, table_name))
        end
        --]]

        local k = 1
        for j=1,col_span do
            local col_id = j + col_expr[1] - 1
            local cell = the_table:get_cell(row_id, col_id)
            if cell.shape ~= nil then
                local col_data = cols[k]["data"]
                local col_shape = cols[k]["shape"]
                the_table:set_cell(row_id, col_id, col_data, col_shape)
                k = k + 1
            end
        end
        
    end


end

local _s_buf = TeXStringBuffer:new()

function lpt_use_table(table_name)
    local the_table = _lpt_get_table(table_name)
    local input_method = rawget(the_table, "input method")
    
    if input_method == "stringbuffer" then
        local table_str = the_table:to_string(true)
        _s_buf:clear()
        _s_buf:append(table_str)
        _s_buf:register_callback()
        tex.print([[\input{stringbuffer}]])
    elseif input_method == "file" then
        local table_str = the_table:to_string()
        local filename = tex.jobname .. "-" .. table_name .. ".table"
        local outfile = io.open(filename, "w")
        outfile:write(table_str)
        outfile:close()
        tex.print(string.format([[\input{%s}]], filename))
    else
        raise_error(string.format("invalid input method '%s' for table '%s'", input_method, table_name))
    end

end

function lpt_set_row_prop(table_name, index_expr, param)

    local the_table = _lpt_get_table(table_name)
    local index_parse = _lpt_parse_index_expr(index_expr)
    for key, val in ipairs(index_parse) do
        local fixed_val = the_table:fix_row_index(val)

        local l = fixed_val[1]
        local r = fixed_val[2]

        for i=l,r do
            local row = the_table.rows[i]
            if row == nil then
                raise_error(string.format("lpt_set_row_prop: invalid index expression '%s'", index_expr))
            end
            for kkey, vval in pairs(param) do
                if rawget(row, kkey) == nil then
                    raise_error(string.format("row '%d' of table '%s' does not have attribute '%s'", i, table_name, kkey))
                end
                rawset(row, kkey, vval)
            end
        end
    end
end


function lpt_add_row(table_name, param)
    local the_table = _lpt_get_table(table_name)
    local nrows =  #the_table.rows
    local ncols = the_table.ncols
    the_table:resize(nrows+1, ncols)
    lpt_set_row_prop(table_name, "-1", param)
end

function lpt_get_table_shape(table_name)
    local the_table = _lpt_get_table(table_name)
    local nrows = #the_table.rows
    local ncols = the_table.ncols
    tex.print(string.format("{%d}{%d}", nrows, ncols))
end