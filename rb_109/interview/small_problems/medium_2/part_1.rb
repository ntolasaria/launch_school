text = File.read('pg84.txt')
sentences = text.split(/\.|\?|!/)
max_sentence = sentences.max_by { |sentence| sentence.split.size }
max_sentence = max_sentence.strip
words = max_sentence.split
puts max_sentence
puts "Number of words: #{words.size}"