function permgen (a, n)
  if n == 0 then
    coroutine.yield(a)
  else
    for i = 1, n do
      a[n], a[i] = a[i], a[n]
      permgen(a, n - 1)
      a[n], a[i] = a[i], a[n]
    end
  end
end

-- factory
function perm (a)
  local n = #a -- depreciated: table.getn(a)
  
  -- run the permgen
  local co = coroutine.create(function () permgen(a, n) end)
  return function () -- iterator
    local code, res = coroutine.resume(co)
    print(tostring(co) .. ": " .. coroutine.status(co))
    -- code is any errors
    -- res is arg passed to yield
    return res
  end
  -- return the function
end

-- or
function perm2 (a)
  local n = #a
  return coroutine.wrap(function () permgen(a, n) end)
end
  
 
function printResult (a)
  for i, v in ipairs(a) do
    io.write(v, " ")
  end
  io.write("\n")
end


for p in perm{"a", "b", "c"} do
  printResult(p)
end

--[[
we turn in into an iterator because it will loop all 
permutations, and yield to what we want to do.
We can do anything we want when we get to the base case
Here we print, but we could do anything in the for and
that's why it's an iterator
--]]
  