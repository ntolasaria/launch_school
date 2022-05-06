# Problem 1: Longest Palindrome
=begin
Find the length of the longest substring in the given string that is the same in reverse.

Example:
longest_palindrome("I like racecars that go fast") == 7

If the length of the input string is 0, return value must be 0
=end

# Input: string
# Output: integer - length of the longest substring which is a Palindrome

# Rules:
# - all lowercase and digits
# - even one character is allowed
# - if input string is empty, return 0

# Algorithm:
# - set the length of palindrome to 0, var - `sub_length`
# - start loop from (string size) to 1, var - `length`
#   - start loop from 0 to (string size - length) -> `index`
#     - get the substring for string[index, length]
#     - check if the substring is palindrome 
#     - if yes, reassign sub_length and break 
#   - end loop
# - end loop
# - return sub_length

def longest_palindrome(string)
  string.size.downto(1) do |length|
    0.upto(string.size - length) do |index|
      substring = string[index, length]
      if palindrome?(substring)
        return substring.size
      end
    end
  end
end

def palindrome?(string)
  string.chars.reverse.join == string
end

puts longest_palindrome('') == 0
puts longest_palindrome('a') == 1
puts longest_palindrome('aa') == 2
puts longest_palindrome('baa') == 2
puts longest_palindrome('aab') == 2
puts longest_palindrome('baabcd') == 4
puts longest_palindrome('baab1kj12345432133d') == 9
puts longest_palindrome("I like racecars that go fast") == 7
