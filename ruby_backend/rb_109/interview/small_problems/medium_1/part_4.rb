# You have a bank of switches before you, numbered from 1 to n. Each switch 
# is connected to exactly one light that is initially off. You walk down the 
# row of switches and toggle every one of them. You go back to the beginning, 
# and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns 
# an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


# Input - integer - no of switches
# Output - Array - index of switches that are on (strating at 1)

# Rules 
# - on every round (number n) every nth switch is toggled

# Algorithm - 

# - initialize an array `switches` of booleans (false) of size of the input `n`
# - iterate from 1 to n
#   - on every iteration toggle the respective array element to be equal to not the array element
# - transform the array of booleans to represent the index position where true and false where false
# - select the elements that or not nil or false and return the Array

def lights_1000(n)
  switches = [false] * n
  n.times do |round|
    switches = toggle_switches(switches, round)
  end
  on_lights(switches)
end

def toggle_switches(switches, round)
  idx = round
  step = round + 1
  while idx < switches.size
    switches[idx] = !switches[idx]
    idx += step
  end
  switches
end

def on_lights(switches)
  lights = []
  switches.each_with_index do |light, idx|
    lights << (idx + 1) if light
  end
  lights
end

p lights_1000(1000)
