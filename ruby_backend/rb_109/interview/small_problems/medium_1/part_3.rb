# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_rightmost_digits(number, digits)
#   array = number.to_s.chars
#   array[-digits, digits] = rotate_array(array[-digits, digits])
#   array.join.to_i
# end

# def max_rotation(number)
#   size = number.to_s.size

#   size.downto(1) do |digits|
#     number = rotate_rightmost_digits(number, digits)
#   end
#   number
# end


def max_rotation(number)
  array = number.digits.reverse
  size = array.size

  size.downto(1) do |digits|
    rotate = array[-digits, digits]
    array[-digits, digits] = rotate[1..-1] + [rotate[0]]
  end
  number = array.join.to_i
  str = format("%0#{size}d", number)
  str.to_i
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

p max_rotation(1000203) 