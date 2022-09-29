# A featured number (something unique to this exercise) is an odd number that is a multiple
# of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number,
# but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not 
# (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured 
# number that is greater than the argument. Return an error message if there is no next 
# # featured number.

# Input - integer
# Output - integer - featured number

# Rules
# Featured Number:
# - odd
# - multiple of 7
# - digits occur exactly once each

# Algorithm - 
# - increment the number to make it an odd multiple of 7
# - start loop
#   - check if the digits of num occur only once
#   - if yes then return the number
#   - increment the number by 14
#   - additional break condition if the number exceeds 9876543210
# - if nothing is returned till now then return 'There is no.......'

def featured(number)
  number += 1
  number += 1 until number % 7 == 0 && number.odd?
  
  loop do
    return number if number.to_s.chars.uniq == number.to_s.chars
    number += 14
    break if number > 9876543210
  end

  'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
