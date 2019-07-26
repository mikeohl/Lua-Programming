function serialize (o, indent)
  if type(o) == "number" then
    io.write(o)
  elseif type(o) == "string" then
    io.write(string.format("%q", o))
  elseif type(o) == "table" then
    io.write("{\n")
    for k,v in pairs(o) do
      io.write(indent, k, " = ")
      serialize(v, indent .. indent)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serialize a " .. type(o))
  end
end

  
serialize ({a = 12, b = 'Lua', key = 'another "one"'}, "  ")

function serializeSafe (o, indent)
  if type(o) == "number" then
    io.write(o)
  elseif type(o) == "string" then
    io.write(string.format("%q", o))
  elseif type(o) == "table" then
    io.write("{\n")
    for k,v in pairs(o) do
      io.write(indent .. "[") -- handle non valid identifiers
      serialize(k)
      io.write("] = ")
      serialize(v, indent .. indent)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serialize a " .. type(o))
  end
end

serializeSafe ({[1] = 12, b = 'Lua', key = 'another "one"'}, "  ")

function basicSeriazlize (o)
  if type(o) == "number" then
    return tostring(o)
  else
    return string.format("%q", o)
  end
end

function save (name, value, saved)
  saved = saved or {} -- initial value
  io.write(name, " = ")
  if type(value) == "number" or type(value) == "string" then
    io.write(basicSeriazlize(value), "\n")
  elseif type(value) == "table" then
    if saved[value] then
      io.write(saved[value], "\n")
    else
      saved[value] = name
      io.write("{}\n")
      for k,v in pairs(value) do 
        local fieldname = string.format("%s[%s]", name,
                                        basicSeriazlize(k))
        save(fieldname, v, saved)
      end
    end
  else
    error("cannot save a " .. type(value))
  end
end

a = {x = 1, y = 2; {3, 4, 5}}   -- a.x , a.y, a[1]
a[2] = a                        -- cycle
a.z = a[1]                      -- shared sub-table

save('a', a)

