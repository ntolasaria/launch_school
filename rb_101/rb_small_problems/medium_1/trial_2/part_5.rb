# Write a method that displays a 4-pointed diamond in an n x n grid, 
# where n is an odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.


# Examples :

# 3 - 

#  *
# ***
#  *

# 9 - 

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

def print_star_line(size, offset)
  offset = offset.abs
  num_of_stars = size - (2 * offset)
  puts ('*' * num_of_stars).center(size)
end


def diamond(size)
  center_idx = size / 2
  size.times do |idx|
    print_star_line(size, center_idx - idx)
  end
end

# Further exploration

def print_star_hollow_line(size, offset)
  spaces = size - 2 - (offset.abs * 2)
  if spaces < 0
    puts '*'.center(size)
  else
    puts ('*' + ' ' * spaces + '*').center(size)
  end
end



def diamond_outline(size)
  center_idx = size / 2

  size.times do |idx|
    print_star_hollow_line(size, center_idx - idx)
  end
end


# diamond(1)
# diamond(3)
# diamond(19)

diamond_outline(9)
