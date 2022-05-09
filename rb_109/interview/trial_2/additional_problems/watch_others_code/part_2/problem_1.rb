# Problem 1: Next biggest number
=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071
If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==> -1
=end

# Input: integer
# Output: integer

# Rules:
# - get the next bigger number made of the same digits
# - if no number possible, return -1

# Algorithm:
# - get the `max_number` that can be made with those digits
# - iterate from the input to max_number
#   - on every iteration check if current number has the same digits
#   - if yes return the current number
# - if nothing is returned, return -1

def next_bigger_num(num)
  max_num = num.digits.sort.reverse.join.to_i
  (num + 1).upto(max_num) do |current_num|
    if current_num.digits.sort == num.digits.sort
      return current_num
    end
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


