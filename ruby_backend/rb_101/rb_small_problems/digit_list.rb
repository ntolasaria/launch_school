# def digit_list(num)
#   num.digits.reverse
# end

# input - integer
# output - array - digits of the integer

def digit_list(num)
  result = []
  return [0] if num == 0
  while num > 0
    digit = (num % 10)
    result.unshift(digit)
    num /= 10 # num = num / 10 
  end
  result
end




p digit_list(0) == [0]
p digit_list(12345) == [1,2,3,4,5]
p digit_list(7) == [7]
p digit_list(375290) == [3,7,5,2,9,0]
p digit_list(444) == [4,4,4]

