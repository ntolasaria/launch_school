# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# # Examples:

# Input - string
# Output  - string
#         - character that occurs least often

# Rules 
# - character with the minimum no of occurences
# - if there are multiple options, then the the character that appears first
# - case insensitive

# Algorithm - 
# - make the input string lowercase
# - initialize var `index` to 0
# - initialize var `count` to count of character in string at index 0
# - iterate through the string character wise
#   - if the count of character in the string is lower than `count`
#     - reassign `count` to that value and `index` to that index
# - return the character at the `index`


# def least_common_char(string)
#   string = string.downcase
#   index = 0
#   count = string.count(string[0])
#   0.upto(string.size - 1) do |idx|
#     if string.count(string[idx]) < count
#       count = string.count(string[idx])
#       index = idx
#     end
#     return string[idx] if count == 1
#   end
#   string[index]
# end

# Methods

def least_common_char(string)
  str_arr = string.downcase.chars
  min_count = str_arr.map { |c| str_arr.count(c) }.min
  str_arr.find { |c| str_arr.count(c) == min_count }
end



p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".