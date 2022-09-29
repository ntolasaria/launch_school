# 1000 Lights

# INPUT - Integer - number of switches - n
# OUTPUT - Array of Integers - switch nos that are on

# RULES - n number of reps 
#       - each rep is multiples of current value
#         i.e.  - 1st rep 1,2,3,4,5,....(all on, toggle after rep 1)
#               - 2nd rep 2,4,6,8.... 
#               - 3rd rep 3,6,9,12....
#               - 4th rep 4,8,12.... 

# START
# GET - value of n
# arr_switches = n times false
# itertate and make every convert the value

def switches(n)
  arr_switches = [false] * n

  (1..n).each do |rep|
    index = (rep - 1)
    while index < n 
      arr_switches[index] = !arr_switches[index]
      index += rep
    end
  end

  result = []

  arr_switches.each_with_index do |switch, idx|
    result << (idx + 1) if switch
  end

  result
end


print "Please enter the number of switches (integer greater than 0): "
n = Kernel.gets().chomp().to_i
p switches(n)



  