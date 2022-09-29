# method implementation
def each(array)
  index = 0
  while index < array.size
    yield(array[index])
    index += 1
  end

  array
end

# method invocation:
p(each([1, 2, 3, 4, 5]) do |num|
  puts num
end)

# p a

# method chaining

p each([1, 2, 3, 4, 5]) { |num| puts "do nothing" }.select { |num| num.odd? }
