Set = {}

function Set.new (t)
  local set = {}
  setmetatable(set, Set.mt)
  
  assert(type(t) == "table", "Function Set.new expects table as argument")
  
  -- _ is dummy value for index, l is value which we use as
  -- a key in the set and set to true
  for _, l in ipairs(t) do set[l] = true end
  return set
end

function Set.union (a, b)
  if getmetatable(a) ~= Set.mt or 
     getmetatable(b) ~= Set.mt then
       error("attempt to 'add' a set with a non-set value", 2)
  end
     
  local res = Set.new{} -- new empty set
  
  -- get all keys from both sets and put them in res as true
  for k in pairs(a) do res[k] = true end
  for k in pairs(b) do res[k] = true end
  
  return res -- short for result
end

function Set.intersection (a, b)
  local res = Set.new{}
  
  for k in pairs(a) do
    if b[k] then
      res[k] = true
    end
    --or just res[k] = b[k] and nils will stay nils (faster!)
  end
  
  return res
end

function Set.tostring (set)
  local s = "{"
  local sep = ""
  for e in pairs(set) do 
    s = s .. sep .. e
    sep = ", "
  end
  return s .. "}"
end

function Set.print(s)
  print(Set.tostring(s))
end

Set.mt = {} -- set metatable

s1 = Set.new {10, 20, 30, 50}
s2 = Set.new {1, 30}
Set.print(s1)
print(getmetatable(s1))
print(getmetatable(s2))

Set.mt.__add = Set.union

s3 = s1 + s2
Set.print(s3)

Set.mt.__mul = Set.intersection
Set.print((s1 + s2)*s1)
Set.print(s1*s2)

Set.mt.__le = function (a, b)
  for k in pairs(a) do
    if not b[k] then
      return false
    end
  end
  
  return true
end

Set.mt.__lt = function (a, b)
  return a <= b and not (b <= a) -- strictly a 'smaller' subset
end

Set.mt.__eq = function (a, b)
  return a <= b and b <= a 
  -- equal if both are subsets of eachother
end

s1 = Set.new {2, 4}
s2 = Set.new {4, 10, 2}
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 * s1)

Set.mt.__tostring = Set.tostring

print(s1)
print(s2)

Set.mt.__metatable = "not your business"

s1 = Set.new{}
print(getmetatable(s1))
setmetatable(s1, {})
