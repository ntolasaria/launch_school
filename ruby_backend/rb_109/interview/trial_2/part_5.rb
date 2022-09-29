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

# Input: string
# Output: integer

# Rules:
# - length of the longest palindrome
# - if length of input is 0 return 0
# - case sensitive

# Algorithm:
# - Helper method `palindrome?`
# - start loop from (string size) to 1 - `length`
#   - start loop from 0 to (string size - length) - `index`
#     - get the substring for the `index` and `length`
#     - if the string is a palindrome, return string size
#   - end loop
# - end loop
# - if nothing is returned, return 0


def longest_palindrome(string)
  (string.size).downto(1) do |length|
    0.upto(string.size - length) do |index|
      sub = string[index, length]
      return sub.size if palindrome?(sub)
    end
  end
end

def palindrome?(string)
  string.chars.reverse == string.chars
end




p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome('')