# Class - Anagram

# Constructor:
# - 1 argument - string

# Method: `match`

# Input - array of string(s)
# Output - array containing anagrams but not the same word

class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    array.select do |anagram|
      is_anagram?(anagram)
    end
  end

  private

  def is_anagram?(other_word)
    @word.downcase.chars.sort == other_word.downcase.chars.sort &&
    @word.downcase != other_word.downcase
  end
end