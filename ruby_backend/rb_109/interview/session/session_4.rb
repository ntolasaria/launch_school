# 1. Mexican Wave

=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules

1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
=end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]


# 2. Scramblies

# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
=begin
Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
=end
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true



# --------------------------
# 3. Number in expanded form 

# Write Number in Expanded Form

# You will be given a number and you will need to return it as a string in Expanded Form. For example:

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

# NOTE: All numbers will be whole numbers greater than 0.




=begin

Write a method that takes a string and returns
the sum of the odd integers within the string:

=end

# Input - String
# Output - integer(sum of all the odd integers within the String)

# Rules - add all the odd integers in the String

# - consecutive odd integers make a bigger integer 
# - example - 11 -> 11 not 1 + 1

# Algorithm - 

# - split the string to get an array of all the consecutive integers as spearate elements  - `numbers`
# - iterate through and select all the non empty strings
# - iterate through and check the intgers :
#     - if odd - add to sum
#     - if not move ahead

# - return the sum

# def sum_of_numbers(string)
#   # numbers = 
#   string.scan(/[0-9]+/).map(&:to_i).select{|v| v.odd?}.sum
#   # numbers = numbers.reject do |el|
#   #   el.to_i.even?
#   # end
#   # numbers.map(&:to_i).sum
#   # sum = 0
#   # numbers.each do |num_str|
#   #   num = num_str.to_i
#   #   sum += num if num.odd?
#   # end
#   # sum

# end


# p sum_of_numbers("Oh wh4t a be4ut1fu1 day 1t is" ) == 3
# p sum_of_numbers("3apple 7orange 2banana" ) == 10
# p sum_of_numbers("He110 world") == 0
# p sum_of_numbers("He113 world") == 113
# p sum_of_numbers("123a456") == 123
# p sum_of_numbers("No numbers here!") == 0


# Time: 10:31


###########




# 3. Number in expanded form 

# Write Number in Expanded Form

# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# input: Integer
# output : string 
#   * the expanded form of the Integer
#   * hundreds + tens + ones

# 7 0 3 0 4 -> '70000 + 300 + 4'
# * skip any place value that is Zero
# all positive

# data structure: array

# Algorithm
# empty array to store the numbers
# store a counter that starts at 1
# divmod on the integer to get the last digit
# loop until remainder is 0
  # If digit is 0
    # do nothing
  # if it isn't
    # multiply this digit by the counter
    # append this value to the array
#  multiply counter by 10
# return this array joined by ' + '

# def expanded_form(num)
#   expanded_numbers = []
#   placeholder = 1
#   loop do 
#     num, digit = num.divmod(10)
#     if digit != 0
#       expanded_numbers.prepend(digit * placeholder)
#     end
#     placeholder *= 10
#     break if num <= 0
#   end
#   expanded_numbers.join(" + ")
# end

# p expanded_form(12) == '10 + 2'
# p expanded_form(42) == '40 + 2'
# p expanded_form(70304) == '70000 + 300 + 4'

# NOTE: All numbers will be whole numbers greater than 0.

# ## 13:22




# An anagram is the result of rearranging the letters of a word to produce a new word
# Note: anagrams are case insensitive

# Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

# Examples
# "foefet" is an anagram of "toffee"

# "Buckethead" is an anagram of "DeathCubeK"


# def is_anagram(str1, str2)
#   # handle the uppercase!!!
#   return false unless str1.length == str2.length
  
#   str1.downcase.chars.uniq.each do |char|
#     #  p char
#     # p str1.downcase.count(char) == str2.downcase.count(char)
#     return false unless str1.downcase.count(char) == str2.downcase.count(char)
#   end
#   true
# end


# c a b    -> b a c 
# a b c    -> a b c 

def is_anagram(str1, str2)
  str1.downcase.chars.sort == str2.downcase.chars.sort
end



p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false



