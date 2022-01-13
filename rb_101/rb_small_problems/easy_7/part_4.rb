def swapcase(str)
  result = str.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    else
      char.downcase 
    end
  end
  result.join
end



p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'