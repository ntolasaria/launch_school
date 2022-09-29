def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |el, idx|
    result << el << arr2[idx]
  end
  result
end

# def interleave(arr1, arr2)
#   arr1.map { |el, idx| [el, arr2[arr1.index(el)]] }.flatten
# end



p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']