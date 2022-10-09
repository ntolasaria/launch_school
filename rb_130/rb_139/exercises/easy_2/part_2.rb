def zip(array1, array2)
  array1.map.with_index do |el, idx|
    [el, array2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
