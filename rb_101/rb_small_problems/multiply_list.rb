def multiply_list(arr1, arr2)
  result_arr = []
  counter = 0
  while counter < arr1.size
    result_arr << (arr1[counter] * arr2[counter])
    counter += 1
  end
  result_arr
end

def multiply_list2(arr1, arr2)
  result_arr = []
  arr1.each_with_index do |num, idx|
    result_arr << num * arr2[idx]
  end
  result_arr
end

def multiply_list3(arr1,arr2)
  arr1.zip(arr2).map {|arr| arr.inject(:*)}
end



p multiply_list3([3, 5, 7], [9, 10, 11]) == [27, 50, 77]