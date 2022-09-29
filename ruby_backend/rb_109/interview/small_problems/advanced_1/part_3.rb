# Input - nested array
# Output - nested array -> rotated

# Rules 
# - columns become rows
# - original array should be modified 
# - new array should be returned

# Algorithm 
# - initialize empty array - `transposed`
# - get number of `rows` by getting the size of the array
# - get number of `cols` by getting the size of the first element of the array
# - iterate from 0 to (cols - 1)
#   - initialize empty array -> `temp`
#   - iterate from 0 to (rows - 1)
#     - add element at [row][col] to `temp`
#   - add `temp` to `transposed`

# - return `transposed`


def transpose(array)
  transposed = []
  rows = array.size
  cols = array[0].size

  (0...cols).each do |col|
    temp = []
    (0...rows).each do |row|
      temp << array[row][col]
    end
    transposed << temp
  end
  transposed
end



p matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# 1 5 8 -> rows - 2  
# 4 7 2 -> cols -> 3

# 1 4
# 5 7
# 8 2

