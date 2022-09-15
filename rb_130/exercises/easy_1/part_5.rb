ALPHABET = ('a'..'z').to_a

def decipher(string)
  array = string.split("\n")
  array = array.map do |name|
    decrypt(name)
  end
  array.join("\n")
end

def upcase?(char)
  char.upcase == char
end

def decrypt(name)
  chars = name.chars.map do |char|
    if ALPHABET.include?(char.downcase)
      index = ALPHABET.index(char.downcase)
      decrypted_char = ALPHABET[(index + 13) % 26]
      upcase?(char) ? decrypted_char.upcase : decrypted_char
    else
      char
    end
  end
  name = chars.join
end

names = File.read('names.txt')
puts decipher(names)
