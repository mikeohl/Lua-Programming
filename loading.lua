-- load string

f = loadstring("i = i + 1")

i = 0 -- cannot be local, f will try to operate only on global i

f()
print(i)
f()
print(i)


-- loadstring returns chunck as function
f = loadstring("local a = 10; return a + 20") 
print(f())


-- adding () after call to load string calls the function
assert(loadstring("print(5)"))()


--[[
g = loadfile("factorial.lua")

g() -- runs the file, which "defines" the function factorial


-- can now use factorial function
print(factorial(5))


-- loads and runs the file in one action
dofile("factorial.lua")
--]]

-- read in code from user
s = io.read()
assert(loadstring(s))()
