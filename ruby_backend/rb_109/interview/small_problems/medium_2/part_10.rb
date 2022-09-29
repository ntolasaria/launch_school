# Write a method that computes the difference between the square of the sum of the 
# first n positive integers and the sum of the squares of the first n positive integers.

# Input - integer
# Output - integer - difference between square of the sum and the sum of squares

# Alogrithm

# - initialize variables sum and square_sum to 0
# - iterate from 1 to the input number
#   - on every iteration increment the sum variable by the current number
#   - on every iteration increment the square_sum variable by the square of the current number
# - return the difference of the sum (squared) - square_sum

def sum_square_difference(number)
  sum, square_sum = 0, 0
  1.upto(number) do |num|
    sum += num
    square_sum += num * num
  end
  (sum * sum) - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
