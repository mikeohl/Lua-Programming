function newStack ()
  return {""}
end


function addString (stack, s)
  table.insert(stack, s)
  
  -- from table length to 1, decrement
  for i = #stack - 1, 1, -1 do
    print("here")
    if string.len(stack[i]) > string.len(stack[i+1]) then
      break
    end
    stack[i] = stack[i] .. table.remove(stack)
    print("there")
  end
end


local s = newStack()
for line in io.lines() do
  if line == "break" then
    break
  end
    
  addString(s, line .. "\n")
end

s = table.concat(s) 

print(s)



