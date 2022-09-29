require 'pry-byebug'

def merge(arr1, arr2)
  result = []
  idx2 = 0

  arr1.each do |num1|
    while idx2 < arr2.size && arr2[idx2] <= num1
      result << arr2[idx2]
      idx2 += 1
    end
    result << num1
  end
  result += arr2[idx2..-1]
end


def merge_sort(array)
  return array if array.size == 1
  current_arr = array
  size = current_arr.size
  split_arr = []

  while size > 1 
    
    split_arr << current_arr[0...size / 2]
    split_arr << current_arr[size / 2...size]
    size = split_arr[0].size



# def merge_sort(array)
#   return array if array.size == 1
#   size = array.size
#   binding.pry
#   sub_array1 = array[0...size / 2]
#   sub_array2 = array[size / 2...size]

#   sub_array1 = merge_sort(sub_array1)
#   sub_array2 = merge_sort(sub_array2)
#   merge(sub_array1, sub_array2)

# end









p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]