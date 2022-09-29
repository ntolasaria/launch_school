# Write a method that searches for all multiples of 3 or 5 that lie between 1 
# and some other number, and then computes the sum of those multiples. For instance,
# if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Input - Integer
# Output - Integer -> sum of all multiples of 3 and 5 from 1 to num

# Algorithm

# init VAR -> sum = 0
# iterate from 1 to num
# add to sum if divisible by 5 or 3

def multisum(num)
  sum = 0
  1.upto(num) do |n|
    if n % 3 == 0 || n % 5 == 0
      sum += n
    end
  end
  sum
end

# Using Array and #select and #inject

def multisum2(num)
  (1..num).select { |n| n % 3 == 0 || n % 5 == 0 }.inject(:+)

end

p multisum2(3) == 3
p multisum2(5) == 8
p multisum2(10) == 33
p multisum2(1000) == 234168