# def count(array)
#   result = 0
#   array.each { |el| result += 1 if yield(el) }
#   result
# end

# Further exploration:
# without using #each, #loop, #while, #until

# def count(array)
#   total = 0

#   for el in array do
#     total += 1 if yield(el)
#   end
#   total
# end

# Using recursion

def count(array, index=0, total=0, &block)
  return total if index == array.size
  total += 1 if yield(array[index])
  index += 1
  count(array, index, total, &block)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
