def interleave(arr1, arr2)
  result = []
  arr1.each_index do |idx|
    result << arr1[idx] << arr2[idx]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']