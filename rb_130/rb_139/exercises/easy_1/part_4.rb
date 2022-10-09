# Problem: find the divisors of a given integer

# Input: integer
# Output: array
# - containg all the unique divisors

# Algorithm:
# - result = []
# - iterate from 1 to square root of Input
#   - check if number % current_number = 0
#     - if true
#     - add the current_number to results
#     - add number / current_number to results

def divisors(number)
  result = []
  1.upto(Math.sqrt(number)) do |num|
    if number % num == 0
      result << num
      result << number / num unless number == 1
    end
  end
  result.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]