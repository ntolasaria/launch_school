# 7

# *||*||*
# |*|*|*|
# ||***||
# *******


def print_star_line(size, center_offset)
  if center_offset == 0
    puts '*' * size
  else
    star_gap = (center_offset.abs - 1)
    puts "*#{' ' * star_gap}*#{' ' * star_gap}*".center(size)
end

# def star(size)
#   center_idx = size / 2

#   (0...center_idx).each do |idx|
#     center_offset = center_idx - idx
#     print_star_line(size, center_offset)
#   end
#   puts '*' * size
#   (1..center_idx).each do |idx|
#     print_star_line(size, idx)
#   end


end

def star(size)
  center_idx = size / 2

  size.times do |idx|
    print_star_line(size, center_idx - idx)
  end

end

#star(7)
star(19)
