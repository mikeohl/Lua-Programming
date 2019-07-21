-- Arrays in Lua

a = {}

-- initialize to zero (instead of nil)
for i = 1, 1000 do
  a[i] = 0
end

print(a[1001])

squares = {1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121}


-- matrices

matrix = {}

N = 5
M = 5

for i = 1, N do
  matrix[i] = {} -- next dimension
  
  for j = 1, M do
    matrix[i][j] = 0
  end
end

print(matrix[3][4])
print(matrix[5][6])

-- handle error for indexing a nil value
local status, err, result = pcall(function () b = matrix[6][1] return b end)

print(status, err, result)