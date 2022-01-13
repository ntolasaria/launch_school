def rotate_array!(arr)
  first_val = arr.shift
  arr.push(first_val)
  arr
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.split('')).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end


p rotate_string('rotate')
p rotate_integer(12345)
  



p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
