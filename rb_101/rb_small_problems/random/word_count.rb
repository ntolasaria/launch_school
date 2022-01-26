text = File.read('example_problems.md')

words = text.split(' ')
puts "No. of word: #{words.size}"
length = 0
words.each { |word| length += word.size}
average_length = length / words.size.to_f
puts "Average word length is: #{average_length}"
