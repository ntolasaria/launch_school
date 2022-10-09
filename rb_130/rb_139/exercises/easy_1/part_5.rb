ALPHABET = ('a'..'z').to_a

def rot13(array)
  array.map { |string| decrypt(string)}
end

# def decrypt(string)
#   characters = string.chars.map do |char|
#     case char
#     when ('a'..'m'), ('A'..'M') then (char.ord + 13).chr
#     when ('n'..'z'), ('N'..'Z') then (char.ord - 13).chr
#     else                             char
#     end
#   end
#   characters.join
# end

def decrypt(string)
  decrypted = string.chars.map do |char|
    if ALPHABET.include?(char.downcase)
      index = ALPHABET.index(char.downcase)
      index = (index + 13) % 26
      decrypted_char = ALPHABET[index]
      upcase?(char) ? decrypted_char.upcase : decrypted_char
    else
      char
    end
  end
  decrypted.join
end

def upcase?(char)
  char.upcase == char
end

file = File.open('names.txt')
text = file.read
names = text.split("\n")
puts rot13(names)
