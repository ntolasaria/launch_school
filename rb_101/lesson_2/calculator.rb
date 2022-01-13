# ask the user for two numbrs
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message)
 MESSAGES[LANGUAGE][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  msg = case op
          when '1'
          'Adding'
          when '2'
          'Subtracting'
          when '3'
          'Multiplying'
          when '4'
          'Dividing'
        end
  puts "A random line of code!!"
  msg
end

prompt(messages('welcome'))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('num1'))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('valid_num'))
    end
  end

  number2 = ''
  loop do
    prompt(messages('num2'))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('valid_num'))
    end
  end

  #operator_prompt = <<-MSG
   # What operation would you like to perform?
   # 1) add
   # 2) subtract
   # 3) multiply
   # 4) divide
 # MSG
  prompt(messages('operator_list'))
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_op'))
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('op_msg')}")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end
  prompt("#{messages('result_msg')} #{result}")

  prompt(messages('loop_msg'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('bye_msg'))
