# Problem 2: Common Chars
=begin
Given an array of strings made only from lowercase letters, return an array 
of all characters that show up in all strings within the given array 
(including duplicates). For example, if a character occurs 3 times in all strings 
but not 4 times, you need to include that character three times in the final answer.
=end

# Input: array of strings
# Output: array of strings

# Rules:
# - return an array of characters that appear in all the strings
# - if a character appears more than once in all strings, it should be in return that many times
# - all lowercase letters

# Algorithm:
# - init var `characters` to []
# - iterate through the unique characters of the first string in the array
#   - on every iteration get the count of character in all strings
#   - add the character times min count to `characters`
# - select the the elements of `characters` from the first strings to get in right order

def common_chars(array)
  characters = ''
  array.last.chars.uniq.each do |char|
    counts = array.map { |str| str.count(char) }
    characters << char * counts.min
  end
  
  array.first.chars.select do |char|
    if characters.include?(char)
      characters.sub!(char, '')
      true
    end
  end
end



p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []

