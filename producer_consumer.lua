-- producer / consumer

function receive () 
  local status, value = coroutine.resume(producer)
  return value
end

function send (x)
  coroutine.yield(x)
end


producer = coroutine.create(
  function ()
    while true do
      local x = io.read()
      send(x) -- yield with x as argument
    end
  end)

function consumer ()
  while true do
    local x = receive() -- get the value returned from yield
    io.write(x, "\n")
  end
end


consumer()
    