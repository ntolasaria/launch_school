def letter_percentages(str)
  hash = {}
  length = str.size.to_f
  hash[:lowercase] = ((str.count('a-z') / length) * 100).round(1)
  hash[:uppercase] = ((str.count('A-Z') / length) * 100).round(1)
  hash[:neither] = 100 - hash[:lowercase] - hash[:uppercase]
  hash
end



p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }