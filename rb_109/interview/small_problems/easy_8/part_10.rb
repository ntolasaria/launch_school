def center_of(str)
  mid = str.size / 2 
  str.size.odd? ? str[mid] : str[mid - 1, 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'