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

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]