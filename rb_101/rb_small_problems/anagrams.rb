# INPUT - array of strings
# OUTPUT - nested array of strings
# RULES - each nested array to contain anagrams 
#       - print each nested array in separate lines

# START
# GET size of input array 

       

def anagrams(list)
  result = {}

  list.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end
  result.each_value do |val|
    p val 
  end
end



words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

anagrams(words)




