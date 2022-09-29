# # You are given an array which contains only integers (positive and negative). 
# # Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# # You can asume there is never an empty array and there will always be an integer.



# Input - array 
# Output - array - all same and consecutive elements to be summed up

# Algorithm 

# - initialize variable `result` to empty array
# - iterate through array
#   - if next element is same 
#     - enter another loop
#       - keep adding till the value is same 
#       - break when value is not same
#       - add the added element to `result`
#     - if next element is not the same, add the element to result array




def sum_consecutives(array)
  result = []
  idx = 0
  while idx < array.size
    sum = 0
    if array[idx] != array[idx + 1]
      result << array[idx]
      idx += 1
    else
      while array[idx] == array[idx + 1]
        sum += array[idx]
        idx += 1
      end
      sum += array[idx]
      result << sum
      idx += 1
    end
  end
  result
end





p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]