def transpose(array)
  result = []

  3.times do |row|
    temp_arr = []
    3.times do |column|
      temp_arr << array[column][row]
    end
    result << temp_arr
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