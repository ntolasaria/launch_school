def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.split('')).join
end

def rotate_rightmost_digits2(int, digits)
  int_array = int.to_s.split('')
  index = int_array.size - digits - 1
  result_arr = []
  if index < 0
    result_arr = rotate_array(int_array)
  else
    result_arr << int_array[0..index] << rotate_array(int_array[(index + 1)..-1])
  end
    result_arr.join.to_i
end

def rotate_rightmost_digits(int, digits)
  int_arr = int.to_s.split('')
  int_arr[-digits..-1] = rotate_array(int_arr[-digits..-1])
  int_arr.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
