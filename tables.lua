a = {} -- create a table
a["Hello"] = "Good day"
print(a["Hello"])

a["Hello"] = a["Hello"] .. " to you!"

print(a["Hello"])


test = {[1] = "one", [2] = "two", [3] = "three"}

---[[
for i in pairs(test) do
  print(test[i])
end
--]]

test2 = {["-"] = "minus", ["*"] = "times", x = 5}

---[[
for i in pairs(test2) do
  print(test2[i])
end
--]]

b = "*"

print(test2["*"]) -- prints times
print(test2.x)    -- prints 5
print(test2[b])   -- prints times
