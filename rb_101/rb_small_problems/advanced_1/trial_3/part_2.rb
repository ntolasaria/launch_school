# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

def print_star_line(size, offset)
  if offset == 0
    puts '*' * size
  else
    gap = (offset - 1)
    puts "*#{' ' * gap}*#{' ' * gap}*".center(size)
  end
end

def star(size)
  center_idx = size / 2
  size.times do |idx|
    offset = (center_idx - idx).abs
    print_star_line(size, offset)
  end
end

star(19)
