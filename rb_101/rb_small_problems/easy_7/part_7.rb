def show_multiplicative_average(arr)
  result = (arr.inject(:*).to_f / arr.size)
  puts "The result is #{format('%.3f', result)}"
end


show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667