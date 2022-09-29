# Rotate matrices - 90 degree

# example :

# 1   5   8             3   4   1
# 4   7   2     -->     9   7   5
# 3   9   6             6   2   8 

# 3   4   1              9    3
# 9   7   5     -->      7    4        
#                        5    1



def rotate90(array)
  result = []
  row_idx = array.size - 1
  col_idx = array[0].size - 1

  (0..col_idx).each do |col|
    temp_arr = []
    row_idx.downto(0) do |row|
      temp_arr << array[row][col]
    end
    result << temp_arr
  end
  result
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
  

    




