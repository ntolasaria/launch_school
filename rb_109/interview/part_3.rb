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

# Input - Array of integers
# Output - Integer representing the maximum sum of a contiguous sub array

# Init - sub_arrays = []
# Loop 1 - index 0 to (array size - 1) - idx1
#   Loop 2 - index 1 to (array size) - idx2
#   sub_arrays << array[idx1..idx2]
#   end Loop 2
# end Loop 1

# sub_arrays - iterate and transform to sum of sub sub_arrays
# return max value, if max value < 0 return 0




def max_sequence(arr)
  return 0 if arr.all? { |n| n < 0 }
  sub_arrays = []
  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      sub_arrays << arr[idx1..idx2]
    end
  end
  sub_arrays.max_by { |sub_arr| sub_arr.sum }.sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
p max_sequence([-1, -3, -2])
