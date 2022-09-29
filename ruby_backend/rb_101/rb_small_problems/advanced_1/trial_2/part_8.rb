require 'pry-byebug'

def merge(arr1, arr2)
  result = []
  idx2 = 0

  arr1.each do |num1|
    while idx2 < arr2.size && arr2[idx2] < num1
        result << arr2[idx2]
        idx2 += 1
    end
    result << num1
  end
  result += arr2[idx2..-1]
end

# Non Recursive


# # def split_array(array)
# #   current_arr = []
# #   current_arr = [array]
# #   while current_arr.any? {|el| el.size > 1} 
# #     temp_arr = []
# #     current_arr.each do |sub_arr|
# #       if sub_arr.size == 1
# #         temp_arr << sub_arr
# #       else    
# #         center = sub_arr.size / 2
# #         temp_arr << sub_arr[0...center]
# #         temp_arr << sub_arr[center..-1]
# #         # binding.pry
# #       end
# #       end
# #     current_arr = temp_arr
# #   end
# #   current_arr
# # end

# def merge_sort(array)

#   # arr = split_array(array)
#   arr = array.map { |el| [el] }
#   while arr.first.size < array.size
#     idx = 0
#     temp_arr = []
#     loop do 
#       # binding.pry
#       if arr[idx + 1] == nil
#         temp_arr << arr[idx]
#       else
#         temp_arr << merge(arr[idx], arr[idx + 1])
#       end
#       idx += 2
#       break if idx >= arr.size
      
#     end
#     arr = temp_arr
#   end
#   arr.flatten
# end

# Launch School - Recursive

def merge_sort(array)
  return array if array.size == 1
  size = array.size
  
  sub_array1 = array[0...size / 2]
  sub_array2 = array[size / 2...size]
  binding.pry
  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)

  binding.pry

  merge(sub_array1, sub_array2)
end


p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


