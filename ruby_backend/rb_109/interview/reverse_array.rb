def reverse(arr)
  result = []
  arr.each { |el| result.unshift(el) }
  result
end

p reverse([1, 2, 3]) == [3, 2, 1]
p reverse(%w(a b c d e f)) == %w(f e d c b a)
p reverse([]) == []
p reverse([1]) == [1]


