# Given blocks of letters as pairs. 
# Check word shouldnt have both the alphabets from a pair.

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# START
# split input into characters and iterate over every characters


BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

def block_word?(word)
  block_arr = BLOCKS.dup
  word.chars.each do |char|
    if block_arr.any? { |block| char.downcase =~ /[#{block}]/ }
      block_arr.reject! { |block| char.downcase =~ /[#{block}]/ }
    else 
      return false
    end
  end
  true
end

# def block_word?(word)
#   word_downcase = word.downcase
#   BLOCKS.none? { |block| word_downcase.count(block) >= 2 }
# end


p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true


