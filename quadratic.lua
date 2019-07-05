---[[
function quadratic(a, b, c)
  local a2 = 2 * a
  local d = math.sqrt(b^2 - 4*a*c)
  x1 = (-b + d)/a2
  x2 = (-b - d)/a2
  return x1, x2
end

a = 50
b = 100
c = -1000

print(quadratic(a,b,c))
--]]

