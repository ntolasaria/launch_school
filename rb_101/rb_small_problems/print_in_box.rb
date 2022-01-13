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

def print_in_box(str)
  box_width = str.length + 4
  horizontal_line = "+#{'-' * (box_width - 2)}+"
  empty_line = "|#{' ' * (box_width - 2)}|"
  puts horizontal_line
  puts empty_line
  puts "| #{str} |"
  puts empty_line
  puts horizontal_line
end

puts "Type a string to put in a box:"
string = Kernel.gets().chomp()
print_in_box(string)
