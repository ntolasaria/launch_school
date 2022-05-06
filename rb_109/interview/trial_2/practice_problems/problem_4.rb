# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

# Input: array
# Output: array

# Rules:
# - new array with two closest numbers as elements

# Algorithm:
# - init var `sorted` to the sorted input array
# - init var `differences` to empty array
# - start loop from 0 to array size - 2 - `index`
#   - get the difference of `index + 1` and `index` and add to `differences`
# - end loop
# - get the index of the minimum value from the differences array
# - get the corresponding 2 numbers from that index from sorted array
# - select those two numbers from the input array so that they are in order

def closest_numbers(array)
  sorted = array.sort
  differences = []
  0.upto(array.size - 2) do |index|
    differences << sorted[index + 1] - sorted[index]
  end
  min_idx = differences.index(differences.min)
  numbers = sorted[min_idx, 2]
  array.select do |num|
    numbers.include?(num)
  end
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".