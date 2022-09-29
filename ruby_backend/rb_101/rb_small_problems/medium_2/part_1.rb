text = File.read('book_84.txt')

def longest_sentence(text)
  sentences = text.split(/[.!?]/)
  sentences.map! {|sentence| sentence.strip}

  sentences.sort_by! { |sentence| sentence.size }
  puts sentences.last
  puts "No.of words: #{sentences.last.split.size}"

end

longest_sentence(text)