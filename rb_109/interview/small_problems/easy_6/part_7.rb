def halvsies(arr)
  middle = (arr.size / 2.0).ceil
  sub_arr1 = arr.slice(0, middle)
  sub_arr2 = arr.slice(middle..-1)
  [sub_arr1, sub_arr2]
  
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]