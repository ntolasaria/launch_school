require 'pry-byebug'

# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @next = 0
#     @oldest = 0
#   end

#   def enqueue(value)
#     @oldest = increment(@oldest) if !@buffer[@next].nil?

#     @buffer[@next] = value
#     @next = increment(@next)
#   end

#   def dequeue
#     # binding.pry
#     value = @buffer[@oldest]
#     @buffer[@oldest] = nil
#     @oldest = increment(@oldest) if !value.nil?
#     value
#   end

#   def increment(position)
#     position += 1
#     position % @buffer.size
#   end
# end

# using push and shift

class CircularQueue
  def initialize(size)
    @buffer = []
    @size = size
  end

  def enqueue(value)
    dequeue if @buffer.size == @size
    @buffer << value
  end

  def dequeue
    @buffer.shift
  end
end



queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

