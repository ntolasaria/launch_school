def center_of(str)
  mid_index = str.size / 2
  if str.size.odd?
    center_str = str[mid_index]
  else
    center_str = str[mid_index - 1, 2]
  end
  center_str
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'