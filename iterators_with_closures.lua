-- creating an interator through function closure

function list_iterator(t)
  local i = 0
  local n = #t
  return function ()
    i = i + 1
    if i <= n then return t[i] end
  end
end

  
  
  t = {10, 20, 30}
  
  iter = list_iterator(t)
  while true do
    local element = iter()
    if element == nil then break end
    print(element)
  end
  
  
  -- or by using the generic for
  
  for element in list_iterator(t) do
    print(element)
  end
  