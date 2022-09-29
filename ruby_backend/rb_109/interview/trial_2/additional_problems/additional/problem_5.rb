# Problem 5: Interweaving Arrays
=begin
Write a method that combines two Arrays passed in as arguments and returns a new Array that contains 
all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty and that they have the same number of elements.
=end

# Input: 2 arrays
# Output: array
#         - elements of the input arrays interweaved

# Rules:
# - both arrays are non empty and of the same size

# Algorithm:
# - init var `interweaved` to []
# - iterate from 0 to input array size - 1 - var `index`
#   - on every iteration add the element at `index` of array1 and then array2 to `interweaved`
# - return interweaved array

def interleave(array1, array2)
  interweaved = []
  0.upto(array1.size - 1) do |index|
    interweaved << array1[index] << array2[index]
  end
  interweaved
end


p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, "a", 2, "b", 3, "c"]
