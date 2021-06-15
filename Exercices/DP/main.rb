require './ArrayQueue'
require './LinkedList'

require 'benchmark'

small_array_queue = ArrayQueue.new
small_list_queue = ListQueue.new
large_array_queue = ArrayQueue.new
large_list_queue = ListQueue.new

# Fill the queue with some data
100.times do
  small_array_queue.enqueue 42
  small_list_queue.enqueue 42
end

100_000.times do
  large_array_queue.enqueue 42
  large_list_queue.enqueue 42
end

# Now, benchmark enqueue and dequeue on each queue
iterations = 500_000
Benchmark.bm do |x|
  x.report("Enqueue in small Array") { iterations.times { small_array_queue.enqueue 99 } }
  x.report("Enqueue in small List ") { iterations.times { small_list_queue.enqueue 99 } }  
  x.report("Enqueue in large Array") { iterations.times { large_array_queue.enqueue 99 } }
  x.report("Enqueue in large List ") { iterations.times { large_list_queue.enqueue 99 } }

  x.report("Dequeue in small Array") { iterations.times { small_array_queue.dequeue } }
  x.report("Dequeue in small List ") { iterations.times { small_list_queue.dequeue } }  
  x.report("Dequeue in large Array") { iterations.times { large_array_queue.dequeue } }
  x.report("Dequeue in large List ") { iterations.times { large_list_queue.dequeue } }
end
