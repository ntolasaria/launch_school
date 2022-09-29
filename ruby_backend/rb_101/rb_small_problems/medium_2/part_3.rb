def letter_percentages(string)
  size = string.size.to_f
  hash = {}
  hash[:lowercase] = (string.count('a-z')/size) * 100.round(1)
  hash[:uppercase] = (string.count('A-Z')/size) * 100.round(1)
  hash[:neither] = (string.count('^A-Za-z')/size) * 100.round(1)

  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
