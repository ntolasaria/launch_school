def triangle(a, b, c)
  sides = [a, b, c]
  sides.sort!
  if sides[0] + sides[1] <= sides[2] || sides.any?(0)
    :invalid
  elsif sides.count(sides[0]) == 3
    :equilateral
  elsif sides.count(sides[1]) == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid