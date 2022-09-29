def stringy(num)
  str = ''
  1.upto(num) { |n| str << (n.odd? ? '1' : '0') }
  str
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'