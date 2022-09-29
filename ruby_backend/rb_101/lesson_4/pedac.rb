# PROBLEM
# input : string
# output : string (not the same object)
# rules :
#       Explicit requirements :
#       - every palindrome in the substrings (2 and above) must be 
#         uppercased. 
#       - palindromes are case sensitive ('Mom is not palindrome, mom is')
#
#       Implicit requirements :
#       - the returned string should not be the same object
#       - if the string is empty return should be an empty string
#
# METHOD substrings - Algorithm
# loop through each starting index from 0 to 1 before last.
#   for each substring staring from length 2 to the max possible for that position
#     extract all substrings of the all lengths at the index position
#   end of inner loop
# end of outer loop
# 
# METHOD substrings - pseudo code
# 
# START
#   /* Given a string named 'string' */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2 (LOOP 1)
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index (LOOP 2)
#       SET substring = num_chars characrters from string starting at starting_index
#       append substring to result array
#       SET num_chars += 1
#     END of LOOP 2
#     SET starting_index += 1
#   END of LOOP 1
#   RETURN result
# END

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= (str.length - 2))
    num_chars = 2
    while num_chars <= (str.length - starting_index)
      result << str.slice(starting_index, num_chars)
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

# METHOD - is_palindrome?
# takes string returns true or false
# check value is equal to reversed value using String#reverse methos

def is_palindrome?(str)
  str == str.reverse
end

# METHOD - palindrome_substrings
# input - string 
# output - array of substrings that are palindromes
# 
# call substrings METHOD and save result in an array called substrings_arr
# iterate over substrings_arr using EACH and check using is_palindrome? METHOD
# if true save it to a new array called result
# return the result array

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    if is_palindrome?(substring)
      result << substring
    end
  end
  result
end



p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []




