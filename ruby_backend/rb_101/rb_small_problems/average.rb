def average(array)
  size = array.length
  total = 0

  array.each { |n| total += n }

  total.to_f/size.to_f
end

puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])