def fibonacci(n)
  num1 = 1
  num2 = 1
  idx = 3
  while idx <= n
    num1, num2 = num2, num1 + num2
    idx += 1
  end
  num2
end

p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501