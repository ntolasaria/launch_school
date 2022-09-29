def find_fibonacci_index_by_length(length)
  return 1 if length == 1
  fibonacci = [1,1]
  index = 2
  loop do
    fibonacci[index] = fibonacci[index - 1] + fibonacci[index - 2]
    break if fibonacci[index].to_s.length == length
    index += 1
  end
  fibonacci.size
end

def find_fibonacci_index_by_length2(length)
  return 1 if length == 1
  fib1, fib2 = 1,1
  index = 2
  loop do
    index += 1
    fibonacci = fib1 + fib2
    break if fibonacci.to_s.length == length

    fib1 = fib2
    fib2 = fibonacci
  end
  index
end



puts find_fibonacci_index_by_length2(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length2(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length2(10) == 45
puts find_fibonacci_index_by_length2(100) == 476
puts find_fibonacci_index_by_length2(1000) == 4782
puts find_fibonacci_index_by_length2(10000) == 47847


