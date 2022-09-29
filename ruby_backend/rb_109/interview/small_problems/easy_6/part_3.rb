def find_fibonacci_index_by_length(length)
  idx = 2
  num1, num2 = 1, 1

  while num2.to_s.length < length
    num2, num1 = num1 + num2, num2
    idx += 1
  end
  return idx
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847