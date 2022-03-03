# The aim of the kata is to decompose n! (factorial n) into its prime factors.

# Examples:

# n = 12; decomp(12) -> "2^10 * 3^5 * 5^2 * 7 * 11"
# since 12! is divisible by 2 ten times, by 3 five times, by 5 two times and by 7 and 11 only once.

# n = 22; decomp(22) -> "2^19 * 3^9 * 5^4 * 7^3 * 11^2 * 13 * 17 * 19"

# n = 25; decomp(25) -> 2^22 * 3^10 * 5^6 * 7^3 * 11^2 * 13 * 17 * 19 * 23
# Prime numbers should be in increasing order. When the exponent of a prime is 1 don't put the exponent.

# Notes

# the function is decomp(n) and should return the decomposition of n! into its prime factors in increasing order of the primes, as a string.
# factorial can be a very big number (4000! has 12674 digits, n can go from 300 to 4000).
# In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.

# PEDAC - 

# Problem - Given an integer, decompose its factorial into its prime factors
#         Input - integer
#         Output - string 

# Example -

# #         Input - 12
# #         Output - "2^10 * 3^9 * 5^2 * 7 * 11"

# Find the primes upto n and store in an array

require 'pry-byebug'

def primes_array(n)
  (1...n).select do |num|
    factors = 0
    1.upto(num) do |check|
      factors += 1 if num % check == 0
    end
    factors == 2
  end
end



def decomp(n)
  primes = primes_array(n)
  
  prime_factors = []
  factorial = 1
  
  (1..n).each { |num| factorial *= num }
  
  primes.size.times do 
    current_prime = [primes.pop, 0]
    
    while factorial % current_prime[0] == 0
      factorial /= current_prime[0]
      current_prime[1] += 1
    end
    prime_factors << current_prime
  end

  prime_factors.reverse!.map! do |arr|
    if arr[1] == 1
      "#{arr[0]}"
    else
      arr.join('^')
    end
  end

  prime_factors.join(' * ')
    


end




p decomp(12)
p decomp(1000)