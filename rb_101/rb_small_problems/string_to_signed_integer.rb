DIGIT_KEY = {  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9,  'A' => 10, 'B' => 11,
  'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }

def string_to_integer(str, base=10)
  num = 0
  str.reverse!
  str.size.times do |i|
    num += DIGIT_KEY[str[i]] * (base ** i)
  end
  num
end

def string_to_signed_integer(str,base=10)
  if str[0] == '-'
    str.delete!('^0-9A-F')
    -string_to_integer(str, base)
  else
    str.delete!('^0-9A-F')
    string_to_integer(str, base)
  end
end

puts string_to_signed_integer('4321') 
puts string_to_signed_integer('-570') 
puts string_to_signed_integer('+100')