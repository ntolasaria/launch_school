def triangle(a, b, c)
  angles = [a, b, c]
  if angles.sum != 180 || angles.any?(0)
    :invalid
  elsif angles.any?(90)
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
  