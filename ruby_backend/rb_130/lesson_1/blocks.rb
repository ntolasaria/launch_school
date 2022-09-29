# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# say("hi there") do
#   system 'clear'
# end

# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# increment(5) do |num|
#   puts num
# end

# def test
#   yield(1)
# end

# test { |num, num2| puts num, num2 }


# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end
  
# p compare("hello") { |word| puts "hi" }
# # Before: hello
# # hi
# # After: 

# def time_it
#   time_before = Time.now
#   yield
#   time_after = Time.new

#   puts "It took #{time_after - time_before} seconds."
# end

# # p time_it { sleep(3) }
# p time_it { 10000000.times { num = 2 } }

# def test(&block)
#   puts "What's &block? #{block}"
# end

# test { sleep(1) }

# def test2(block)
#   puts "hello"
#   block.call(">>>")
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { |prefix| puts "#{prefix}xyz" }

# Using Closures:

def for_each_in(arr)
  arr.each { |element| yield(element) }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results

# Methods returning closures (Proc's and lambda's allowed)

def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call
p s1.call
p s1.call

puts

s2 = sequence
p s2.call
p s1.call
p s2.call