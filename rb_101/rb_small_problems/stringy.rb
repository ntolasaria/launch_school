def stringy(length)
  num = []
  length.times do |n|
    n.even? ? num << 1 : num << 0
  end

  num.join
end

puts stringy(6) 
puts stringy(9)
puts stringy(4)
puts stringy(7)