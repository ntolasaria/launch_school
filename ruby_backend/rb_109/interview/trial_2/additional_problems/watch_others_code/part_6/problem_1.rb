# Problem 1: Find Even Index
=begin
You are given an array of integers. Your job is to take that array 
and find an index N where the sum of the integers to the left of N 
is equal to the sum of the integers to the right of N. If there is no 
index that would make this happen, return -1. Empty arrays are equal 
to 0 in this problem.
=end

# Input: array of integers
# Output: integer - index, where sum of left and right are equal

# Rules:
# - if no such index, return 0
# - empty array sum equals to 0

# Algorithm:
# - start loop from 0 to array size - 1 -> `index`
#   - get the left sum for array[0...index]
#   - get the right sum for array[index + 1..-1]
#   - if left sum equals to right sum, return `index`
# - end loop

def find_even_index(array)
  0.upto(array.size - 1) do |index|
    left_sum = array[0...index].sum
    right_sum = array[(index + 1)..-1].sum
    return index if left_sum == right_sum
  end
  -1
end

p find_even_index([]) == 0
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
