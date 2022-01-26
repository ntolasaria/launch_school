text = File.read('example_problems.md')

words = text.split(' ')
puts "No. of word: #{words.size}"
length = words.map { |word| word.size }.inject(:+)
average_length = length / words.size.to_f
puts "Average word length is: #{average_length}"
