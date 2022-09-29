def letter_percentages(str)
  size = str.size.to_f
  result = Hash.new(0)
  result[:lowercase] = ((str.count('a-z') / size) * 100).round(1)
  result[:uppercase] = ((str.count('A-Z') / size) * 100).round(1)
  result[:neither] = ((str.count('^a-zA-Z') / size) * 100).round(1)
  result
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
