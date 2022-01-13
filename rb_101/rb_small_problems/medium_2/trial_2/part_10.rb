# Write a method that computes the difference between the square of the 
# sum of the first n positive integers and the sum of the squares of the 
# first n positive integers.

# example n = 3

# (1 + 2 + 3)**2 - (1**2 + 2**2 3**2)
# 36 - (1 + 4 + 9)
# 36 - 14
# 22


def sum_square_difference(n)
  sum = 0
  square_sum = 0

  (1..n).each do |n|
    square_sum += n ** 2
    sum += n
  end

  sum_square = sum ** 2
  result = sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

