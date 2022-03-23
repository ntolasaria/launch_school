
# # Given an array of n positive integers and a positive integer s, find the minimal length 
# # of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.


# Input - array, integer
# Output - integer - minimal length of a continuous array where, sum >= input integer

# Algorithm

# - break the array into sub arrays
# - sort the sub arrays by size
# - iterate and break and return where the sum of subarray is greater than equal to input integer


# def minSubLength(array, sum)
#   subarrays = sub_arrays(array)
#   target_sub = subarrays.find do |sub|
#     sub.sum >= sum
#   end
#   target_sub ? target_sub.size : 0
# end


# def sub_arrays(array)
#   sub_arrays = []
#   0.upto(array.size - 1) do |index|
#     1.upto(array.size - index) do |length|
#       sub_arrays << array[index, length]
#     end
#   end
#   sub_arrays.sort_by { |sub| sub.size }
# end

def minSubLength(array, sum)
  1.upto(array.size) do |length|
    0.upto(array.size - length) do |index|
      sub_arr = array[index, length]
      return sub_arr.size if sub_arr.sum >= sum
    end
  end
  0






end


p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0