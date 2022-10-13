factorial = Enumerator.new do |yielder|
  accumalator = 1
  number = 0

  loop do
    accumalator = number < 1 ? 1 : accumalator * number
    yielder << accumalator
    number += 1
  end
end

# External iterators

6.times { |num| puts "#{num}! == #{factorial.next}" }
puts "========================"
6.times { |num| puts "#{num}! == #{factorial.next}" }
puts "========================"
factorial.rewind
6.times { |num| puts "#{num}! == #{factorial.next}" }
puts "========================"


# Internal iterator

factorial.each_with_index do |fact, num|
  puts "#{num}! == #{fact}"
  break if num >= 5
end