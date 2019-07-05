-- Multiple arguments

local printResult = ""

function printTest(...)
   local arg = {...} -- or just use {...}
  for i,v in ipairs(arg) do
    printResult = printResult .. tostring(v) .. "\t"
  end
  
  printResult = printResult .. "\n"
  
  return 
end

print(printTest("hello", "what?", 744, "huh?"))
-- print(printResult)
