# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# Input: array
# Output: integer or nil

# Rules:
# - minimum sum of 5 consecutive numbers in the array
# - if array contains less than 5 elements then nil

# Algorithm:
# - if array size is less than 5 return nil
# - init var `sum` to the sum of the first five elements of the array
# - start loop from 0 to array size - 5 - `index`
#   - get the current_sum of the array for the current `index` and length `5`
#   - if current_sum < sum, the reassign sum to current_sum
# - end loop
# - return sum

def minimum_sum(array)
  return nil if array.size < 5
  sum = array[0,5].sum
  0.upto(array.size - 5) do |index|
    current_sum = array[index, 5].sum
    sum = current_sum if current_sum < sum
  end
  sum
end



p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".