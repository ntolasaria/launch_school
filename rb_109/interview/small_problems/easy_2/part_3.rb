print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_rate = gets.chomp.to_f
tip = bill * tip_rate / 100
puts "The tip is Rs. #{format("%.2f", tip)}"
puts "The total is Rs. #{format("%.2f", bill + tip)}"
