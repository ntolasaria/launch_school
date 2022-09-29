def oddities(arr)
  result = []
  idx = 0
  while idx < arr.size
    result << arr[idx]
    idx += 2
  end
  result

end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []