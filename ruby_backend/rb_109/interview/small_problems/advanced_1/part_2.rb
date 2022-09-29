# Seeing Stars

# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer 
# that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Examples

# Input - integer (size)
# Output - string printed out in the form of a star of size of the input integer

# Examples

# 7 =>
# *  *  *   spaces -> 2 -> offset -> 3
#  * * *    spaces -> 1 -> offset -> 2
#   ***     spaces -> 0 -> offset -> 1 
# *******   no. of stars == input
#   ***
#  * * *
# *  *  *

# Algorithm :

# - intialize variable `mid` to size / 2
# - iterate from 0 to input - 1
#   - set `offset` current_number - mid -> absolute value
#   - call method print line -> arguments -> size, offset 

# Method print_line

# Input - 2 integers
# Output - print 

# Algorithm -

# - if offset is 0, print '*' * size
# - else
#   - set spaces to (offset - 1)
#   - print -> '*' + spaces + '*' + spaces '*' -> centered to the size


def star(size)
  mid = size / 2
  (0...size).each do |index|
    offset = (index - mid).abs
    print_star_line(size, offset)
  end
end

def print_star_line(size, offset)
  if offset == 0
    puts '*' * size
  else
    spaces = (offset - 1)
    puts ('*' + ' ' * spaces + '*' + ' ' * spaces + '*').center(size)
  end
end





star(19)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *