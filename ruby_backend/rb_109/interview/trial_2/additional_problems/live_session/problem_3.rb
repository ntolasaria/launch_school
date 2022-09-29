# Problem 3: find primes between two numbers
# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

# Input: 2 integers
# Output: array - integers

# Rules:
# - array containing all the prime numbers between the two numbers, including them

# Algorithm:
# - iterate from start no. to end no. and select 
#   - if prime or not

def find_primes(first, last)
  (first..last).select do |num|
    factors = 0
    2.upto(num / 2) do |n|
      factors += 1 if num % n == 0
    end
    num > 1 && factors == 0
  end
end

p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
