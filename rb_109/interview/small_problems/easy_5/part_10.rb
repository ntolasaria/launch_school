# def print_in_box(str)
#   box_size = str.size + 2
#   border_line = '+' + '-' * box_size + '+'
#   empty_line = '|' + ' ' * box_size + '|'
#   text_line = '| ' + str + ' |'
#   puts border_line
#   puts empty_line
#   puts text_line
#   puts empty_line
#   puts border_line
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('Hello World!')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


# Further Exploration - text wrapping

def wrap_text_small_words(str)
  arr = str.split(' ')
  lines = []
  temp_arr = []
  arr.each do |word|
    if (temp_arr.join(' ').size + word.size) < 76
      temp_arr << word
      next
    end
    lines << temp_arr.join(' ')
    temp_arr = []
    temp_arr << word
  end
  lines << temp_arr.join(' ')
end

def wrap_text_large_words(str)
  reps = (str.size / 76) + 1
  lines = []
  reps.times do |i|
    lines << str.slice(76*i, 76)
  end
  lines
end

def wrap_text(str)
  arr = str.split(' ')
  if arr.all? { |word| word.size <= 76 }
    lines = wrap_text_small_words(str)
  else
    lines = wrap_text_large_words(str)
  end
  lines 
end


def print_in_box_wrap(str)
  box_size = str.size > 76 ? 78 : str.size + 2
  
  lines = str.size > 76 ? wrap_text(str) : [str]

  
  border_line = '+' + '-' * box_size + '+'
  empty_line = '|' + ' ' * box_size + '|'

  puts border_line
  puts empty_line
  lines.each { |line| puts ('| ' + line.center(box_size - 2) + ' |')}
  puts empty_line
  puts border_line
end

print_in_box_wrap('To boldly go where no one has gone before.')
print_in_box_wrap('Hello World!')

print_in_box_wrap("The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.")
print_in_box_wrap("ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ")


print_in_box_wrap('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec placerat velit, eget venenatis mauris. Vivamus cursus, lacus ac efficitur fermentum, nulla orci hendrerit ipsum, et commodo neque elit in nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus gravida enim lacinia mi congue iaculis. Aenean luctus, tortor ac pharetra mattis, nisi sem cursus est, in eleifend magna massa vel tellus. Vivamus lobortis massa nisl, nec porttitor est accumsan quis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc dictum tellus nec turpis varius, id pharetra nisl porta. Aenean risus velit, dignissim eget scelerisque in, facilisis nec leo. Vivamus vulputate orci id lobortis malesuada.')