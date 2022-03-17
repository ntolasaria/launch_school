text = File.open('madlibs_text.txt')

ADJECTIVES = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADVERBS = %w(easily lazily noisily excitedly)

text.each do |line|
  line.gsub!('%{adjective}', ADJECTIVES.sample)
  line.gsub!('%{noun}', NOUNS.sample)
  line.gsub!('%{verb}', VERBS.sample)
  line.gsub!('%{adverb}', ADVERBS.sample)
  
  puts line
end


