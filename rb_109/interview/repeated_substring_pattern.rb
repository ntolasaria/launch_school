def repeated_substring_pattern(str)
  (1..str.length - 1).each do |length|
    next if str.length % length != 0
    substring = str[0, length]
    return true if substring * (str.length / length) == str
  end
  false
end 

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
