def find_fibonacci_index_by_length(length)
  num1 = 1
  num2 = 1
  idx = 2

  loop do 
    fib = num1 + num2
    num1, num2 = num2, fib
    idx += 1
    break if fib.to_s.length == length
  end
  idx
end



p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847