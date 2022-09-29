# Input - integer
# Output - Integer - next bigger num with same digits

# ALGORITHM
# split number into arrray 
# 52321 -> [5, 2, 3, 2, 1]
# iterate from last element to the element which is smaller than right one
# in this case index 1. 
# swap it with the next bigger number
# In this case swap 2 and 3 -> [5, 3, 2, 2, 1] and sort the remaining array after that.
#                          -> [5, 3, 1, 2, 2]

require 'pry-byebug'

def swap_index(arr, index)
  num = arr[index]
  temp_arr = arr[index..-1]
  (num + 1).upto(temp_arr.max) do |bigger|
    if temp_arr.include?(bigger)
      return temp_arr.index(bigger) - temp_arr.size
    end
  end
end


def next_bigger(n)
  #your code here
  p n 
  arr = n.digits.reverse
  -1.downto(-arr.size + 1) do |idx|
    if arr[idx] > arr[idx - 1]
      swap_idx = swap_index(arr, idx - 1)
      arr[idx - 1], arr[swap_idx] = arr[swap_idx], arr[idx - 1]
      arr[idx..-1] = arr[idx..-1].sort
      return arr.join.to_i
    end
   end
end

p next_bigger(59884848459853) 