# require 'pry-byebug'

# class CircularQueue

#   def initialize(size)
#     @queue = [nil] * size
#     @size = size
#     @oldest_point = 0
#     @adding_point = 0
#   end

#   def dequeue
#     # binding.pry
#     value = @queue[@oldest_point]
#     @queue[@oldest_point] = nil
#     @oldest_point = increment_point(@oldest_point) unless value.nil?
#     value
#   end

#   def enqueue(value)
#     previous_value = @queue[@adding_point] 
#     @queue[@adding_point] = value
#     @adding_point = increment_point(@adding_point)
#     @oldest_point = @adding_point unless previous_value.nil?
#   end

#   private

#   def increment_point(point)
#     (point + 1) % @size
#   end
# end


# Using #push and #shift methods


class CircularQueue
  def initialize(size)
    @queue = []
    @size = size
  end

  def dequeue
    @queue.shift
  end

  def enqueue(value)
    @queue.push(value)
    dequeue if @queue.size > @size
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