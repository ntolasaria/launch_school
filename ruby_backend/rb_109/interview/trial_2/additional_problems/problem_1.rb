# Problem 1: Reverse a string without using the built-in #reverse method
=begin
take a string as an argument, return the string in reverse order without using the built-in reverse method.

=end

# Input: string
# Output: string

# Rules:
# - string to be reversed
# - built in `reverse` method cannot be used

# Algorithm:
# - init var `reversed`
# - iterate through the characters of the string
# - prepend each character to reversed and return

def reverse_string(string)
  reversed = ''
  string.chars.each { |char| reversed.prepend(char) }
  reversed
end

# Mutating version

def reverse_string!(string)
  mid = string.size / 2
  0.upto(mid - 1) do |idx|
    string[idx], string[-1 -idx] = string[-1 -idx], string[idx]
  end
  string
end

e
# p reverse_string("abcde") == "edcba"
# p reverse_string(" ") == " "
# p reverse_string("football") == "llabtoof"

str = "abcde"
p reverse_string!(str) == "edcba"
p str
p reverse_string!(" ") == " "
p reverse_string!("football") == "llabtoof"
