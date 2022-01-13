def palindromic_number?(int)
  str_int = int.to_s
  str_int == str_int.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true