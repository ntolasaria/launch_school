words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

hash = {}

words.each do |word|
  key = word.chars.sort.join
  if hash.has_key?(key)
    hash[key] << word
  else
    hash[key] = [word]
  end
end


result = hash.values
p result
