def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |str| str.size } 
  arr[0] + arr[1] + arr[0]
end


p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"