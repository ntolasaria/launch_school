def reverse!(arr)
  index = 0 
  while index < (arr.size/2)
    arr[index], arr[-1-index] = arr[-1-index], arr[index]
    index += 1
  end
  arr
end

def reverse(arr)
  new_arr = []
  index = 0
  while index < (arr.size)
    new_arr.unshift(arr[index])
    index +=1
  end
  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true