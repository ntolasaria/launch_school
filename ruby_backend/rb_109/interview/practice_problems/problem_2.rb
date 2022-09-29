# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# Input - array
# Output - integer - minimum sum of 5 consecutive numbers

# Rules - 
# - if less than 5 elements, return nil

# Algorithm 
# - initialize `sums` to empty array
# - start loop from 0 to array size - 5, index
#   - add the sum of array[index, 5] to `sums`
# - return the minimum value from `sums`

def minimum_sum(array)
  size = array.size
  sums = []
  0.upto(size - 5) do |index|
    sums << array[index, 5].sum
  end
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".