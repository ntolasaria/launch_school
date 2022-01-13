print "What is your name? "
name = Kernel.gets().chomp()
if name[-1] == ('!')
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end

