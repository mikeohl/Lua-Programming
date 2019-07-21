-- linked lists in lua

list = nil
v = 5

-- inserts value at beginning of list
list = {next = list, value = v}


function linkInsert(list, node)
  
  local l = list
  
  if not l then return end
    
  while l.next do
    l = l.next
  end
  
  l.next = node
end


function printList(list)
  local l = list
  
  while l do
    print (l.value)
    l = l.next
  end
end

newNode = {next = nil, value = 4}

printList(list)
linkInsert(list, newNode)
printList(list)


-- double circular linked list in lua

dCLinkList = nil

dCLinkList = {previous = nil, next = nil, value = v}
dCLinkList.previous = dCLinkList
dCLinkList.next = dCLinkList


function printDCList(list)
  local l = list
  
  if not l then 
    return
  else
    print (l.value)
    l = l.next
  end
  
  while l and l ~= list do
    print (l.value)
    l = l.next
  end
end

function dCLinkInsert(dCLinkList, node)
  
  local l = dCLinkList
  
  -- no list, return
  if not l then return end
  
  -- advance one
  l = l.next
  
  -- traverse to end of list
  while l ~= dCLinkList do
    l = l.next
  end
  
  -- hook up node
  l.next = node
  node.previous = l
  node.next = dCLinkList
  dCLinkList.previous = node
  
end

dCNode = {previous = nil, next = nil, value = 3}

dCLinkInsert(dCLinkList, dCNode)
--dCLinkInsert(dCLinkList, {previous = nil, next = nil, value = 2})



printDCList(dCLinkList)
  