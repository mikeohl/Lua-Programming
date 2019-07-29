-- warning, cannot traverse table normally now with pairs, etc.

t = {} -- original table

local _t = t

-- proxy
t = {}

---[[
local mt = {
  __index = function (t, k)
    print("*access to element " .. tostring(k))
    return _t[k] -- now access original table
  end, -- comma for new element in table
  
  __newindex = function (t, k, v)
    print("*update of element " .. tostring(k) .. 
                         " to " .. tostring(v))
    _t[k] = v -- update the original
  end
}
--]]

setmetatable(t, mt)

t[2] = 'hello'

print(t[2])


-- a private index i.e. table name
local index = {}

local mt = {
  __index = function (t, k)
    print("*access to element " .. tostring(k))
    return t[index][k] -- now access original table
  end, -- comma for new element in table
  
  __newindex = function (t, k, v)
    print("*update of element " .. tostring(k) .. 
                         " to " .. tostring(v))
    t[index][k] = v -- update the original
  end
}

-- create a local proxy table that has the original table saved
-- in it. you then access the proxy and then redirect.
-- each proxy is unique on the function call
function track (t)
  local proxy = {}
  proxy[index] = t
  setmetatable(proxy, mt)
  return proxy
end

s = {}
s["s"] = "this is s"

s = track(s)

print()
print(s.s)

w = {}
w = track(w)

s[1] = "s again"
print(s[1])

w["w"] = "this is w"
print(w.w)

function readOnly (t)
  proxy = {}
  local mt = {
    __index = t,
    __newindex = function (t, k, v)
      error("attempt to update a read-only table")
    end
  }
  setmetatable(proxy, mt)
  return proxy
end

days = readOnly {"Sunday", "Monday", "Tuesday", "Wednesday",
                 "Thursday", "Friday", "Saturday"}
               
print(days[1])

days[2] = "Noday"
