DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def integer_to_string(int)
  str = ''
  loop do
    str.prepend(DIGITS[int % 10])
    int /= 10
    break if int == 0
  end
  str
end

def signed_integer_to_string(integer)
  case integer <=> 0
  when -1 then "-#{integer_to_string(integer.abs)}"
  when 1  then "+#{integer_to_string(integer)}"
  else         '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'