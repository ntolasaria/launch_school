# Problem 2: Scramble

=begin
Write a function scramble(str1, str2) that returns true if a 
portion of str1 characters can be rearranged to match str2, otherwise, return false.
=end

# Input: 2 strings
# Output: true or false - if a portion of str1 characters can be rearranged to match str2

# Rules:
# - all lowercase

# Algorithm:
# - check if all the characters present in str2 is present in equal to or greater times in str1

# - iterate through unique characters of str2
#   - on every iteration, check if current character is present equal to or more times in str1
#   - if not return false

# - if nothing is returned yet return true


def scramble(str1, str2)
  
  str2.chars.uniq.all? do |char|
    str1.count(char) >= str2.count(char)
  end




end



p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
