-- queues

Queue = {}

function Queue.new () 
  return {first = 0, last = -1}
end

function Queue.pushleft (queue, value)
  local first = queue.first - 1 -- get new index
  queue.first = first           -- first set index to new
  queue[first] = value          
end

function Queue.pushright (queue, value)
  local last = queue.last + 1
  queue.last = last
  queue[last] = value
end

function Queue.popleft (queue)
  local first = queue.first
  if first > queue.last then error("list is empty") end
  local value = queue[first]
  queue[first] = nil  -- garbage collection
  queue.first = first + 1
  return value
end

function Queue.popright (queue)
  local last = queue.last
  if last < queue.first then error("list is empty") end
  local value = queue[last]
  queue[last] = nil -- garbage collection
  queue.last = last - 1
  return value
end

queue = Queue.new ()

Queue.pushleft (queue, 5)
Queue.pushright (queue, 21)

print(Queue.popleft(queue))
print(Queue.popleft(queue))
print(Queue.popright(queue))