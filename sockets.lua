socket = require "socket"

print(socket._VERSION)

---[[
host = "www.w3.org"
file = "/TR/REC-html32.html"


function download (host, file)
  local c = assert(socket.connect(host, 80))
  local count = 0 -- # of bytes read

  c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
  
  while true do
    local s, status = receive(c)
    count = count + string.len(s)
    
    if status == "closed" then break end
  end
  
  c:close()
  print(file, count)
end

function receive (connection)
  connection:timeout(0)
  
  local s, status = connection:receive(2^10)
  
  if status == "timeout" then
    coroutine.yield(connection)
  end
  
  return s, status
end

--]]