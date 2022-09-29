# agenda:
# 30 min to solve problem - Nimish


# 30 min to solve problem - Isabel
# last few minutes for feedback

# Hello!

########################
# Nimish
# FEEDBACK

# time: 24:29

#

# Given an array of integer values, find all the 
# duplicated numbers and return an array containing the duplicates

###########

# Input - Array
# Output - Array - new array containing all the duplicate values

# Algorithm - 

# - get all the unique elements in the Array
# - iterate through the elements of the Array
# - add all the duplicates in another array 
# - return the array of duplicates

# def find_duplicates(array)
#   array.uniq.select do |num|
#     array.count(num) > 1
#   end
# end

# p find_duplicates([1, 2, 2, 3, 4]) == [2]
# p find_duplicates([1, 2, 3, 4]) == []
# p find_duplicates([1, 1, 2, 2, 3, 3, 4, 4]) == [1, 2, 3, 4]

########################


# Write amethod that takes an array containing repeated
# elements and returns a two dimensional array
# each sub array contains the repeated elements grouped together


# Input - Array
# Output - Array -> nested, all the same value elements grouped together

# Alogorithm 
# - initialize an empty array -> 'result'
# - get all the unique elements in the array 
# - iterate through the elements
#   - get the number of times the element appears in the input Array
#   - create a temp array and add the element that many number of times 
#   - add the temp array to the result Array
# - return the result Array

# def group_duplicates(array)
#   duplicates = []
#   array.uniq.each do |num|
#     count = array.count(num)
#     duplicates << [num]*count
#   end
#   duplicates
# end

# p group_duplicates([1, 1, 2, 2, 3, 3, 3]) == [[1, 1], [2, 2], [3, 3, 3]]


##################

# given an array of integer values, make a nested
# array containing the values and their quantity
# each subarray contains the value at the first index and its quantity at the second

# Algorithm 
# - - initialize an empty array -> 'result'
# - get all the unique elements in the array 
# - iterate through the elements
#   - get the number of times the element appears in the input Array
#    - create an array with the element and the count as elements
#     - add to the result Array
# - return result Array    

# def find_duplicates(array)
#   counts = []
#   array.uniq.each do |num|
#     counts << [num, array.count(num)]
#   end
#   counts
# end

# p find_duplicates([1, 2, 2, 3, 4]) == [[1, 1], [2, 2], [3, 1], [4, 1]]


#################### ISABEL ###########################
=begin
An anagram is the result of rearranging the letters of a word to produce a new word
Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"

#
Input: two strings
output: boolean
  # true if two strings are anagrams
  # false otherwise

# anagram:
  # two strings contain the same exact letters
  # case insensitive
  # don't have to worry about integers or random characters

# data structure: array


# algorithm:
  # take the first String
  # take the characters of that String
  # take the uniq characters of that Array
  # iterate through that Array
    # string the same number of times as the second string
      #check the count of the letter in first and same with second
    # if this case fails
      # stop iterating return false
  # return true

=end

def is_anagram(str1, str2)
  # handle the uppercase!!!
  test_str = str1
  test_str = str2 if str2.length > str1.length

  test_str.downcase.chars.uniq.each do |char|
    #  p char
    # p str1.downcase.count(char) == str2.downcase.count(char)
    return false unless str1.downcase.count(char) == str2.downcase.count(char)
  end
  true
end

p is_anagram('Creative', 'Reactive') #== true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
p is_anagram('tack', 'kcat')

# Feedback :

# Time taken -> 19 mins

# PEDAC - detailed and quick
#       - not redundant
#       - structured
#       - algorith could have been better (not required for assessment though)
#       - could be a good idea to spend some more time in the algorithm and get a clearer mental mdoel

# One point to think about : As it is already mentioned that both the strings should have the exact same letters, why do we need to check for the length of string



# Code 
# - good grasp of the language and built in methods as well as data structures
# - adequate testing the code 
# - debugging was very quick and efficient (did not get nervous), adequte testing helped in this regard

# Conclusions :


# - Good concept and understanding
# - Debugging was excellent
# - Really confident