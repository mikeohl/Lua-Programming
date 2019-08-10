local count = 0
function Entry (b) count = count + 1 end
dofile("data.lua")
print("number of entries: " .. count)

-- print authors
local authors = {}
function Entry (b) authors[b[1]] = true end
dofile("data.lua")
for name in pairs(authors) do print(name) end