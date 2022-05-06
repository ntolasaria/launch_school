# Find the length of the longest substring in the given substring that is the same in
# reverse

# As an example, if the input was "I like racecars that go fast", the substring 
# (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# # Example
# "a" -> 1
# "aab" -> 2
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

# Input - string
# Output - integer - length of longest longest palindrome

# Data structures - strings

# Alogrithm 

# - iterate through the string for substrings starting from largest to smallest
#   - start outer loop for length of string (staring from full length down to 1)
#     - start inner loop for index starting from 0 to (length of string - current length)
#       - get the substring for respective index and length
#       - check if it is a palindrome (helper method - palindrome?)
#         - if true then return length of substrings
#     - end inner loop
#   - end outer loop
# - return 0 

def longest_palindrome(string)
  size = string.size
  size.downto(1) do |length|
    0.upto(size - length) do |index|
      substring = string[index, length]
      return substring.size if palindrome?(substring)
    end
  end
  0 
end

def palindrome?(string)
  string == string.reverse
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome('')