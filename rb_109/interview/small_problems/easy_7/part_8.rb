def multiply_list(arr1, arr2)
  result = []
  arr1.each_index do |idx|
    result << arr1[idx] * arr2[idx]
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]