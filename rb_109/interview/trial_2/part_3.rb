=begin
The maximum subarray problem consists in finding the maximum sum of a contiguous
subsequence in an array of integers :

max_sequence [-2, 1, -3, 4, -1, 2, 1, -5, -4] -> should be 6 : [4, -1, 2, 1]

Easy case is when the array is made up of only positive numbers and the maximum sum
is the sum of the whole array. If the array is made up of only negative numbers,
return 0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is 
also a valid subarray

=end

# Input: array - integers
# Output: integer

# Rules:
# - maximum of a continuous sequence of numbers
# - if all positives, then the sum of whole array
# - if all negative numbers, return 0
# - empty array is considered to have sum 0

# Algorithm:
# - initialize `max_sum` to 0
# - start loop from 0 to array length - 1 - var `index`
#   - start loop from 1 to (array length - index) - var `length`
#   - get the sum of the sub_array - array[index, length]
#   - if the sum is greater than `max_sum` reassign `max_num` to that value
#   - end loop
# - end loop

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
p max_sequence([-1, -3, -2]) == 0
