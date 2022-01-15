def featured(int)
  
  loop do
    int += 1
    break if int % 7 == 0 && int.odd?
  end

  loop do
    return int if int.to_s.chars.uniq == int.to_s.chars
    int += 14
    break if int > 9876543210
  end
  
  'There is no possible number that fulfills those requirements.'
  
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements