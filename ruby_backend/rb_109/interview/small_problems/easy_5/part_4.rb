def swap(str)
  arr = str.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'