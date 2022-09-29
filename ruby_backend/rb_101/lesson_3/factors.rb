def factors(number)
  if number <= 0
    puts "Not a valid input!"
  else 
    divisor = number
    factors = []
    while divisor > 0 
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
    factors
  end
end


num = Kernel.gets().chomp().to_i()
puts factors(num)
