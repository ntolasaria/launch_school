DIGIT = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  str_arr = str.split
  str_arr.map! do |word|
    DIGIT.each do |digit|
      if word.downcase.start_with?(digit)
        word[0..digit.size - 1] = DIGIT.index(digit).to_s
      end
    end
    word
  end
  str_arr.join(' ')
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'