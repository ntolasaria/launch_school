# Given 2 strings, your job is to find out if there is a substring
# that appears in both the strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Input: 2 strings
# Output: true or false

# Rules:
# - true if there a common substring in both strings ( > 1 letter )
# - else
# - case insensitive

# Algorithm
# - iterate through the smaller string and get all the substrings longer than 1 character
# - init var `substrings` to empty array
#   - start loop from 0 to string size - 2 `index`
#     - start loop from 2 to string size - index `length`
#       - add string[index, length] to substrings
#     - end loop
#   - end loop
# - iterate through `substrings` aray
#   - for each iteration check if the larger string includes the substring for that iteration
#   - if true then return true
# - if nothing is returned yet, return false

# def substring_test(str1, str2)
#   small, large = [str1.downcase, str2.downcase].sort_by(&:size)
#   substrings = substrings(small)
#   substrings.any? do |sub|
#     large.include?(sub)
#   end
# end

# def substrings(string)
#   substrings = []
#   0.upto(string.size - 2) do |index|
#     2.upto(string.size - index) do |length|
#       substrings << string[index, length]
#     end
#   end
#   substrings
# end


# Alternate algorithm

def substring_test(str1, str2)
  str1 = str1.downcase
  str2 = str2.downcase
  index = 0
  while index < str1.size - 1
    if str2.include?(str1[index])
      sub = str1[index, 2]
      return true if str2.include?(sub)
    end
    index += 1
  end
  false
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoudofItIsAtrociou') == true