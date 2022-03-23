# Input - integer - size of diamond
# Output - string - print diamont made of '*'

# Example
# - 5                   7

#   *                   *
#  ***                 ***
# *****               *****
#  ***               *******
#   *                 *****
#                      ***
#                       *

def print_star_line(n, offset)
  stars = n - (offset * 2)
  puts ('*' * stars).center(n)
end

def print_diamond_line(n, offset)
  spaces = n - 2 - (offset * 2)
  if spaces < 0
    puts '*'.center(n)
  else
    puts ('*' + ' ' * spaces + '*').center(n)
  end
end

def diamond(n)
  center = n / 2
  (0...n).each do |idx|
    offset = (center - idx).abs
    print_star_line(n, offset)
  end
end


def diamond_outline(n)
  center = n / 2
  (0...n).each do |idx|
    offset = (center - idx).abs
    print_diamond_line(n, offset)
  end
end

diamond(9)
diamond(19)

diamond_outline(9)
diamond_outline(5)
diamond_outline(19)

