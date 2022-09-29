def xor?(cond1, cond2)
  return false if cond1 && cond2
  cond1 || cond2
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false