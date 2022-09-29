# Study session - 13/04/2022

# Tips
# - use PEDAC
# - write implementation details
# - write rules properly



# Problem 1

# You are given an array strarr of strings and an integer k. Your task is to 
# return the first longest string consisting of k consecutive strings taken in the array.

# #Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".


# Input: array of strings, integer (k)
# Output: string

# Rules:

# - first longest consecutive string consisting of k consecutive strings

# Algorithm:
# - initialize empty array - lengths
# - reassign `lengths` to the input array transformed to the string lengths of each string
# - get all the possible string lengths for the `k` no. of joined strings at each position
# - find the first appearing greatest length
# - return the corresponding joined string

# def longest_consec(array, k)
#   return '' if k > array.size || k <= 0 
#   joined_strings = []
#   0.upto(array.size - k) do |index|
#     joined_strings << array[index, k].join
#   end
#   joined_strings.max_by { |str| str.length } 
# end


# p longest_consec(["a", "ab", "abc", "d", "ee", "abcde", "bbb"], 6) == "ababcdeeabcdebbb"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
# p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
# p longest_consec([], 3) == ""
# p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
# p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""


# You are given an array which contains only integers (positive and negative). 
# Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]


# Input: array 
# Output: array
# Rules: Add elements that are the same

# Algorithm
# - init `result` - empty array
# - add the first element to `result`
# - iterate through input array
#   - if current element is equal to the previous element
#     - increment the last `[-1]` element of `result`
#   - else add the element to the result array

def sum_consecutives(array)
  result = []
  result << array.first
  1.upto(array.size - 1) do |index|
    if array[index] == array[index - 1]
      result[-1] += array[index]
    else
      result << array[index]
    end
  end
  result
end



p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
  