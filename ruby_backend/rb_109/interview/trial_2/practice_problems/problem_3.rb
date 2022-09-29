# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# Input: string
# Output: string

# Rules:
# - weird case - every 2nd character in every 3rd word converted to uppercase
# - new string to be returned

# Algorithm:
# - init `words` to an array of words of the string
# - init `index` to 2
# - start loop
#   - iterate through the characters of element at current `index`
#     - change every 2nd character to uppercase
#   - increment `index` by 3
#   - break out of loop if `index` is equal to or greater than array size
# - end loop

# def to_weird_case(string)
#   words = string.split
#   index = 2
#   while index <= words.size
#     current_word = words[index].chars
#     current_word = current_word.map.with_index do |char, idx|
#       if idx.odd?
#         char.upcase
#       else
#         char
#       end
#     end
#     words[index] = current_word.join
#     index += 3
#   end
#   words.join(' ')
# end

# # REFACTOR

# def to_weird_case(string)
#   words = string.split(' ')
#   words = words.map.with_index do |word, idx|
#     (idx + 1) % 3 == 0 ? capitalize_letters(word) : word
#   end
#   words.join(' ')
# end

# def capitalize_letters(word)
#   word = word.chars.map.with_index do |char, idx|
#     idx.odd? ? char.upcase : char
#   end
#   word.join
# end

# Input: string
# Output: string

# Rules:
# - every 2nd character in every third word uppercased
# - new string

# Algorithm: 
# - split the string into words, var `words` -> array
# - iterate through words and transform
#   - if the index (starting from 1) is divisible by 0
#     - upcase every 2nd character of the word
# - join the transformed array with a ' ' and return

def to_weird_case(string)
  words = string.split(' ')
  words = words.map.with_index do |word, index|
    (index + 1) % 3 == 0 ? upcase_letters(word) : word
  end
  p words.join(' ')
end

def upcase_letters(word)
  word = word.chars.map.with_index do |char, idx|
    idx.odd? ? char.upcase : char
  end
  word.join
end


p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".