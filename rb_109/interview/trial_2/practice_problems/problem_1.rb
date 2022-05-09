# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# Input: Array
# Output: Array

# Rules:
# - new array with elements that are the count of numbers smaller than the element of the array
# - when counting only unique numbers to be considered
# - when returning the new array, the same size of the input array to be returned

# Algorithm:
# - init var `unique_arr` to the unique values of input array
# - iterate through the array and transform each element
#   - count of all the numbers less than the current element in `unique_arr`
# - return the transformed array


def smaller_numbers_than_current(array)
  unique_arr = array.uniq
  array.map do |num|
    unique_arr.count { |n| n < num }
  end
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".