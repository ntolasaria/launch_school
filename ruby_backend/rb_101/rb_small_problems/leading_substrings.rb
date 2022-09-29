def leading_substrings(str)
  str_arr = []
  (1..str.size).each do |length|
    str_arr << str.slice(0, length)
  end
  str_arr
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']