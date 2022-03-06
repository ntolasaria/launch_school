def print_in_box(str)
  box_size = str.size + 2
  border_line = '+' + '-' * box_size + '+'
  empty_line = '|' + ' ' * box_size + '|'
  text_line = '| ' + str + ' |'
  puts border_line
  puts empty_line
  puts text_line
  puts empty_line
  puts border_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Hello World!')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+