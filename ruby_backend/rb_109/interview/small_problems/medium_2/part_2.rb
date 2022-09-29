# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:

# Input - string
# Output  - boolean
#         - true if two letters are not used from any one of the blocks
#         - false otherwise

# Rules
# - 26 alphabets, 13 blocks of 2 alphabets
# - only one letter from each block can be used
# - case insensitive

# Algorithm
# - Define a constant blocks where each block is an individual string in an array -> all lowercase
# - iterate through the block and check the count of the blocks appearing in the input string
#   - if the count of any one of the blocks is more than one then return false
#   - else true

BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

def block_word?(string)
  BLOCKS.all? do |block|
    string.downcase.count(block) < 2
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
