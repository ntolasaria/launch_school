# def fibonacci(n)
#   return 1 if n <= 2

#   num1 = 1
#   num2 = 1 
#   counter = 3
#   result = 0

#   while counter <= n 
#     result = num1 + num2 
#     num2, num1 = result, num2
#     counter += 1
#   end
  
#   result 

# end

# Refactored according to LS

def fibonacci(n)
  num1, num2 = [1, 1]
  (3..n).each do 
    num1, num2 = [num2, num2 + num1]
  end
  num2
end



p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
p fibonacci(10)