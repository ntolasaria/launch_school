print "What is your name? "
name = gets.chomp
if name.end_with?('!')
  puts "HELLO #{name.chop.upcase}. WHY ARE YOU SCREAMING?"
else
  puts "Hello #{name}."
end
