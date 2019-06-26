-- Factorial function

function factorial (n)
  if n == 0 then
    return 1
  else
    return n * factorial(n-1)
  end
end

io.write("Enter a number: ")
a = io.read("*number")
print(factorial(a))