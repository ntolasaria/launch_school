def merge(arr1, arr2)
  result = []
  idx = 0 

  arr1.each do |num1|
    while idx < arr2.size && arr2[idx] < num1
      result << arr2[idx]
      idx += 1
    end
    result << num1
  end
  result += arr2[idx..-1]
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]