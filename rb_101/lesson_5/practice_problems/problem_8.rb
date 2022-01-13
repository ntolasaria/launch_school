hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |words|
  words.each do |word|
    word.chars.each do |char|
      if char =~ /[aeiouAEIOU]/
        puts char
      end
    end
  end
end


