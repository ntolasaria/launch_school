=begin

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=end

# Input - array of integers
# Output - array of 2 Integer

# Rules
# - output the numbers closest in value as elements of an array
# - all integers are greater than 0

# Test case
# - [5, 25, 15, 11, 20]
# - [5, 11, 15, 20, 25]
# difference - [6, 4, 5, 5]

# Algorithm
# - initialize `sorted_array` to the sorted version of input Array
# - iterate through the array and get the differences between adjacent elements
# - output the elements with the minimum difference as an Array
# - 


# def closest_numbers(array)
#   sorted_array = array.sort
#   differences = []
#   0.upto(array.size - 2) do |index|
#     differences << sorted_array[index + 1] - sorted_array[index]
#   end
#   min_index = differences.index(differences.min)
#   num1 = sorted_array[min_index]
#   num2 = sorted_array[min_index + 1]

#   array.select do |num|
#     num == num1 || num == num2
#   end
# end

# Cameron

def closest_numbers(array)
  pairs = []

  result = []
  difference = array.sort[-1] - array.sort[0]

  0.upto(array.size - 2) do |starting_index|
    (starting_index + 1).upto(array.size - 1) do |ending_index|
      pairs << [array[starting_index], array[ending_index]]
    end
  end

  pairs.each do |pair|
    pair_diff = pair.sort[-1] - pair.sort[0]
    if difference > pair_diff
      difference = pair_diff
      result = pair
    end
  end

  result
end



p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# Cameron

=begin

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

input: string
output: the char that occurs least often in the given string

rules:
-case-insensitive - When counting characters, consider the uppercase and
# lowercase version to be the same.
-for multiple chars with the equal lowerst number of occurences, return the one that appears first
-spaces and non-alphabetic chars count
-the returned char will be lowercase

data structures:
"Hello World"
make all chars lowercase first and store -> "hello world"
break string into an array and store it

count each char and store it along with the char
count = 1
char = 'h'

'h' -> 1
'e' ->



return -> 'h'


algorithm:
1. setup our variables

-init lowercase to lowercase input string
-init chars array to lowercase broken into chars

-init count variable to hold the count of each char
--assign count to lowercase.count(lowercase[0])
-init char variable to hold the char with the lowest count
--assign char to lowercase[0]

2. count each char and store the lowest occuring char along with its count in the String

-iterate through the chars array
--for each letter compare the count in the string with the stored count
--if it's lower then replace the count and the char in char variable

3. return char variable


=end

def least_common_char(string)
  lowercase = string.downcase
  chars = lowercase.chars
  count = lowercase.count(lowercase[0])
  char = lowercase[0]

  chars.each do |letter|
    if lowercase.count(letter) < count
      count = lowercase.count(letter)
      char = letter
    end
  end

  char
end


p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'


# 16 mins