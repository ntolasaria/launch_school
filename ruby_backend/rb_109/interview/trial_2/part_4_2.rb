# Write a function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2, otherwise return false.

# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true
# str1 is 'katas' and str2 is 'steak' should return false

# Only lowercase letters will be used (a-z). No punctuations or digits will be
# included

# Input: 2 strings
# Output: true or false

# Rules:
# - a portion of characters of str1 can be rearranged to make str2
# - only lowercase letters (a-z)

# Algorithm:
# - iterate through the characters of str2
#   - on every iteration check if the count of the charaters in str1 is greater than equal to str2
# - if every iteration returns true, then true else false

def scramble(str1, str2)
  unique_chars = str2.chars.uniq
  unique_chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end




p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true