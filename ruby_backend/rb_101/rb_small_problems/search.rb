arr = []
5.times do |n|
  puts "==> Enter no. #{n+1}:"
  arr << Kernel.gets().chomp().to_i
end

puts "==> Enter the last number:"
num = Kernel.gets().chomp().to_i()

if arr.include?(num)
  puts "The number #{num} appears in #{arr}."
else
  puts "The number #{num} does not appear in #{arr}."
end

