function prefix (w1, w2)
  return w1 .. ' ' .. w2
end

local statetab

function insert (index, value)
  if not statetab[index] then
    statetab[index] = {n = 0}
  else
    table.insert(statetab[index], value)
  end
end

function allwords ()
  local line = io.read()
  local pos = 1
  
  -- iterator function
  -- will keep state and advance everytime it is called
  return function () 
    if pos < 1 then
      return nil
    else
      pos = pos - 1
      return "Hello"
    end
    
    --[[
    while line do
      -- find the word and position of the end of the next word
      local s, e = string.find(line, "%w+", pos)
      if s then
        pos = e + 1 -- move the position forward off the word
        return string.sub(line, s, e) -- return word
      else
        line = io.read() -- reset to next line
        pos = 1
      end
    end
    return nil
    
    string("What is happening? The cat sat on the mat and it is chasing it's tail. Oh no, there is a dog and it is chasing the cat. The cat is hungrier than the dog and wants food. Both are cute and adorable.")
    --]]
  end
end

local N = 2
local MAXGEN = 10000
local NOWORD = "\n"

-- build table 
statetab = {}
local w1, w2 = NOWORD, NOWORD

for w in allwords() do
  insert(prefix(w1, w2), w)
  w1 = w2; w2 = w; -- advance the word variables forward
end

print(hello)
insert(prefix(w1, w2), NOWORD) -- end chain

w1 = NOWORD; w2 = NOWORD -- reinitialize

for i = 1, MAXGEN do
  -- list of possible words from the prefix
  local list = statetab[prefix(w1, w2)] 
  
  local r = math.random(#list) -- randomly select index
  local nextword = list[r]
  if nextword == NOWORD then return end
  io.write(nextword, " ") -- add space between words
  w1 = w2; w2 = nextword
end

