function newCounter () 
  local i = 0
  return function ()
    i = i + 1
    return i
  end
end

c1 = newCounter()

print(c1())
print(c1())


--[[ 
Here we have something really interesting!
The function newCounter is called and returns the annonymous
function to c1 along with an upvalue, the value i which is
really a "external local variable"

So i still exists outside the function lifetime but it is
local to the annonymous function that was assigned to c1
--]]