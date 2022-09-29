def leading_substrings(str)
  substrings = []
  str.size.times do |idx|
    substrings << str[0..idx]
  end
  substrings
end

def substrings(str)
  substrings = []
  str.size.times do |idx|
    substrings += leading_substrings(str[idx..-1])
  end
  substrings
end

def palindrome?(str)
  str == str.reverse && str.size > 1
end  

def palindromes (str)
  substrings = substrings(str)
  palindromes = substrings.select { |substr| palindrome?(substr) }   
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]