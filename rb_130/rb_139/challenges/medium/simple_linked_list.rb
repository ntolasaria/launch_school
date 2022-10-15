class Element
  attr_reader :datum

  def initialize(datum, next_el=nil)
    @datum = datum
    @next_el = next_el
  end

  def next
    @next_el
  end

  def tail?
    @next_el.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def push(datum)
    # add element to the list, point to the previous last element
    previous_head = @head
    @head = Element.new(datum, previous_head)
  end

  def size
    # returns the size of the list
    size = 0
    current_head = head
    while !current_head.nil?
      current_head = current_head.next
      size += 1
    end
    size
  end

  def empty?
    # true if no elements
    size == 0
  end

  # rubocop: disable Style/SafeNavigation
  def peek
    head.datum if head
  end
  # rubocop: enable Style/SafeNavigation

  def next
    # return next element
  end

  def pop
    current_head = head
    @head = head.next
    current_head.datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each { |el| list.push(el) }
    list
  end

  def to_a
    array = []
    current_head = head
    while !current_head.nil?
      array.push(current_head.datum)
      current_head = current_head.next
    end
    array
  end

  def reverse
    array = to_a
    @head = nil
    array.each { |el| push(el) }
    self
  end
end
