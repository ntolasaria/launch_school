# Class - Scrabble

# Constructor: 1 argument - word

# Method: `score`

# Output: scrabble score integer

# scorring as follows:

# Letter	Value
# A, E, I, O, U, L, N, R, S, T	    1
# D, G	                            2
# B, C, M, P	                      3
# F, H, V, W, Y	                    4
# K	                                5
# J, X	                            8
# Q, Z	                            10

class Scrabble
  SCORES = { 1 => 'aeioulnrst',
    2 => 'dg',
    3 => 'bcmp',
    4 => 'fhvwy',
    5 => 'k',
    8 => 'jx',
    10 => 'qz' }

  def initialize(word)
    @word = word ? word.downcase : ''
  end

  def score
    result = 0
    SCORES.each do |points, letters|
      count = @word.chars.count { |char| letters.include?(char) }
      result += points * count
    end
    result
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
