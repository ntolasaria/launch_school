require 'yaml'
MESSAGES = YAML.load_file('car_loan_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def float?(num)
  num.to_f.to_s == num && num.to_f > 0
end

def valid_number?(num)
  integer?(num) || float?(num)
end

prompt("Welcome to Mortgage / Car Loan Calculator")
prompt("-----------------------------------------")

loop do
  loan_amount = ''

  loop do
    prompt("Please enter the loan amount (Rs.):")
    loan_amount = Kernel.gets().chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt("Please enter a valid amount!")
    end
  end

  apr = ''
  loop do
    prompt("Please enter the APR (%):")
    apr = Kernel.gets().chomp()
    if valid_number?(apr)
      break
    else
      prompt("Please enter a valid APR (above 0) :")
    end
  end

  loan_duration = ''
  loop do
    prompt("Please enter the duration of loan in years:")
    loan_duration = Kernel.gets().chomp()
    if valid_number?(loan_duration)
      break
    else
      prompt("Please enter a valid duration!")
    end
  end

  monthly_int_percent = apr.to_f / 12
  monthly_int = monthly_int_percent / 100
  prompt("The monthly interest rate is #{monthly_int_percent}%.")

  loan_months = loan_duration.to_f * 12
  prompt("The loan duration is #{loan_months} months.")

  emi = loan_amount.to_f * (monthly_int / 
        (1 - (1 + monthly_int) ** (-loan_months)))
  prompt("The monthly payment is Rs. #{emi.to_i}/-")
  prompt("Would you like to do another calculation (Y for yes)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage / Car Loan Calculator!!!")
prompt("---------------------------------------------------------")
