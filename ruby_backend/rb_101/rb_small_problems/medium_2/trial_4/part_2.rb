BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(str)
#   blocks_arr = []
#   str.chars.each do |char|
#     BLOCKS.each do |block|
#       if char.upcase =~ /[#{block}]/
#         blocks_arr << block
#       end
#     end
#   end
#   blocks_arr.uniq == blocks_arr
# end

# Trial 2 - using - count method

def block_word?(str)
  blocks_used = BLOCKS.count do |block|
    block =~ /[#{str.upcase}]/
  end
  blocks_used == str.size
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true