require 'time'
print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i
year = Time.now.year
retire_time = (retire_age - age) 
puts "It's #{year}. You will retire in #{year + retire_time}."
puts "You have only #{retire_time} years of work to go!"