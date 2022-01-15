# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

require 'pry-byebug'

BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm).freeze

def block_word?(word)
  block_arr = []

  word.chars.each do |char|
    BLOCKS.each do |block|
      if char.downcase =~ /[#{block}]/
        block_arr << block
      end
    end
  end
  block_arr.uniq == block_arr

end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true