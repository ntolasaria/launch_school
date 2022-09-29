def cleanup(str)
  clean_str = []
  str.chars.each do |char|
    if ('a'..'z').to_a.include?(char)
      clean_str << char
    else
      clean_str << ' ' unless clean_str.last == ' '
    end
  end
  clean_str.join
end

def cleanup2(str)
  str.gsub(/[^a-z]/, ' ').gsub(/[ ]+/, ' ')
end


puts cleanup2("---what's my +*& line?") == ' what s my line '