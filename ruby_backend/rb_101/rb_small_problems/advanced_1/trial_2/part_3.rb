# transpose matrix

# example

# 1   5   8
# 4   7   2
# 3   9   6

# --> becomes

# 1   4   3
# 5   7   9
# 8   2   6

# rows becomes columns

def transpose(array)
  rows = array.size
  cols = array.first.size
  result = []

  cols.times do |col|
    sub_arr = []
    rows.times do |row|
      sub_arr << array[row][col] 
    end
    result << sub_arr
  end
  result

end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
  