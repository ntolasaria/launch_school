# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, 
# print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Input - integers -> start, end
# Output - output -> array with numbers from start to end -> Fizz if % 3 =0 , Buzz if %5 = 0, FizzBuzz if both

# Data Structures - integer, array

# Alogrithm -

# Init empty array -> result

# Iterate from start num to end num.

# Check - if %5 and %3 = 0 add 'FizzBuzz' to array
#         if % 3 = 0, add 'Fizz' to array,
#         if % 5 = 0, add 'Buzz' to array,
#         else add num
# Join array with (', ') and return 

def fizzbuzz(first, last)
  result = []
  first.upto(last) do |num|
    if num % 5 == 0 && num % 3 == 0
      result << 'FizzBuzz'
    elsif num % 3 == 0
      result << 'Fizz'
    elsif num % 5 == 0
      result << 'Buzz'
    else
      result << num
    end
  end
  result.join(', ')
end

p fizzbuzz(1, 100)