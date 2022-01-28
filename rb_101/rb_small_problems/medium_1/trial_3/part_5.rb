# print diamond with odd integer as index :
# where n = 9

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
  stars = size - (offset * 2)
  puts ('*' * stars).center(size)
end

def diamond(size)
  center_idx = size / 2

  size.times do |idx|
    offset = (center_idx - idx).abs
    print_star_line(size, offset)
  end
end

diamond(9)