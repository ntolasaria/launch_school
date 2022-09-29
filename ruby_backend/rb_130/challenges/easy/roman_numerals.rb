# I - 1
# V - 5
# X - 10
# L - 50
# C - 100
# D - 500
# M - 1000
# V - 5000

# 1990

# 1 * 10 ^3 = 1000 -> M
# 9 * 10^2 = 900 -> CM
# 9 * 10^1 = 90 -> XC

class RomanNumeral
  ROMAN_NUMERALS = { 0 => ['I', 'V'], 1 => ['X', 'L'], 2 => ['C', 'D'], 3 => ['M'] }
  
  def initialize(number)
    @number = number
  end

  def to_roman
    roman = @number.digits.map.with_index do |digit, position|
      case digit
      when (1..3) then ROMAN_NUMERALS[position][0] * digit
      when 4      then ROMAN_NUMERALS[position].join
      when 5      then ROMAN_NUMERALS[position][1]
      when (6..8) then ROMAN_NUMERALS[position][1] + ROMAN_NUMERALS[position][0] * (digit - 5)
      when 9      then ROMAN_NUMERALS[position][0] + ROMAN_NUMERALS[position + 1][0]
      end
    end
    roman.reverse.join
  end
end


# # def time_it
# #   start_time = Time.now
# #   yield
# #   finish_time = Time.now
# #   puts "The time taken was: #{finish_time - start_time} seconds!"
# # end

# # arr = (1..3000).to_a
# # array = []

# # 100.times { array += arr }

# # array.shuffle!

# # time_it do
# #   array.each do |num|
# #     RomanNumeral.new(num).to_roman
# #   end
# # end


# # time_it do
# #   array.each do |num|
# #     RomanNumeralLS.new(num).to_roman
# #   end
# # end

# p RomanNumeral.new(3001).to_roman 