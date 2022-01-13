def oddities(arr)
  new_arr = []
  arr.each_with_index do |n, idx|
    new_arr << n if idx.even?
  end
  new_arr
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])