# Write a function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2, otherwise return false.

# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true
# str1 is 'katas' and str2 is 'steak' should return false

# Only lowercase letters will be used (a-z). No punctuations or digits will be
# included

# Input - 2 strings - str1 and str2
# Output - true or false

# Rules
# - portion of characters of str1 can be rearragned to match str2 

# Algorithm 

# - get all the unique characters in `str1` and store in an array
# - iterate through the chracters
#   - for true
#   - all characters must appear in both the strings
#   - the number of times the character appears in str1 should be greater than or equal to str2

def scramble(str1, str2)
  characters = str2.chars.uniq
  status = true
  characters.each do |char|
    if str1.count(char) < str2.count(char)
      status = false
    end
  end
  status
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true