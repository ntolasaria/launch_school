# START
# input - string
# output - string with box of dashes around input string
# METHOD - print_in_box
# GET length of input string
# SET box_width = string.length + 4 (2 for each side)
# PRINT - line 1 - [0] and [-1] '+' - in between '-'
#       - line 2 - [0] and [-1] '|'
#       - line 3 - [0] - '|' centered input string' - [-1] - '|'
#       - line 4 - [0] and [-1] '|'
#       - line 5 - [0] and [-1] '+' in between '-'
require 'pry-byebug'

def text_wrap_lines(str) # character wise breaking
  lines = []
  temp_arr = []
  str.chars.each do |char|
    if temp_arr.length < 76
      temp_arr << char
      next
    end
    lines << temp_arr.join
    temp_arr = []
    temp_arr << char
  end
  lines << temp_arr.join

end


def generate_lines(str) # word wise breaking
  temp_arr = []
  lines = []
  return lines << str if str.length <= 76
  str.split.each do |words|
    length = temp_arr.join(' ').length
    if (length + words.length + 1) <= 76
      temp_arr << words
    else
      lines << temp_arr.join(' ')
      temp_arr = []
      temp_arr << words
    end
  end
  lines << temp_arr.join(' ')
end

def print_lines(lines, text_width)
  horizontal_line = "+#{'-' * (text_width + 2)}+"
  empty_line = "|#{' ' * (text_width + 2)}|"
  puts horizontal_line
  puts empty_line
  
  lines.each { |line| puts "| #{line.center(text_width)} |" }

  puts empty_line
  puts horizontal_line
end



def print_in_box(str)
  # str = str.slice(0, 76) if str.length >= 76 # Further Exploration - Part 1

  lines = text_wrap_lines(str)
  
  text_width = [str.length, 76].min

  print_lines(lines, text_width)
  

end

puts "Type a string to put in a box:"
string = Kernel.gets().chomp()
print_in_box(string)


# Further exploration

# the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog 
# Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet lorem ullamcorper, finibus leo eget, tristique lectus. Ut dapibus in lorem ac rhoncus. Vivamus placerat aliquet mi vulputate ullamcorper. Duis sapien nulla, egestas at velit in, maximus tempor augue. Vivamus molestie elit sed purus pharetra, blandit vehicula magna eleifend. Vestibulum commodo molestie nibh vitae pellentesque. Duis ipsum mauris, mattis nec ante ultricies, vestibulum venenatis lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed sed viverra ipsum, at dignissim sapien. Aenean eros ipsum, pulvinar vitae felis eget, aliquam laoreet justo. Quisque consequat diam purus, at suscipit sem elementum ac. Proin vestibulum, purus eu feugiat suscipit, dui orci bibendum augue, nec hendrerit ante odio eu odio.