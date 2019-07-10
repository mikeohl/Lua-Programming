-- file open error


local file, msg
msg = "no file by that name"

--[[
repeat
  print("enter a file name: ")
  local name = io.read()
  if not name then return end
  file, msg = io.open(name, "r")
  if not file then print(msg) end
until file -- must get a correct file name
--]]

function fakeFile ()
  file = assert(io.open("Fake file", "r")) 
  -- raises an error which halts execution
end

-- protected call
if pcall(fakeFile) then
  print "Not a fake file"
else
  print "Uh oh, can't open a fake file"
end

local status, err = pcall(function () error("This is an error") end)
print(status) -- prints whether pcall succeeds, in this case false
print(err) -- prints the filepath, line, and error message