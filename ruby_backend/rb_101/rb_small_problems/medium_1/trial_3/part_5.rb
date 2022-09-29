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

# Further Exploration :

def print_hollow_star_line(size, offset)
  spaces = size - 2 - (offset * 2)
  if spaces < 0
    puts '*'.center(size)
  else
    puts ('*' + ' '* spaces + '*').center(size)
  end
end

def diamond_outline(size)
  center_idx = size / 2
  size.times do |idx|
    offset = (center_idx - idx).abs
    print_hollow_star_line(size, offset)
  end
end

diamond(9)
diamond_outline(9)