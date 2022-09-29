text = File.read('book_84.txt')

sentences = text.split(/[.!?]/)
sentences = sentences.map { |sentence| sentence.strip }
sentences.sort_by! { |sentence| sentence.size }
largest_sentence = sentences.last.strip
number_of_words = largest_sentence.split.size

puts largest_sentence
puts "No. of words : #{number_of_words}"



