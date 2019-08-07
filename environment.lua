-- Lua's list of Global variables, the environment or _G

for n in pairs(_G) do print(n) end

value = _G["os"]
print(value)

---[[
function getfield (f)
  local v = _G
  for w in string.gmatch(f, "[%w_]+") do
    --print(v)
    v = v[w] -- will be problem if v[w] is nil
  end
  return v
end
--]]

function setfield (f, v)
  local t = _G
  for w, d in string.gmatch(f, "([%w_]+)(.?)") do
    if d == "." then
      t[w] = t[w] or {}
      t = t[w]
    else
      t[w] = v
    end
  end
end

setfield("t.x.y", 10)
print(t.x.y)
    

print(getfield("t.x.y"))

local declaredNames = {}

function declare (name, initval)
  rawset(_G, name, initval or false)
  declaredNames[name] = true
end

setmetatable(_G, {
    __newindex = function (t, n, v)
      if not declaredNames[n] then
        error("attempt to write to undeclared variable "..n, 2)
      else
        rawset(t, n, v)
      end
    end
    ,
    __index = function (_, n)
      if not declaredNames[n] then
        error("attempt to read undeclared variable "..n, 2)
      else
        return nil
      end
    end
})

declare("what")
what = nil -- what is removed from _G but not from declaredNames
print(what)

-- set current environment
setfenv(1, {_G = _G})
_G.print(what)


