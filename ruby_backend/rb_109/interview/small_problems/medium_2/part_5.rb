# Triangle Sides

# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must 
# be greater than the length of the longest side, and all sides must have lengths 
# greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns 
# a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is 
# equilateral, isosceles, scalene, or invalid.

# Input - 3 integers
# Output  - symbol 
#         - :equilateral, :isosceles, :scalene or :invalid depending on the type of triangle

# Rules 

# - input integers represent three sides of a triangle
# - the largest side should be less than the sum of the other two sides
# - equilateral - all sides must be equal
# - isosceles - two sides must be equal
# - scalene - all sides must be different lengths

# Algorithm 

# - add the input integers to an array
# - sort the array
# - check if the last element is less than the sum of the first two - if not return :invalid
# - check if all three sides are equal - if yes return :equilateral
# - check if any two sides are equal - if yes return :isosceles
# - if none of the above return :scalene

def triangle(a, b, c)
  sides = [a, b, c].sort
  case
  when sides[2] >= sides[0] + sides[1]  then  :invalid
  when sides.uniq.size == 1             then  :equilateral
  when sides.uniq.size == 2             then  :isosceles
  else                                        :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
