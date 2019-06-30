num = 1
a = {}
for i=1,10 do
  a[i] = num
  num = num + 2
end

for i=21,30 do
  a[i] = num
  num = num + 1
end


--[[
because i is incremented in numerical order, it does not
end at 30 but at 10 because 11 is nil even there are more
elements in the table
]]--
for i, line in ipairs(a) do
  print(i) -- i starts at 1
  print(line)
end
