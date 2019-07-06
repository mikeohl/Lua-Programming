-- Higher Order functions and closures

names = {"Michael", "Steven", "Kimberly"}
scores = {Michael = 11, Steven = 35, Kimberly = 2}

---[[
function sortByScore(names, scores)
  table.sort(names, function (s1, s2) 
    return scores[s1] > scores[s2]
  end)


end
--]]

sortByScore(names, scores)
print(names[1])