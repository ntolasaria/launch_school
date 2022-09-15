# def reduce(array, default=0)
#   counter = 0
#   accumalator = default

#   while counter < array.size
#     accumalator = yield(accumalator, array[counter])
#     counter += 1
#   end

#   accumalator
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# First element as the default value

def reduce(array)
  counter = 1
  accumalator = array.first

  while counter < array.size
    accumalator = yield(accumalator, array[counter])
    counter += 1
  end

  accumalator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
