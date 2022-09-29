def leading_substrings(str)
  substrings = []
  str.size.times do |idx|
    substrings << str[0..idx]
  end
  substrings
end



p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']