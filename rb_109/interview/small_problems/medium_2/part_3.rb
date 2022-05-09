# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number of uppercase
# and lowercase characters, as well as characters that were neither of those two. Now we want 
# to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one 
# represents the percentage of characters in the string that are lowercase letters, one the 
# percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Input - string
# Output - hash - keys -> :lowercase, :uppercase, :neither 
#               - values -> respective percentages of occurrence

# Algorithm
# - initialize an empty hash
# - get the the count of lowercase letters in the string.
#   - divide by string size and get percentage and add it to the respective hash key
# - repeated the same for all the keys

def letter_percentages(string)
  hash = {}
  size = string.size.to_f
  hash[:lowercase] = ((string.count('a-z') / size) * 100).round(1)
  hash[:uppercase] = ((string.count('A-Z') / size) * 100).round(1)
  hash[:neither] = 100 - hash[:lowercase] - hash[:uppercase]
  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
