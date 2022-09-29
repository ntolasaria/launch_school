# def merge(arr1, arr2)
#   result = []
#   new_arr_size = (arr1.size + arr2.size)
#   idx1 = 0
#   idx2 = 0

#   while arr1[idx1] != nil || arr2[idx2] != nil
    
#     if arr1[idx1] == nil
#       while idx2 < arr2.size
#         result << arr2[idx2]
#         idx2 += 1
#       end
#     elsif arr2[idx2] == nil
#       while idx1 < arr1.size
#         result << arr1[idx1]
#         idx1 += 1
#       end
#     elsif arr1[idx1] < arr2[idx2]
#       result << arr1[idx1]
#       idx1 += 1
#     elsif arr2[idx2] < arr1[idx1]
#       result << arr2[idx2]
#       idx2 += 1
#     end

#   end
#   result
# end 

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






p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], [])# == [1, 4, 5]


