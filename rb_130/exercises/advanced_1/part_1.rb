def time_it
  start_time = Time.now
  yield
  finish_time = Time.now
  puts "Time taken for operation: #{finish_time - start_time} seconds!\n\n" 
end

factorial = Enumerator.new do |yielder|
  accumalator = 1
  number = 0
  loop do
    yielder << accumalator
    number += 1
    accumalator *= number
  end
end

factorial_ls = Enumerator.new do |yielder|
  accumalator = 1
  number = 0
  loop do
    accumalator = number == 0 ? 1 : accumalator * number
    yielder << accumalator
    number += 1
  end
end

factorial_with_reduce = Enumerator.new do |yielder|
  num = 0
  loop do
    if num == 0
      yielder << 1
    else
      yielder << (1..num).reduce(:*)
    end
    num += 1
  end
end

# External iterators

# 6.times { |number| puts "#{number}! = #{factorial.next}" }
# puts "==========================="
# 6.times { |number| puts "#{number}! = #{factorial.next}" }
# puts "==========================="
# factorial.rewind
# 6.times { |number| puts "#{number}! = #{factorial.next}" }
# puts "==========================="

# # Internal Iterators - enumerator calls `rewind` each time they are

# factorial.each_with_index do |value, index|
#   puts "#{index}! = #{value}"
#   break if index == 5
# end
# puts "==========================="

# # Enumerator is however not made to rewind after internal iteration

# puts factorial.next

# factorial.rewind

count = 10000
puts "***** Speed Tests *****\n\n"
puts "#{count} iterations!!!\n\n"

puts "Factorial:"
time_it { factorial.take(count) }

puts "Factorial LS:"
time_it { factorial_ls.take(count) }

# puts "Factorial with `reduce`:"
# time_it { factorial_with_reduce.take(count) }

