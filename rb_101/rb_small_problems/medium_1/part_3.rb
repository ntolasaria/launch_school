# def rotate_array(arr)
#   arr[1..-1] + [arr[0]]
# end

# def rotate_rightmost_digits(int, digits)
#   int_arr = int.to_s.split('')
#   int_arr[-digits..-1] = rotate_array(int_arr[-digits..-1])
#   int_arr.join.to_i
# end

# def max_rotation(int)
#   digits = int.to_s.size
  
#   while digits > 1
#     int = rotate_rightmost_digits(int, digits)
#     digits -= 1
#   end

#   int
# end



def max_rotation(int)
  int_arr = int.to_s.split('')
  max_idx = int_arr.size - 1

  (0..max_idx-1).each do |idx|
    int_arr[idx..max_idx] = int_arr[idx + 1..max_idx] + [int_arr[idx]]
  end

  int_arr.join.to_i # .to_i can be removed to return a string value with all leading zeroes
end




p max_rotation2(735291) #== 321579
p max_rotation2(3) #== 3
p max_rotation2(35) #== 53
p max_rotation2(105) #== 15 # the leading zero gets dropped
p max_rotation2(8_703_529_146) #== 7_321_609_845
  