-- max

function maximum (a)
  local max_index = 1
  local max = a[max_index]
  
  for i, val in pairs(a) do 
    if (val > max) then
      max_index = i
      max = a[i]
    end
  end
  
  return max, max_index
end

list = {1, 26, 45, 97, 8, 33, 5}

a,b,c,d,e,f,g = unpack(list)

print(e)
  

print(maximum(list))
