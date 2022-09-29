def ascii_value(str)
  ascii_val = 0
  str.each_char {|char| ascii_val += char.ord}
  ascii_val
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0