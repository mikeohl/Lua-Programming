x = nil
y = "yes"
z = "42"

print(x and y)  -- return the first argument if it is false

print(y and x)  -- and returns the second argument if the first
                -- argument is true (not the whole statement)


print(x or y)   -- return the second argument if the first
                -- is false

print(y or x)   -- or returns the first if it is true


print(x and y or z) -- x ? y : z (if x then y, else z. 
                    -- x is nil so returns z) 



x = x or y      -- if x then x, else y

print(x)


