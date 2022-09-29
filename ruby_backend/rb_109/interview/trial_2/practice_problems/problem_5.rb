# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# Input: string
# Output: string

# Rules:
# - character that appears least often in the input string
# - case insensitive
# - if there are multiple possible results, return the one with the first occurence

# Algorithm:
# - init `lowercase` to lowercase of input string
# - init `character` to first character
# - init `count` to count of first character in `lowercase`
# - itererate through the characters of `lowercase`
#   - get the count of the current element in `lowercase`
#   - if current_count is less than count 
#     - reassign `character` to current character
#     - reassign `count` to current_count
#   - additionaly return `character` if count is 1

def least_common_char(string)
  lowercase = string.downcase.chars
  character = lowercase[0]
  count = lowercase.count(character)
  lowercase[1..-1].each do |char|
    current_count = lowercase.count(char)
    if current_count < count
      count = current_count
      character = char
    end
    return character if count == 1
  end
  character

end




p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".