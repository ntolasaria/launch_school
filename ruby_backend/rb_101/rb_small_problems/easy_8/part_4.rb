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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]