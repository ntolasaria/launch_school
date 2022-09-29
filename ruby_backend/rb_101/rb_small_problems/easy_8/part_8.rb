def double_consonants(str)
  arr = str.chars.map do |char|
    if char.downcase =~ /[a-z]/ && char.downcase =~ /[^aeiou]/
      "#{char * 2}"
    else
      char
    end
  end
  arr.join

end




p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""