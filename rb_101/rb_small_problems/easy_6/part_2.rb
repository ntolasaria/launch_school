VOWELS = %w(a e i o u)

# def remove_vowels(arr)
#   arr = arr.map do |str|
#     str.chars.select { |char| !VOWELS.include?(char.downcase) }.join
#   end
#   arr
# end

# Option 2 - Launch School Solution

def remove_vowels(str)
  str.map { |string| string.delete('aeiouAEIOU') }
end



p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']