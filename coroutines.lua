-- coroutines

co = coroutine.create(function () 
    print("\n" .. "Hi" .. "\n")
  end)

print(coroutine.status(co))

coroutine.resume(co)

print(tostring(co) .. "\n\n")
  
  
inc = coroutine.create(function ()
    for i = 1,10 do 
      -- without arg 3, the inc step is assumed to be +1
      print ("new loop: " .. tostring(inc) .. ": " .. coroutine.status(inc))
      print (tostring(inc), i)
      print("while loop count: " .. coroutine.yield())
    end
    return "done"
  end)

count = 0


repeat 
  status, result = coroutine.resume(inc, count)
  print("------------------------------")
  print(status, result)
  count = count + 1
  print(tostring(inc) .. ": " .. coroutine.status(inc))
  print("------------------------------")
  -- print(debug.traceback())
until (not status)


  
--[[
resume inc, 
inc runs, 
yields, 
loop runs, 
resume passes count to yield
inc ends
--]]