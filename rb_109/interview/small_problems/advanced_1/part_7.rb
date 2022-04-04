# Merge Sorted Lists

# Write a method that takes two sorted Arrays as arguments, and returns a new Array that 
# contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must 
# build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# input - 2 sorted arrays
# output - array -> merged and sorted

# Rules
# - should not modify array
# - new array returned

# Algorithm -
# - initialize `result` to empty array 
# - initialize `index` to 0
# - iterate through array1
#   - compare with array2[index]
#     - keep adding array2 elements to `result` till array2[index] < array1
#     - increment index by 1
#   - add array1 current element to `result`
# - array2 might have remaining elements - add them all to result and return 

def merge(array1, array2)
  result = []
  index = 0
  array1.each do |num1|
    while index < array2.size && array2[index] < num1
      result << array2[index]
      index += 1
    end
    result << num1
  end
  result += array2[index..-1]
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
