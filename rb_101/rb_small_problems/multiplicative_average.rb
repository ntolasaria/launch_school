# INPUT - array of integers
# OUTPUT - float (multiplication of all elements divided by array size)

# Rules 
# - float output rounded to three decimal places

def show_multiplicative_average (arr)
  arr_multiplied = 1.0
  arr.each { |num| arr_multiplied *= num }
  result = arr_multiplied / arr.size
  format('%.3f', result)
end

puts show_multiplicative_average([3, 5])                # => The result is 7.500
puts show_multiplicative_average([6])                   # => The result is 6.000
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
