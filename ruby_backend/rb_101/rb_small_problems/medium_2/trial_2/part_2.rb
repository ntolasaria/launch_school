# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M


# This limits the words you can spell with the blocks to just those words that do
# not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be 
# spelled from this set of blocks, false otherwise.

BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

def block_word?(word)
  blocks_used = BLOCKS.count { |block| block =~ /[#{word.downcase}]/ } # using the count method to determine the number of blocks used to create the word
  blocks_used == word.size # no. of blocks used should be equal to word size, else some block if being used more than once
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true