class Element
  attr_reader :datum, :next

  def initialize(value, next_el=nil)
    @datum = value
    @next = next_el
  end

  def tail?
    @next_el.nil?
  end

end

# class SimpleLinkedList
#   def initialize
#     @list = []
#   end

#   def push(value)
#     @list << Element.new(value, @list.last)
#   end

#   def size
#     @list.size
#   end

#   def empty?
#     @list.empty?
#   end

#   def head
#     @list.last
#   end

#   def peek
#     @list.last.datum unless empty?
#   end

#   def pop
#     @list.pop.datum
#   end

#   def self.from_a(array)
#     list = SimpleLinkedList.new
#     return list if array.nil?
#     array.reverse.each do |datum|
#       list.push(datum)
#     end
#     list
#   end

#   def to_a
#     @list.map { |element| element.datum }.reverse.clone
#   end

#   def reverse
#     new_list = SimpleLinkedList.new
#     @list.reverse.each { |element| new_list.push(element.datum) }
#     new_list
#   end
# end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current = head
    while !current.nil?
      size += 1
      current = current.next
    end
    size
  end

  def empty?
    size == 0
  end

  def push(datum)
    element = Element.new(datum, head)
    @head = element
  end

  def peek
    head.datum if head
  end

  def pop
    datum = head.datum
    @head = head.next
    datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each do |datum|
      list.push(datum)
    end
    list
  end

  def to_a
    array = []
    current_el = head
    while !current_el.nil?
      array << current_el.datum
      current_el = current_el.next
    end
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_el = head
    while current_el
      new_list.push(current_el.datum)
      current_el = current_el.next
    end
    new_list
  end
end