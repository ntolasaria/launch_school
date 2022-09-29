# def diamond(int)


#   star_count = 1
#   opp_star_count = int

#   centerline = (int / 2) + 1

#   (1..int).each do |line|
    
#     if line <= centerline
#       puts ('*' * star_count).center(int)
#       star_count += 2
#     end

#     if line > centerline
#       opp_star_count -= 2
#       puts ('*' * opp_star_count).center(int)
#     end
#   end



      




#   # while star_count <= int
#   #   puts ('*' * star_count).center(int)
#   #   star_count += 2
#   # end


#   # while star_count > 0
#   #   star_count -= 2
#   #   puts ('*' * star_count).center(int)
#   # end
  
# end

def print_row(size, center_offset)
  star_count = size - (2 * center_offset)
  puts ('*' * star_count).center(size)
end

def diamond(size)
  centerline = size / 2
  centerline.downto(0) { |dist| print_row(size, dist) }
  1.upto(centerline) { |dist| print_row(size, dist) }
end

def print_row_outline(size, center_offset)
  star_count = size - (2 * center_offset)
  space_count = star_count - 2
  if space_count < 0 
    puts ('*').center(size)
  else 
    row_str = (' ' * space_count).center(star_count, '*')
    puts row_str.center(size)
  end
end

def diamond_outline(size)
  centerline = size / 2
  centerline.downto(0) { |offset| print_row_outline(size, offset) }
  1.upto(centerline) { |offset| print_row_outline(size, offset) }
end



diamond_outline(39)