text = File.open('madlibs_text.txt')


WORDS = { adjectives: ['quick', 'lazy', 'sleepy', 'ugly'],
  nouns: ['fox', 'dog', 'head', 'leg'],
  verbs: ['jumps', 'lifts', 'bites', 'licks'],
  adverbs: ['easily', 'lazily', 'noisily', 'excitedly'] }

# My solution 

text.each do |line|
  line.gsub!('%{adjective}', WORDS[:adjectives].sample)
  line.gsub!('%{noun}', WORDS[:nouns].sample)
  line.gsub!('%{verb}', WORDS[:verbs].sample)
  line.gsub!('%{adverb}', WORDS[:adverbs].sample)

  puts line

end

# Launch School solution
puts '*******************'

text = File.open('madlibs_text.txt')
text.each do |line|
  puts format(line, adjective:  WORDS[:adjectives].sample,
                    noun:       WORDS[:nouns].sample,
                    verb:       WORDS[:verbs].sample,
                    adverb:     WORDS[:adverbs].sample)
end




