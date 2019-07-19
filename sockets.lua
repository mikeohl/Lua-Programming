socket = require "socket"


function download (host, file)
  local c = assert(socket.connect(host, 80))
  local count = 0 -- # of bytes read

  c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
  
  while true do
    local s, status = receive(c)
    if s then
      count = count + string.len(s)
    end

    if status == "closed" then break end
  end
  
  c:close()
  print(file, count)
end


function receive (connection)
  connection:settimeout(0)
  
  local s, status = connection:receive(2^10) -- get 1024 bytes
  --print(s, status)
  
  if status == "timeout" then
    coroutine.yield(connection)
  end
  
  return s, status
end



-- calls to get add coroutine to threads table
function get (host, file)
  local co = coroutine.create(function ()
      download(host, file)
    end)
  table.insert(threads, co)
end

-- resume each thread and remove when they complete
function dispatcher ()
  while true do 
    local n = #threads
    print(n)
    if n == 0 then break end -- quit when threads finish
    
    local connections = {}
    
    for i = 1, n do
      local status, res = coroutine.resume(threads[i])
      print(res)
      if not res then
        table.remove(threads, i)
        break
      else
        table.insert(connections, res) 
        -- insert thread to connections table
      end
    end
    if #connections == n then
      socket.select(connections)
    end
  end
end

print(socket._VERSION)

---[[
host = "www.w3.org"
local file = "/TR/REC-html32.html"
local file2 = "/TR/html401/html.txt"
local file3 = "/TR/2002/REC-xhtml1-20020801/xhtml1.pdf"
local file4 = "/TR/2000/REC-DOM-Level-2-Core-20001113/DOM2-Core.txt"

threads = {}

get(host, file); get(host, file2)
get(host, file3); get(host, file4)

dispatcher()

--]]