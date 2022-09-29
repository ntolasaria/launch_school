# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:


# Input - array - integeres
# Output - array - integers

# Rules 
# - pair of numbers from input array which are the closest, that is lowest difference
# - numbers in the output must be in same order as appear in input array

# Algorithm
# - sort the array 
# - iterate and get all the differences between adjacent elements
#   - start loop from 0 to array size - 2
#     - get the differences of each pair [index, 2]
# - get the pair with the lowest difference
# - return the pair in an array in the order of appearance in input

def closest_numbers(array)
  sorted = array.sort
  differences = []
  0.upto(array.size - 2) do |index|
    diff = sorted[index + 1] - sorted[index]
    differences << diff
  end 
  min_idx = differences.index(differences.min)
  num1 = sorted[min_idx]
  num2 = sorted[min_idx + 1]
  array.select { |num| num == num1 || num == num2 }
end


p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]