puts "Enter the length of the room in meters:"
length = Kernel.gets().chomp().to_f()
puts "Enter the width of the room in meters:"
width = Kernel.gets().chomp().to_f()
area = length * width
puts "The area of the room is #{area.round(2)} square meteres (#{(area * 10.7639).round(2)} square feet)."

