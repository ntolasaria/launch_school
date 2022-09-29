# Write a method that counts the number of occurrences of each element in a given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# INPUT - array of strings 
# OUTPUT - text showing the number times each string is repeated in the input array

# Data Structures - Array and Hash (for output)

# ALGORITHM
# Initialize empty hash with default value 0
# Iterate through input array and look for keys in the hash with the same value of the string.
#   If key exists increment the value by 1
#   If key doesnt exist then create key-value pair with value 1

# Iterate through hash and output in the desired for "key => value"

def count_occurrences(arr)
  hash = Hash.new(0)
  arr.each do |str|
    hash[str] += 1
  end
  hash.each { |key, val| puts "#{key} => #{val}"}
end

def count_occurrences2(arr)
  arr.uniq.each do |str|
    puts "#{str} => #{arr.count(str)}"
  end
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences2(vehicles)


