# You have to create a method that takes a positive integer number and returns the
# next bigger number formed by the same digits :

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071

# If no bigger number can be composed using those digits, return -1
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# Input: integer
# Output: integer

# Rules:
# - next bigger number formed by the same digits
# - if no solution exists return -1

# Algorithm:
# - get the max number possible from the digits
#   - split the number into digits, then sort, then reverse, then join
# - iterate from the input number + 1 to max number
#   - check if the current number is made up of the same digits on every iteration
#   - if yes, retrun the number
# - if nothing is returned yet, return true

# Less Iterations

# Algorithm:
# - start from the last digit and check
#   - if the one to the left of it is greater than or not
#   - if the one to the left is less than the right
#     - swap the digits
#     - sort the digits from the swap point onwards


# def next_bigger_num(num)
#   counter = 0
#   result = nil
#   max_num = num.digits.sort.reverse.join.to_i
#   (num + 1).upto(max_num) do |n|
#     counter += 1
#     if n.digits.sort == num.digits.sort
#       result = n
#       break
#     end
#   end
#   puts "No. of iterations: #{counter}"
#   result ? result : -1
# end

def next_bigger_num(num)
  arr = num.digits.reverse
  result = nil
  counter = 0
  (arr.size - 1).downto(1) do |index|
    counter += 1
    if arr[index - 1] < arr[index]
      arr[index], arr[index - 1] = arr[index - 1], arr[index]
      arr[index..-1] = arr[index..-1].sort
      result = arr.join.to_i
      break
    end
  end
  puts "No. of iterations: #{counter}"
  result ? result : -1
end


p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(12348954)