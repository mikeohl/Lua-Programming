-- sample package or namespace for complex number type

local function checkComplex (c)
  if not ((type(c) == "table") and tonumber(c.r) and tonumber(c.i)) then
    error("bad complex number", 3)
  end
end

local function new (r, i) return {r = r, i = i} end

local function add (c1, c2)
  checkComplex(c1); checkComplex(c2)
  return new(c1.r + c2.r, c1.i + c2.i)
end

local function sub (c1, c2)
  return new(c1.r - c2.r, c1.i - c2.i)
end

local function mul (c1, c2)
  return new(c1.r*c2.r - c1.i*c2.i, c1.r*c2.i + c1.i*c2.r)
end

local function inv (c)
  local n = c.r^2 + c.i^2
  return new(c.r/n, -c.i/n)
end

--[[
return complex
--]]

-- add(new(4,1), 3)

function printTable (t)
  for k, v in pairs(t) do
    print(k .. " = " .. v)
  end
end

printTable(new(4, 24))

complex = {
  new = new,
  add = add,
  sub = sub,
  mul = mul,
  inv = inv,
  i = new(0,1)
}