def sum_square_difference(num)
  sum_of_squares = 0 
  sum = 0

  (1..num).each do |n|
    sum_of_squares += n**2
    sum += n
  end

  (sum**2) - sum_of_squares
end


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

