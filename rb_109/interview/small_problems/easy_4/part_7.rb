DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def string_to_integer(str, base = 10)
  arr = str.chars.map { |char| DIGITS.index(char.downcase)}
  num = 0
  arr.each do |digit|
    num = num * base + digit
  end
  num
end

# def hexadecimal_to_integer(str)
#   arr = str.chars.map { |char| DIGITS.index(char.downcase) }
#   num = 0
#   arr.each do |digit|
#     num = num * 16 + digit
#   end
#   num

# end


p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570
p string_to_integer('4D9f', 16)