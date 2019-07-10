list = nil

for i=10,1,-1 do
  list = {next = list, value  = i}
  print(list.value)
end

l = list

---[[
while l do
  print(l.value)
  l = l.next
end
--]]
  