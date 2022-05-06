# Problem 1: Substring at index
=begin
Write a method that will return a substring based on specified indices.
=end

# Input: string, integer, optional integer
# Output: string - substring based on indices specified integers

# Rules:
# - if second integer is not given, return only the character at the first index
# - if second integer is out of bounds, return the string till the end

# Algorithm:
# - method parameters, string, index1, index2(default value to index1)
# - return the substring -> string[index1..index2]

def substring(string, index1, index2=index1)
  string[index1..index2]
end

p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2) == "n"
