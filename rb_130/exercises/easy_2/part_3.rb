# Your method may use #each, #each_with_object, #each_with_index, 
# #inject, loop, for, while, or until to iterate through the Array 
# passed in as an argument, but must not use any other methods that 
# iterate through an Array or any other collection.

# def map(array)
#   array.each_with_object([]) do |element, mapped|
#     mapped << yield(element)
#   end
# end

# Using #each

# def map(array)
#   result = []
#   array.each { |el| result << yield(el) }
#   result
# end

# Using simple looping

def map(array)
  index = 0
  result = []

  while index < array.size
    result << yield(array[index])
    index += 1
  end

  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
