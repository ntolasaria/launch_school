def double_consonants(str)
  result = ''
  str.chars.each do |char|
    if char =~ /[A-Za-z]/ && char =~ /[^aeiouAEIOU]/
      result << char * 2
    else
      result << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""