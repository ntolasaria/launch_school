# Write a method to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower", "flow", "flight"]
# Output: "fl"

# Example 2:

# Input: ["dog", "racecar", "car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Note: 

# All given inputs are in lowercase letters a-z

# Input: array - strings
# Output: string

# Rules:
# - longest common prefix in all strings
# - all lowercase letters (a-z)
# - if no common prefix then return ''

# Algorithm:
# - init variable `prefix` to empty string
# - sort the array according to the string length
# - iterate through the characters of the first element (smallest size)
#   - for each letter check if the same letter is at that index of the other strings
#   - if yes add the letter to `prefix`
#   - else return `prefix`


def common_prefix(array)
  prefix = ''
  array = array.sort_by { |str| str.size }
  smallest_string = array.shift
  smallest_string.chars.each_with_index do |char, index|
    if array.all? { |str| str[index] == char}
      prefix << char
    else
      return prefix
    end
  end
  prefix
end

arr = %w(flower flow flight)
p common_prefix(arr) == "fl"
p arr
p common_prefix(%w(dog racecar car)) == ""
p common_prefix(%w(interspecies interstellar interstate)) == "inters"
p common_prefix(%w(throne dungeon)) == ""
p common_prefix(%w(throne throne)) == "throne"

