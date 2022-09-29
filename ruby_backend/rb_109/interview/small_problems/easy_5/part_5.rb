ALPHABETS = ('a'..'z').to_a

# def cleanup(str)
#   str.gsub(/[^a-z]/, ' ').squeeze
# end

# Without #gsub and regexp

def cleanup(str)
  result = []
  str.chars.each do |char|
    if ALPHABETS.include?(char)
      result << char
    else
      result << ' ' if result.last != ' '
    end
  end
  result.join
end

p cleanup("---what's my +*& line?") == ' what s my line '