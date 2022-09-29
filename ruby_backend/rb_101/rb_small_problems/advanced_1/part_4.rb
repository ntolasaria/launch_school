# [[1,2,3,4]] == [  [1],
#                   [2],
#                   [3],
#                   [4] ]

# rows = 1
# columns = 4
# new rows = 4
# columns = 1(size of new sub array)

def transpose(array)
  result = []
  rows = array.size
  columns = array[0].size

  columns.times do |column|
    temp_arr = []
    rows.times do |row|
      temp_arr << array[row][column]
    end
    result << temp_arr
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]