def remove_vowels(arr)
  arr.each do |word|
    word.gsub!(/[AEIOUaeiou]/, '')
  end
  arr
end

def remove_vowels2(arr)
  arr.map {|word| word.delete('aeiouAEIOU')}
end


puts remove_vowels2(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels2(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels2(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

  