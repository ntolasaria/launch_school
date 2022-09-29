# Background
# There is a message that is circulating via public media that claims a reader can easily read a message 
# where the inner letters of each words is scrambled, as long as the first and last letters remain the same 
# and the word contains all the letters.

# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed,
#  ours will be sorted alphabetically

# Requirement
# return a string where:

# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
# Assumptions

# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.) 
# ignore capitalisation



# PEDAC


# Input -> String
# Output -> String with all the characters of the word apart from 1st and last and punctuations sorted

# Rules 
#   - Punctuations - (".,'-")

# Algorithm - 

# Helper method - punctuation_words -> to handle words with punctuations 

# Split string into words -> array of words (delimited by spaces)

# Transform ('#map') the array with the following Rules 
#   if the word has punctuation characters
#     call helper method 
#   else
#     sort the characters apart from first and last and return the sorted word

# Join the array of sorted words with an empty space and return

# Helper method - punctuation_words

# Input -> string - word with punctuations

# Inititalize empty array -> punctuation_index 
# iterate through characters and add the index where character is a punctuation to punctuation_index

# remove all punctuation characters from the word -> clean_word
# sort the clean_word apart from first and last characrters -> clean_word

# Initialize var - sorted_word - empty string
# # Start loop -> 0 to (word size - 1) |index|
#   if punctuation_index has `index`
#     concatenate sorted_word with char at index of original word
#   else
#     destructively remove first character of clean_word and concatenate sorted_word

# return sorted_word

def punctuation_words(word)
  arr = word.chars
  punc_idx = []
  arr.each.with_index { |char, idx| punc_idx << idx if char =~ /[.,'-]/ }
  clean_word = word.split(/[.,'-]/).join.chars
  clean_word[1..-2] = clean_word[1..-2].sort
  sorted_word = ''
  word.size.times do |idx|
    if punc_idx.include?(idx)
      sorted_word << word[idx]
    else
      sorted_word << clean_word.shift
    end
  end
  sorted_word
end

def scramble_words(str)
  words_arr = str.split.map do |word|
    if word =~ /[.,'-]/
      punctuation_words(word)
    else
      characters = word.chars
      characters[1..-2] = characters[1..-2].sort
      characters.join
    end
  end
  words_arr.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss' #'The first and last letters of a word should reamin in place with the inner letters sorted'
p scramble_words('i') == 'i' #, 'Must handle single charater words'
p scramble_words('') == '' #, 'Must handle empty strings'
p scramble_words('me') == 'me' #, 'Must handle 2 charater words'
p scramble_words('you') == 'you' # 'Must handle 3 charater words'
p scramble_words('card-carrying') == 'caac-dinrrryg' #, 'Only spaces separate words and punctuation should remain at the same place as it started'
p scramble_words("shan't") == "sahn't" # 'Punctuation should remain at the same place as it started'
p scramble_words('-dcba') == '-dbca' # 'Must handle special character at the start'
p scramble_words('dcba.') == 'dbca.' #, 'Must handle special character at the end'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth." #, 'Must handle a full sentence'
