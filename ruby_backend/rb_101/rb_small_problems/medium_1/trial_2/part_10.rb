def fibonacci(n)
  num1, num2 = [1, 1]
  (3..n).each do 
    num1, num2 = [num2, num2 + num1]
  end
  num2
end


def fibonacci_last1(n)
  return 1 if n <= 2
  num1, num2 = [1, 1]

  3.upto(n) do 
    num1, num2 = [num2, (num1 + num2) % 10]
  end

  num2
end

def fibonacci_last2(n)
  fibonacci(n).to_s[-1].to_i
end




# p fibonacci_last1(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last1(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last1(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last1(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last1(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last1(123456789) # -> 4 - time taken == 14.66 s



p fibonacci_last2(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last2(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last2(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last2(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last2(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last2(123456789) # -> 4 - time taken == many times more