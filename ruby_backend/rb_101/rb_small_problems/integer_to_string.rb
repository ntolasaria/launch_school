DIGITS = %w(0 1 2 3 4 5 6 7 8 9) 
def integer_to_string(int)
  str = ''
  digit = 0
  loop do
    digit = int % 10
    str.prepend(DIGITS[digit])
    int /= 10
    break if int == 0
  end
  str
end

def signed_integer_to_string(int)
  str = ''
  if int < 0
    str = integer_to_string(-int)
    str.prepend('-')
  elsif int > 0
    str = integer_to_string(int)
    str.prepend('+')
  else
    '0'
  end
end

    
puts signed_integer_to_string(4321) 
puts signed_integer_to_string(-123) 
puts signed_integer_to_string(0)