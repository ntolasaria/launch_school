# Write a method that returns a list of all substrings of a string that start at 
# the beginning of the original string. The return value should be arranged in 
# order from shortest to longest substring.

# Input - string
# Output - array -> all substrings starting from the beginning

# Data Structures - string, array

# Algorithm
# init empty array - substrings
# iterate from 0 to (string size - 1) |index|
# add substrings using #slice for every iteration -> string[0..idx]

def leading_substrings(str)
  leading_substrings = []
  0.upto(str.size - 1) do |idx|
    leading_substrings << str[0..idx]
  end
  leading_substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']