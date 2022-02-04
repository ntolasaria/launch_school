TEXT = File.open('madlibs_text.txt')

MADLIBS = { adjectives: %w( quick lazy sleepy ugly ),
            nouns: %w( fox dog head leg ),
            verbs: %w( jumps lifts bites licks ),
            adverb: %w( easily lazily noisily excitedly ) }


TEXT.each do |line|  
  line.gsub!('%{adjective}', MADLIBS[:adjectives].sample)
  line.gsub!('%{noun}', MADLIBS[:nouns].sample)
  line.gsub!('%{verb}', MADLIBS[:verbs].sample)
  line.gsub!('%{adverb}', MADLIBS[:adverb].sample)
  puts line
end
