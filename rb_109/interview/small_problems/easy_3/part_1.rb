def prompt(msg)
  puts "==> #{msg}"
end

arr = []

prompt("Enter 1st number:")
arr << gets.chomp.to_i
prompt("Enter 2nd number:")
arr << gets.chomp.to_i
prompt("Enter 3rd number:")
arr << gets.chomp.to_i
prompt("Enter 4th number:")
arr << gets.chomp.to_i
prompt("Enter 5th number:")
arr << gets.chomp.to_i
prompt("Enter the last number:")
num = gets.chomp.to_i

if arr.include?(num)
  prompt("The number #{num} appears in #{arr}.")
else
  prompt("The number #{num} does not appear in #{arr}.")
end
