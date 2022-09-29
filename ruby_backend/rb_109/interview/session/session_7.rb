# Given integer array nums, return the third largest number in this array. If the third largest number does not exist, return the largest number.
# You are not allowed to sort the array

# Input: Array
# Output: Integer

# Rules:
# - third largest number in the Array
# - if third largest number doesnt exist, return the largest
# - only unique values to be considered
# - sorting the array is not allowed

# # Algorithm:
# - iterate through the unique elements of the array 
#   - compare adjacent values and swap if the later value is less than the earlier value
# #   - after three iterations the top three values if they exist must be the last three elements of the Array
# # -


# def third_max(array)
#   elements = array.uniq

#   3.times do |n|
#     index = 0 
#     while index < (elements.size - 1 - n)
#       if elements[index] > elements[index + 1]
#         elements[index], elements[index + 1] = elements[index + 1], elements[index]
#       end
#       index += 1
#     end
#   end
#   elements[-3] ? elements[-3] : elements[-1]

# end

# p third_max([3,2,1]) == 1
# p third_max([1,2]) == 2
# p third_max([2,2,3,1]) == 1
# p third_max([1, 3, 4, 2, 2, 5, 6]) == 4


# You are given an array which contains only integers (positive and negative).
# Your job is to sum only the numbers that are the same and consecutive.
# The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

# Input: Array
# Output: Array

# Rules:
# - return new array, with same consecutive numbers added

# Algorithm:
# - init var - `result` -> empty_array
# - iterate through all the elements of the Array
# - if the element is same as the previous one 
#   - add to the last element of result
# - else add the element to the result Array

def sum_consecutives(array)
  result = []
  result << array[0]
  index = 1
  while index < array.size
    if array[index] == array[index - 1]
      result[-1] += array[index]
    else
      result << array[index]
    end
  index += 1
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]


# 25 min each
