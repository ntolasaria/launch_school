# Problem 4: Capitalize words
# Write a method that takes a single String argument and returns a new 
# string that contains the original value of the argument with the first 
# character of every word capitalized and all other letters lowercase. You 
# may assume that words are any sequence of non-blank characters.

# Input: string
# Output: string
#         - every word in the string capitalized
# Rules:
# - words are ay sequence of non blank character
# - in every word only first character upcased rest all in lowercase

# Algorithm:
# - split the string into words
# - iterate through the words and transform
#   - capitalize each word
# - join with a ' ' and return


def word_cap(string)
  words = string.split(' ')
  words = words.map(&:capitalize)
  words.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
