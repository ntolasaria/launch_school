=begin

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=end

# Input - array of integers
# Output - array of 2 Integer

# Rules
# - output the numbers closest in value as elements of an array
# - all integers are greater than 0

# Test case
# - [5, 25, 15, 11, 20]
# - [5, 11, 15, 20, 25]
# difference - [6, 4, 5, 5]

# Algorithm
# - initialize `sorted_array` to the sorted version of input Array
# - iterate through the array and get the differences between adjacent elements
# - output the elements with the minimum difference as an Array
# - 


# def closest_numbers(array)
#   sorted_array = array.sort
#   differences = []
#   0.upto(array.size - 2) do |index|
#     differences << sorted_array[index + 1] - sorted_array[index]
#   end
#   min_index = differences.index(differences.min)
#   num1 = sorted_array[min_index]
#   num2 = sorted_array[min_index + 1]

#   array.select do |num|
#     num == num1 || num == num2
#   end
# end


def closest_numbers(array)
  pairs = []

  result = []
  difference = array.sort[-1] - array.sort[0]

  0.upto(array.size - 2) do |starting_index|
    (starting_index + 1).upto(array.size - 1) do |ending_index|
      pairs << [array[starting_index], array[ending_index]]
    end
  end

  pairs.each do |pair|
    pair_diff = pair.sort[-1] - pair.sort[0]
    if difference > pair_diff
      difference = pair_diff
      result = pair
    end
  end

  result
end



p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
