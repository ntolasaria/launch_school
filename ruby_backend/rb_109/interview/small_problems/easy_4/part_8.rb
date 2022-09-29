DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def string_to_integer(str, base = 10)
  arr = str.chars.map { |char| DIGITS.index(char.downcase)}
  num = 0
  arr.each do |digit|
    num = num * base + digit
  end
  num
end

def string_to_signed_integer(string, base = 10)
  if string[0] == '+'
    string_to_integer(string[1..-1], base)
  elsif string[0] == '-'
    -string_to_integer(string[1..-1], base)
  else
    string_to_integer(string, base)
  end
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
p string_to_signed_integer('-4D9f', 16) 