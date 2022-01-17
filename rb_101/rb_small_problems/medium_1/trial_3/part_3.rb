def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, digits)
  arr = num.to_s.split('')
  arr[-digits..-1] = rotate_array(arr[-digits..-1])
  arr.join.to_i
end

def max_rotation(num)
  size = num.to_s.size
  size.downto(2) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
