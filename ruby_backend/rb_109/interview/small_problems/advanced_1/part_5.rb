# Rotate Matrices :

# 3   4   1   
# 9   7   5
 
#     |
#     V

# 9   3 -> [1][0]   [0][0]
# 7   4 -> [1][1]   [0][1]
# 5   1 -> [1][2]   [0][2] 

# Input - nested array
# Output - nested array -> rotated new array

# Rules 
# - array should not be modified
# - new array to be returned
# - rotated 90 degrees

# Algorithm
# - initialize empty array -> `rotated`
# - get the number of `rows` by getting the size of the array
# - get the number of `cols` by getting the size of the first element of the array
# - iterate from 0 to (cols - 1)
#   intialize `temp` -> empty array
#   - iterate from (row - 1) down to 0
#     - add elements at [row][col] to `temp`
#   - add `temp` to `rotated`
# - return `rotated`

# def rotate90(array)
#   rotated = []
#   rows = array.size
#   cols = array.first.size
#   (0..cols - 1).each do |col|
#     temp = []
#     (rows - 1).downto(0) do |row|
#       temp << array[row][col]
#     end
#     rotated << temp
#   end
#   rotated
# end

# using `map` method

def rotate90(array)
  rotated = []
  rows = array.size
  cols = array.first.size
  (0...cols).each do |col|
    new_row = (0...rows).map do |row|
      array[row][col]
    end
    rotated << new_row.reverse
  end
  rotated
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
