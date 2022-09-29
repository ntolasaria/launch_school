def leading_substrings(str)
  str_arr = []
  (1..str.size).each do |length|
    str_arr << str.slice(0, length)
  end
  str_arr
end

def substrings(str)
  str_arr = []
  (0..str.size-1).each do |index|
    length = str.size - index
    str_arr.concat(leading_substrings(str.slice(index, length)))
  end
  str_arr
end

def palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
  substrings_arr = substrings(str)
  palindromes_arr = []
  substrings_arr.each do |substring|
    palindromes_arr << substring if palindrome?(substring)
  end
  palindromes_arr
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