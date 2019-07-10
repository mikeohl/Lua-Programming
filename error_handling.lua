function giveString(str)
  if type(str) ~= "compare with this which is type string" then
    error("a string was expected", 2)
  end
end

-- you can always print a trace back
print(debug.traceback())


giveString(5)
-- error line is given as 8 with level 2 above
-- would have been given as line 3 with level 1