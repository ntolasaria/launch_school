def fibonacci_last(num)
  fib = 0 
  if num <= 2
    1
  else
    index = 2
    fib1, fib2 = 1, 1
    while index < num 
      fib = fib1 + fib2

      fib2 = fib1 % 10
      fib1 = fib % 10

      index += 1
    
    end
    p fib
    fib.to_s[-1].to_i
  end
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4