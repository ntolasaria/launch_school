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

# Input - array of strings
# Output - string -> longest common prefix

# Method 

# find the smallest string in the array.  - str 
# init - prefixes
# break into all possible prefixes:
#   Loop - 0 to string length - 1 - length
#     prefixes << str.slice(0, length)
#   end
# iterate through prefixes and select all the prefixes that matches with all the strings in the input array #include
# return the longest string amongnst the selected ones

# def common_prefix(arr)
#   str = arr.min_by { |string| string.size }
#   prefixes = []
#   1.upto(str.size) { |length| prefixes << str.slice(0, length) }

#   prefixes.select! do |prefix|
#     arr.all? { |string| string.include?(prefix) }
#   end
  
#   return "" if prefixes.empty?

#   prefixes.max_by { |prefix| prefix.size }
# end

# Launch School way - 

def common_prefix(arr)
  str_size = arr.min_by { |str| str.size }.size
  result = ''
  str_size.times do |idx|
    char = arr.first[idx]
    if arr.all? { |str| str[idx] == char }
      result << char
      next
    end
    break
  end

  result


end



p common_prefix(%w(flower flow flight)) == "fl"
p common_prefix(%w(dog racecar car)) == ""
p common_prefix(%w(interspecies interstellar interstate)) == "inters"
p common_prefix(%w(throne dungeon)) == ""
p common_prefix(%w(throne throne)) == "throne"
