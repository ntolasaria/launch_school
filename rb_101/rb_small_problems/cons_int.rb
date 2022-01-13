puts "Please enter an integer greater than 0:"
input = Kernel.gets().chomp().to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
calc_op = Kernel.gets().chomp()

if calc_op.downcase.start_with?('s')
  sum = (1..input).inject(:+)
  puts "The sum of the integers between 1 and #{input} is #{sum}"
elsif calc_op.downcase.start_with?('p')
  product = (1..input).inject(:*)
  puts "The product of the integers between 1 and #{input} is #{product}."
end



