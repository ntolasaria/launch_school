def repeater(str)
  new_str = ''
  str.chars.each do |char|
    new_str << char * 2
  end
  new_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''