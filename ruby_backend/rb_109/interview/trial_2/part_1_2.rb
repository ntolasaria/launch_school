# Given a non-empty string check if it can be constructed by taking a substring of it 
# and appending multiple copies of the substring together. You may assume the given
# string consists of lowercase english letters only.

# Input: string
# Output: true or false

# Rules:
# - any substring can be repeated to form the string
# - all lowercase english letters

# Algorithm:
# - get the `center` of the string - string length divided by 2
# - iterate from 1 to `center` - `length`
#   - get the substring of size `length` from index 0
#   - multiply the substring by string size divided by `length` and check if it is equal to the string
#   - if yes return true
# - if nothing is returned, return false

def repeated_substring_pattern(string)
  center = string.size / 2
  1.upto(center) do |length|
    substring = string[0, length]
    return true if substring * (string.size / length) == string
  end
  false
end



p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true