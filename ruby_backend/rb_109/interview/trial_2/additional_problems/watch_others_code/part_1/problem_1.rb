# Problem 1: Repeated substring
=begin
Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only.

Example 1:
 - Input "abab"
 - Output: True
 - Explanation: It's the substring 'ab' twice.

Example 2:
 - Input: "aba"
 - Output: False
=end

# Input: string
# Output: true or false

# Rules:
# - only lowercase english letters
# - check if the substring can be made by repeating a substring a certain number of times

# Algorithm:
# - get the `mid` value of the string
# - iterate from 1 to `mid` value -> var `length`
#   - if string size % length is 0
#     - get the corresponding substring for each iteration - string[0, length]
#     - check if substring times string size by length is equal to string
#       - return true 
# - if nothing is returned, return false
   
def repeated_substring(string)
  size = string.size
  mid = string.size / 2
  1.upto(mid) do |length|
    if size % length == 0
      substring = string[0, length]
      return true if substring * (size / length) == string
    end
  end
  false
end


p repeated_substring('abab') == true
p repeated_substring('aba') == false
p repeated_substring('aabaaba') == false
p repeated_substring('abaababaab') == true
p repeated_substring('abcabcabcabc') == true
p repeated_substring('aaaaa') == true
