# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. Spaces should be included only 
# when more than one word is present.

# INPUT - string
# Output - string -> the characters of words greater than equal to 5 characrters reversed

# Data Structures - string, array

# Algorithm - 

# Split string into words -> result array

# iterate through array of words using map (transformation)- 
#   if word size >= 5 then reverse the chracters in the word
#   else return word

def reverse_words(str)
  str.split.map { |word| word.size < 5 ? word : word.reverse }.join(' ') 
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

