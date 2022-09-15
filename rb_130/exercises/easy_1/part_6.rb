# def any?(array)
#   index = 0

#   while index < array.size
#     return true if yield(array[index])
#     index += 1
#   end

#   false
# end

# Using #each

def any?(array)
  array.each { |el| return true if yield(el) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
# works for hash. the key, value pair is passed to the block via `el`
p any?({ 'a' => 1, 'b' => 2, 'c' => 3 }) { |k, v| v == 2 } == true 
