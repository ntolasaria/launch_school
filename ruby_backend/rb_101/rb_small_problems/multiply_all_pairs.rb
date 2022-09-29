def multiply_all_pairs(arr1, arr2)
  result_arr = []
  arr1.each do |num1|
    arr2.each do |num2|
      result_arr << num1 * num2
    end
  end
  result_arr.sort
end

def multiply_all_pairs2(arr1, arr2)
  arr1.product(arr2).map {|arr| arr.inject(:*)}.sort
end


p multiply_all_pairs2([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]