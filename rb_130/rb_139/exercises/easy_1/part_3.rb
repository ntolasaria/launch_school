# def missing(array)
#   result = []
#   0.upto(array.size - 2) do |index|
#     current_num = array[index] + 1
#     while current_num < array[index + 1]
#       result << current_num
#       current_num += 1
#     end
#   end
#   result
# end

# Refactoring

def missing(array)
  (array.first..array.last).reject { |el| array.include?(el) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
