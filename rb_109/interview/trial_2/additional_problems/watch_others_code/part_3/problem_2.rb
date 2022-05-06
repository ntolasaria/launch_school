# Problem 2: Common Prefix
=begin
Write a method to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string,

All given inputs are in lowercase letters a-z.
=end

# Input: array of strings
# Output: string - longest common prefix 

# Rules:
# - if no common prefix exists, return ''
# - all inputs are lowercase a-z

# Algorithm:
# - init var `prefix` to ''
# - sort the array according to string size and reassign to variable
# - iterate through the characters of first string
#   - check if all the other strings have the same character at that index
#   - if yes, append the character to `prefix`
#   - if no return prefix
# -

def common_prefix(array)
  prefix = ''
  array = array.sort_by(&:size)
  characters = array.shift.chars
  characters.each_with_index do |char, idx|
    if array.all? { |str| str[idx] == char }
      prefix << char
    else
      break
    end
  end
  prefix
end

arr = ["flower", "flow", "fliwht"]
puts common_prefix(arr) == "fl"
p arr
puts common_prefix(["dog", "racecar", "car"]) == ""
puts common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
puts common_prefix(["throne", "dungeon"]) == ""
puts common_prefix(["throne", "throne"]) == "throne"
