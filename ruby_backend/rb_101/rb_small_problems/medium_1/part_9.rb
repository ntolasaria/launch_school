def fibonacci(num)
  fib = 0 
  if num <= 2
    1
  else
    index = 2
    fib1, fib2 = 1, 1
    while index < num 
      fib = fib1 + fib2

      fib2 = fib1
      fib1 = fib

      index += 1
    
    end
    fib
  end
end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001) # => 4202692702.....8285979669707537501