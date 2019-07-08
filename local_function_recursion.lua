-- local function recursion with factorial

local fact -- first declare
fact = function (n) -- then assign
  if n == 0 then return 1
  else return n*fact(n-1) -- otherwise, this fact won't be the
  end                     -- locally declared fact
end


print(fact(5))


-- or

local function fact1(n)
  if n == 0 then return 1
  else return n*fact1(n-1)
  end
end


print(fact1(4))