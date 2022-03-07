ALPHABET = ('a'..'z').to_a
VOWELS = %w(a e i o u)
CONSONANTS = ALPHABET - VOWELS

# def double_consonants(str)
#   result = str.chars.map do |char|
#     if char =~ /[a-zA-Z]/ && char =~ /[^aeiouAEIOU]/
#       char * 2
#     else
#       char
#     end
#   end
#   result.join
# end

def double_consonants(str)
  result = ''
  str.chars.each do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""