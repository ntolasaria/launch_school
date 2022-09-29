def crunch(str)
  new_str = ''
  index = 0
  while index < str.length
    new_str.concat(str[index]) unless str[index] == str[index + 1]
    index += 1
  end
  new_str
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
