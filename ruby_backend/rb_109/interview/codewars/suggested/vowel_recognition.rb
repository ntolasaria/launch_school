def vowel_recognition(input)
  char_map = input.chars.map { |char| char =~ /[aeiouAEIOU]/ ? 1 : 0}
  # p char_map
  vowel_count = 0
  size = input.size
  0.upto(size - 1) do |idx|
    idx.upto(size - 1) do |idx2|
      vowel_count += char_map[idx..idx2].sum
    end
  end
  
  vowel_count
end


p vowel_recognition(str)
