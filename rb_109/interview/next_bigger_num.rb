# You have to create a method that takes a positive integer number and returns the
# next bigger number formed by the same digits :

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071

# If no bigger number can be composed using those digits, return -1
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# INPUT - integer
# OUTPUT - integer - next bigger num with the same digits of the output

# METHOD - 
# separate the digits using #digits.
# Use #permutation to get all possible combinations of the digits and add to an array
# Sort the array
# Return the element next to the num that was input
#   In case its nil - return -1

# def next_bigger_num(num)
#   arr = []
#   num.digits.permutation(num.digits.size) { |perm| arr << perm.join.to_i }
#   arr.uniq!
#   arr.sort!
#   num_idx = arr.index(num)
#   return arr[num_idx + 1] if arr[num_idx + 1]
#   -1
# end

# Another approach - iterate from current number to the max number with those digits 
# break if a number with those digits is achieved. Else return -1

def next_bigger_num(num)
  max_num = num.digits.sort.reverse.join.to_i

  (num + 1).upto(max_num) do |n|
    return n if n.digits.sort == num.digits.sort
  end
  -1


end




p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798