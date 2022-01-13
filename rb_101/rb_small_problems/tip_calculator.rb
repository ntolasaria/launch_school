print "What is the bill? "
bill = Kernel.gets().to_f()
print "What is the tip percentage? "
tip_rate = Kernel.gets().to_f()
tip = (bill * (tip_rate / 100)).to_f
puts "The tip is Rs.#{tip}"
puts "The total is Rs.#{bill + tip}"

