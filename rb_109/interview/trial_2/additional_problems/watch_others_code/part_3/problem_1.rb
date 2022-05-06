# Problem 1: Max sequence
=begin
The maximum sum subarray problem consists of finding the maximum sum of a contiguous subsequence in an array of integers.

Example:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #=> [4, -1, 2, 1]

The easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of negative numbers, return 0 instead. 

An empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray
=end

# Input: array of integers
# Output: integer - maximum sum of a contiguous sub array

# Rules:
# - if all negative numbers, return 0
# - if all positive numbers, sum of the entire array

# Algorithm:
# - init max_sum to 0
# - start loop from 0 to array size - 1 -> `index`
#   - start loop from 1 to array size - index -> `length`
#     - get current_sum of array[index, length]
#     - if current_sum is greater than max_sum  
#       - set max_sum to current_sum
#   - end loop
# - end loop
# - return max_sum, if max_sum is negative return 0

def max_sequence(array)
  max_sum = 0
  0.upto(array.size - 1) do |index|
    1.upto(array.size - index) do |length|
      sum = array[index, length].sum
      max_sum = sum if sum > max_sum
    end
  end
  max_sum
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
