# Problem 1: Substring test
=begin
Given 2 strings, your job is to find out if there is a substring that 
appears in both strings. You will return true if you find a substring 
that appears in both strings, and false if not. A substring is longer than 1 character.
=end

# Input: 2 strings
# Output: true or false - if there is a common Substring

# Rules:
# - substring length greater than 0
# - case insensitive

# Algorithm:
# - set `short`, `long` to the shorter and longer string both downcased
# - start loop from 0 to short size - 2 -> index1
#   - start loop from index + 1 to short size - 1 -> index2
#     - if `long` includes short[index1..index2]
#       - return true
#   - end loop
# - end loop
# - if nothing is returned, return false

# def substring_test(str1, str2)
#   short, long = [str1, str2].sort_by(&:size).map(&:downcase)
#   0.upto(short.size - 2) do |idx1|
#     (idx1 + 1).upto(short.size - 1) do |idx2|
#       return true if long.include?(short[idx1..idx2])
#     end
#   end
#   false
# end

# LS 

def substring_test(str1, str2)
  str1 = str1.downcase
  str2 = str2.downcase
  0.upto(str1.size - 2) do |index|
    if str2.include?(str1[index])
      substring = str1[index, 2]
      return true if str2.include?(substring)
    end
  end
  false
end


puts substring_test('Something', 'Fun') == false
puts substring_test('Something', 'Home') == true
puts substring_test('Something', ' ') == false
puts substring_test('BANANA', 'banana') == true
puts substring_test('test', 'llt') == false
puts substring_test(' ', ' ') == false
puts substring_test('1234567', '541265') == true

