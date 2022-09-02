require 'pry-byebug'

# 1   nil   nil
# 1    2    nil
#      2    nil
#      2     3
# 4    2     3
# 4   nil    3
# 4    5     3
# 4    5     6
# 7    5     6
# 7   nil    6
# 7   nil   nil

# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @add_index = 0
#     @remove_index = 0
#   end

#   def enqueue(value)
#     current_value = @buffer[@add_index]
#     @buffer[@add_index] = value

#     @add_index = increment_index(@add_index)
#     @remove_index = @add_index unless current_value.nil?
#   end

#   def dequeue
#     value = @buffer[@remove_index]
#     @buffer[@remove_index] = nil
#     @remove_index = increment_index(@remove_index) unless value.nil?
#     value
#   end

#   private

#   def increment_index(index)
#     (index + 1) % @buffer.size 
#   end
# end

# Using #push and @shift

class CircularQueue
  def initialize(size)
    @size = size
    @buffer = []
  end

  def enqueue(value)
    dequeue if @buffer.size == @size
    @buffer.push(value)
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