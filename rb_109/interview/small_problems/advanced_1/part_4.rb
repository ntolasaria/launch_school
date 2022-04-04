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



p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]