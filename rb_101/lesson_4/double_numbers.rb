def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0

  loop do 
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter +=1
  end
  numbers
end

def double_numbers_odd_index!(numbers)
  counter = 0
  
  loop do 
    break if counter == numbers.size

    if counter.odd?
      numbers[counter] = numbers[counter] * 2
    end
    
    counter += 1
  end

  numbers
end

def multiply(numbers, multiplier)
  multiplied_num = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_num << numbers[counter] * multiplier

    counter += 1
  end

  multiplied_num
  end

     

my_numbers = [1,4,3,7,2,6]
p multiply(my_numbers, 3)
p my_numbers