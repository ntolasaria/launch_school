# Re-order the characters of a string, so that they are concatenated into a new string in 
# "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Input - string
# Output - new string
# Rules - case-insensitively-alphabetical order in order of appearance
#       - whitespace and punctuations to be removed!
#       - no numbers - only alphabets

# Example - "The Holy Bible" =>  "BbeehHilloTy"

# Algorithm 
# - intitialize a new string to the input string with all the whitespace and punctuations removed
# - split the string into individual characters in an array
# - sort the string (alphabetically - case insensitively - order of appearance)
# - 

def alphabetized(string)
  clean_string = string.delete('^a-zA-Z')
  characters = clean_string.split('')
  characters.sort_by! do |char|
    char.downcase
  end
  characters.join
end

# no methods

# def alphabetized(string)
#   clean = string.delete('^a-zA-Z')
#   arr = clean.chars
#   sorted = []
#   loop do 
#     idx = 0
#     sort = false
#     while idx < arr.size - 1
#       if arr[idx].downcase > arr[idx + 1].downcase
#         arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
#         sort = true
#       end
#       idx += 1
#     end
#     break if !sort
#   end
#   arr.join
# end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. 
# Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# def odd_not_prime(num)
#   odds = (1..num).select { |n| n.odd? }
#   odd_not_prime = odds.select { |n| !prime?(n) }
#   odd_not_prime.size

# end

# def prime?(num)
#   return false if num < 2
#   divisors = (2..num/2).each do |n|
#     return false if num % n == 0
#   end
#   true
# end

# p odd_not_prime(15)
# p odd_not_prime(48)
