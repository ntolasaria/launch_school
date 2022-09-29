def prompt(msg)
  puts ">> #{msg}"
end

loop do 
  prompt('Please enter an integer greater than 0:')
  num = gets.chomp.to_i
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = gets.chomp
  if operation.downcase.start_with?('s')
    sum = (1..num).to_a.reduce(:+)
    prompt("The sum of the integers between 1 and #{num} is #{sum}.")
  elsif operation.downcase.start_with?('p')
    product = (1..num).to_a.reduce(:*)
    prompt("The product of integers between 1 and #{num} is #{product}.")
  else
    break
  end
end

