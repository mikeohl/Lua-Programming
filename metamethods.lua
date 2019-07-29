-- Create a 'Namespace'
Window = {}

-- default values 'inherited' from the 'member' prototype.
-- seems to blur "has a" and "is a" relationship
Window.prototype = {x = 0, y = 0, width = 100, height = 100, }

Window.mt = {}

function Window.new (o)
  setmetatable(o, Window.mt)
  return o
end

Window.mt.__index = function (table, key)
  return Window.prototype[key]
end

-- or shortcut: Window.mt.__index = Window.prototype 

w = Window.new {x = 10, y = 20}

print(w.width)
print(w.x)
print(w["y"])

-- rawget does not access __index metamethod
print(rawget(w, "width"))

Window.mt.__newindex = function (table, key, value)
  Window.prototype[key] = value
end

w.diagonal = math.sqrt(100*100*2)

print(rawget(w, "diagonal"))

print(w.diagonal)

rawset(w, "diagonal", w.diagonal)

print(rawget(w, "diagonal"))