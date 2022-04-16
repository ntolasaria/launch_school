# Given an array of strigs made only from lowercase letters. return an array of all
# characrters that show up in all strings within the given array (including duplicates).
# For example if a character occurs 3 times in all strings but not 4 times, you need to
# include that character three times in the final answer.

# Input: Array of strings
# Output: Array of characters

# Rules:
# - all lowercase letters
# - list of all characters that show in all strings
# - include duplicates
# - if a character appears 3 times in all strings, include in answer 3 times

# Algorith1:
# - iterate through the characters of the first string
#   - look for matching characters in all strings
#   - if match exists
#     - replace the matching characters in all strings with an empty string
#     - add the character to the result array

def common_chars(array)
  array = array.map { |str| str += '' }


  characters = array.shift.chars
  characters.select do |char|
    array.all? { |str| str.sub!(char, '') }
  end

end

arr = ["bella", "label", "roller"]
p common_chars(arr)
p arr
# p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrr", "yyyzzz"]) == []