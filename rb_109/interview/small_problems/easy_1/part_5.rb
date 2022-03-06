# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# INPUT - string
# OUTPUT - string -> words in the reverse order

# Data Structures - String, Array

# ALGORITHM - 

# split the input string into words using #split
# reverse the array with the words and join with a blank space and return

def reverse_sentence(str)
  str.split.reverse.join(' ')
end




puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''