def prompt(message)
  Kernel.puts("==> #{message}")
end

prompt("Enter the first number :")
num1 = Kernel.gets().chomp().to_i
prompt("Enter the second number :")
num2 = Kernel.gets().chomp().to_i

sum = num1 + num2
diff = num1 - num2
product = num1 * num2
quotient = num1 / num2
remainder = num1.divmod(num2)[1] 
power = num1 ** num2

prompt("#{num1} + #{num2} = #{sum}")
prompt("#{num1} - #{num2} = #{diff}")
prompt("#{num1} * #{num2} = #{product}")
prompt("#{num1} / #{num2} = #{quotient}")
prompt("#{num1} % #{num2} = #{remainder}")
prompt("#{num1} ** #{num2} = #{power}")
