-- multiple assignment

a, b = 1, 2

print(a)
print(b)

a, b = b, a

print("after swap:")

print(a)
print(b)

function swap(i, j)
  return j, i
end

a, b = swap(a, b)

print("after function swap: a, b = swap(a, b)")

print(a)
print(b)