# Write a method that rotates an array by moving the first element to the end of the array.
# The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Input - Array
# Output - New array with the first element to the end of the array

# Rules
# - original array should not be modified
# - first element should be moved to the last

# Example
# - [7, 3, 5, 2, 9, 1] => [3, 5, 2, 9, 1, 7]

# Algorithm 
# - 

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  array = string.chars
  rotated = rotate_array(array)
  rotated.join
end

def rotate_integer(integer)
  string = integer.to_s
  rotated = rotate_string(string)
  rotated.to_i
end




p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('hello')
p rotate_integer(735291)