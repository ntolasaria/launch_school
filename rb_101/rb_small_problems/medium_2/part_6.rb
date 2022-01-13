def triangle(a, b, c)
  arr = [a, b, c]

  if arr.sum != 180 || arr.any? {|angle| angle <= 0}
    :invalid
  elsif arr.max > 90
    :obtuse
  elsif arr.max == 90
    :right
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
    
