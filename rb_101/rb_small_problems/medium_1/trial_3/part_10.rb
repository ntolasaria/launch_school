def fibonacci_last(n)
  num1 = 1
  num2 = 1
  idx = 3
  while idx <= n
    num1, num2 = num2 , (num1 + num2) % 10
    idx += 1
  end
  num2 % 10

end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4