def halvsies(arr)
  result = []
  center = (arr.size / 2.0).ceil.to_i
  result << arr[0...center]
  result << arr[center..-1]
end



p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]