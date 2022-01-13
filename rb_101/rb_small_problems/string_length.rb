print "Please write word or multiple words: "
str = Kernel.gets().chomp()
str_length = str.delete(' ').length
puts "There are #{str_length} characters in \"#{str}\"."

