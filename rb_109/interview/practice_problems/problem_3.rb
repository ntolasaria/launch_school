# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# Input - string
# Output - string

# Rules 
# - every 2nd character in every 3rd word uppercased

# Algorithm
# - split the string into words variable `words`
# - iterate through the `words`
#   - for every third word check if the word is atleast 2 characters long
#     - if yes the 2nd element should be uppercased
# - join the changed words and return


# def to_weird_case(string)
#   words = string.split(' ')
#   index = 2
#   loop do
#     if words[index].size > 1
#       idx = 1
#       while idx < words[index].size
#         words[index][idx] = words[index][idx].upcase
#         idx += 2
#       end
#     end
#     index += 3
#     break if index >= words.size
#   end
#   words.join(' ')
# end

# Refactored

def to_weird_case(string)
  words = string.split(' ')
  words = words.map.with_index do |word, index|
    if (index + 1) % 3 == 0
      word = word.chars.map.with_index do |char, idx|
        if (idx + 1) % 2 == 0
          char = char.upcase
        else
          char
        end
      end
      word.join
    else
      word
    end
  end
  words.join(' ')
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