# Problem 3: Palindromes
# Write a method that will return all palindromes within a string.
def longest_palindrome(string)
  palindromes(string).max_by(&:size)

end


def palindromes(string)
  substrings = substrings(string)
  substrings.select { |str| palindrome?(str) }
end

def substrings(string)
  substrings = []
  0.upto(string.size - 2) do |index|
    2.upto(string.size - index) do |length|
      substrings << string[index, length]
    end
  end
  substrings
end

def palindrome?(string)
  string.reverse == string
end

p palindromes('ppop') == ['pp', 'pop']

# Write a method that finds the longest substring that is a palindrome within a string.
p longest_palindrome("ppop") == 'pop'
