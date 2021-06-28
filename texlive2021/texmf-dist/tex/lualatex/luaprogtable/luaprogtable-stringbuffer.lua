TeXStringBuffer = {content={}, finished=false}

function TeXStringBuffer:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function TeXStringBuffer:clear()
    while #self.content ~= 0 do rawset(self.content, #self.content, nil) end
end

function TeXStringBuffer:content_to_string()
    return table.concat(self.content, "")
end

function TeXStringBuffer:show()
    tex.write(self:content_to_string())
end

function TeXStringBuffer:append(data)
    table.insert(self.content, data)
end

function TeXStringBuffer:append_carriage_return(data)
    self:append("\r")
end

function _tex_buffer_remove_callback(name, description)
    for k, v in pairs(luatexbase.callback_descriptions(name)) do
        if v == description then
            texio.write("\nsafely removing callback " .. name .. " : " .. description)
            luatexbase.remove_from_callback(name, description)
        end
    end
end

function tex_buffer_remove_callback()
    _tex_buffer_remove_callback("find_read_file", "tex_file_buffer_find")
    _tex_buffer_remove_callback("open_read_file", "tex_file_buffer_read")
end

function tex_file_buffer_reader(env)
    local ret = nil
    if not env["finished"] then
        ret = env["content"]
        env["finished"] = true
        -- remove callback immediately
        tex_buffer_remove_callback()
    end
    return ret
end

function tex_file_buffer_find(id_number, asked_name)
    -- arguments and return value doesn't matter
    texio.write("\nTeXStringBuffer tries to find ".. asked_name .. " id=" .. id_number)
    return asked_name
end

function TeXStringBuffer:register_callback()
    tex_file_buffer_read = function (filename)
        local env = {}
        texio.write("\nTeXStringBuffer opens ".. filename)
        env["finished"] = false
        env["content"] = self:content_to_string()
        env["reader"] = tex_file_buffer_reader
        return env
    end

    -- register callback
    luatexbase.add_to_callback("find_read_file", tex_file_buffer_find, "tex_file_buffer_find")
    luatexbase.add_to_callback("open_read_file", tex_file_buffer_read, "tex_file_buffer_read")
end
