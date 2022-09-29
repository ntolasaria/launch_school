def balanced?(str)
  balance = 0
  str.chars.each do |char|
    balance += 1 if char == '('
    balance -= 1 if char == ')'
    break if balance < 0
  end
  balance == 0
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false