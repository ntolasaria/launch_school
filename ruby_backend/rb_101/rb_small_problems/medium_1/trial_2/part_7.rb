require 'pry-byebug'


DIGIT_STR = %w( zero one two three four five six seven eight nine )
DIGITS = %w( 0 1 2 3 4 5 6 7 8 9 )


def word_to_digit(str)

  DIGIT_STR.each do |word|
    str.gsub!(/\b#{word}\b/, DIGITS[DIGIT_STR.index(word)])
  end

  str


#   str_arr = str.split
#   str_arr.map! do |word|
#     if DIGIT_STR.start_with?(word.downcase)
#       DIGITS[DIGIT_STR.index(word)]
#     else
#       word
#     end
#   end
#   str_arr.join(' ')
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
