def leading_substrings(str)
  leading_substrings = []
  0.upto(str.size - 1) do |idx|
    leading_substrings << str[0..idx]
  end
  leading_substrings
end

def substrings(string)
  substrings = []
  0.upto(string.size - 1) do |idx|
    substrings += leading_substrings(string[idx..-1])
  end
  substrings
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindrome_stripped?(string)
  stripped = string.chars.select { |char| char =~ /[a-zA-Z0-9]/ }.join
  stripped.reverse.downcase == stripped.downcase && stripped.size > 1
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select do |substring|
    palindrome?(substring)
  end
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
p palindromes('Madam')