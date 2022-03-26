# Matching Parentheses?

# Write a method that takes a string as an argument, and returns true if all parentheses 
# in the string are properly balanced, false otherwise. To be properly balanced, parentheses 
# must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

# Input - string
# Output  - boolean
#         - true if parantheses are balanced 
#         - false if not

# Algorithm - 
# - delete all characters from string apart from '(' and ')' referenced by a new variable clean string
# - initialize a variable balance to 0
# - iterate thorugh chracters of clean string
# - if the character is '(' add 1 to balance
# - if the character is ')' add -1 to balance
# - if at any moment of time during iterating balance is negative, false must be immediately returned

# - after iteration check is balance == 0
#   - if yes then true else false


def balanced?(string)
  clean_string = string.delete('^()')
  balance = 0
  clean_string.chars.each do |char|
    balance += 1 if char == '('
    balance -= 1 if char == ')'
    break if balance < 0
  end
  balance == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

