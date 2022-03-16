# Given 2 strings, your job is to find out if there is a substring
# that appears in both the strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Input - 2 strings
# Output - true or false - depending whether there is a common substring in both strings

# Rules 
# - minimum length of substring -> 2 characters
# - substring matching is not case dependent - ex. 'NA' matches 'na'

# Data Structures - strings and array

# Alogrithm

# - determine the smaller string
# - get all substrings from the smaller string and store in an array
# - check if any of the elements in the substring array are present in the longer string.
# - if yes then true else false

# def substring_test(str1, str2)
#   substrings = substrings(str1)
#   substrings.any? do |sub|
#     str2.include?(sub)
#   end
# end

# def substrings(str)
#   substrings = []
#   0.upto(str.size - 1) do |idx|
#     2.upto(str.size - idx) do |length|
#       substrings << str[idx, length].downcase
#     end
#   end
#   substrings
# end

# LS

def substring_test(str1, str2)
  idx = 0
  str1 = str1.downcase
  str2 = str2.downcase

  while idx < str1.size - 1
    if str2.include?(str1[idx])
      sub = str1[idx, 2]
      return true if str2.include?(sub)
    end
    idx += 1
  end
  false
end





p substring_test('Something', 'Fun') == false
p substring_test('Somrthing', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoudofItIsAtrociou') == true