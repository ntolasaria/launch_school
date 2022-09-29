# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# Input - array
# Output  - array
#         - count of how many numbers are smaller for each element


# Rules 
# - how many numbers are smaller for every element
# - only unique values to be counted
# - in returned array repeated numbers output redundant values


# Algorithm 
# - define `unique` to all unique values of the array
# - iterate through the array 
#   - for every element count the number of elements smaller than it from the `unique` array
# - return array with all the determined values for each element


def smaller_numbers_than_current(array)
  array = array.map do |num|
    array.uniq.count { |n| n < num }
  end
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".