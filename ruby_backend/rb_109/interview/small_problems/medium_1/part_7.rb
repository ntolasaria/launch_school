# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# # Example:

# Input - string
# Output - string -> numbers in words converted to digits

DIGITS = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  # words = string.split(' ')
  DIGITS.each do |digit|
    string.gsub!(/\b#{digit}\b/, "#{DIGITS.index(digit)}")
  end
  string
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('Check if freight is convereted to eight!')