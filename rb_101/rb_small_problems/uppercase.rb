def uppercase?(str)
  str == str.upcase
end

p uppercase?('T') == true
p uppercase?('t') == false
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

