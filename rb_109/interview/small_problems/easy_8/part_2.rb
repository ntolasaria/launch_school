print 'Enter a noun: '
noun = gets.chomp
print 'Enter a verb: '
verb = gets.chomp
print 'Enter an adjective: '
adjective = gets.chomp
print 'Enter an adverb: '
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}?"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."

puts [sentence_1, sentence_2].sample
