# P1	P2	P3	Comments
# All positions are initially empty
# 1			Add 1 to the queue
# 1	2		Add 2 to the queue
# 2		Remove oldest item from the queue (1)
# 2	3	Add 3 to the queue
# 4	2	3	Add 4 to the queue, queue is now full
# 4		3	Remove oldest item from the queue (2)
# 4	5	3	Add 5 to the queue, queue is full again
# 4	5	6	Add 6 to the queue, replaces oldest element (3)
# 7	5	6	Add 7 to the queue, replaces oldest element (4)
# 7		6	Remove oldest item from the queue (5)
# 7			Remove oldest item from the queue (6)
# Remove oldest item from the queue (7)
# Remove non-existent item from the queue (nil)
require 'pry-byebug'

class CircularQueue
  def initialize(size)
    @size = size
    @buffer = [nil] * size
    @next_position = 0
    @remove_position = 0
  end

  def enqueue(value)
    old_value = @buffer[@next_position]
    @buffer[@next_position] = value
    @next_position = increment_position(@next_position)
    @remove_position = @next_position unless old_value.nil?
  end

  def dequeue
    value = @buffer[@remove_position]
    @buffer[@remove_position] = nil
    @remove_position = increment_position(@remove_position) unless value.nil?
    value
  end

  private

  def increment_position(position)
    (position + 1) % @size
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