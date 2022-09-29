# Write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting with 
# 1. The length of the string should match the given integer.

def stringy(int)
  str = '' # initializing a variable 'str', pointing it to an empty string
  int.times do |n| # calling the times method
    #n.even? ? str << '1' : str << '0'
    str += n.even? ? '1' : '0' # str = str + return value -> {n.even? ? '1' : '0'}
  end
  str
end

puts stringy(6)  == '101010'
puts stringy(9)  == '101010101'
puts stringy(4)  == '1010'
puts stringy(7)  == '1010101'
