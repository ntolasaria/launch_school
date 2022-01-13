# TEXT = %w(zero one two three four five six seven eight nine)
# INT_STR = %w(0 1 2 3 4 5 6 7 8 9)

# def word_to_digit(sentence)
#   arr = sentence.split
#   arr.map! do |word|
#     if TEXT.include?(word)
#       word = INT_STR[TEXT.index(word)]
#     else
#       word
#     end
#   end
#   arr.join(' ')
# end

DIGIT_HASH = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
  'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8',
  'nine' => '9' }

def word_to_digit(string)
  DIGIT_HASH.keys.each do |word|
    string.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  string
end



p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

