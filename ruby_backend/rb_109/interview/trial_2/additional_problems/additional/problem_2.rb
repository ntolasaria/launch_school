# Problem 2: All Substrings
# Write a method that finds all substrings in a string, no 1 letter words.

# Input: string
# Output: - array of string
#         - all substrings more than 1 letter long

# Algorithm:
# - init `substrings` to []
# - start loop from 0 to string size - 2 -> index
#   - start loop from 2 to string size - index -> length
#     - add the string[index, length] to substrings
#   - end loop
# - end loop
# - return substrings

def substrings(string)
  substrings = []
  0.upto(string.size - 2) do |index|
    2.upto(string.size - index) do |length|
      substrings << string[index, length]
    end
  end
  substrings
end

# with indexes

# def substrings(string)
#   substrings = []
#   0.upto(string.size - 2) do |index1|
#     (index1 + 1).upto(string.size - 1) do |index2|
#       substrings << string[index1..index2]
#     end
#   end
#   substrings
# end

p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']
