x = 10
do 
  local x = x   -- common local definition
  while x > 0 do
    print(x)
    x = x - 1
  end
  print("Done: x = " .. x)
end
print("Global x = " .. x)