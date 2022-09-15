def zip(array1, array2)
  index = 0
  result = []

  while index < array1.size
    result << [array1[index], array2[index]]
    index += 1
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]