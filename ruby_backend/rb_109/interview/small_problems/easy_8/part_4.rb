# Input - string
# Output - array -> all substrings

# Data Structures - string, array

# Algorithm - 

# Method available - leading_substrings

# init empty array - substrings

# iterate from 0 to (string.size - 1) |index|
# call method leading_substrings on every iteration -> leading_substrings(string[index..-1]) -> add return value to substrings



def leading_substrings(str)
  leading_substrings = []
  0.upto(str.size - 1) do |idx|
    leading_substrings << str[0..idx]
  end
  leading_substrings
end

def substrings(string)
  substrings = []
  0.upto(string.size - 1) do |idx|
    substrings += leading_substrings(string[idx..-1])
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]