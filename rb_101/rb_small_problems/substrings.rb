# INPUT - string
# OUTPUT - all substrings

# SET counter1 = 0
# loop 1 
#   SET counter2 = 1 
#   loop 2 
#     get all leading substrings 

def leading_substrings(str)
  str_arr = []
  (1..str.size).each do |length|
    str_arr << str.slice(0, length)
  end
  str_arr
end

def substrings(str)
  str_arr = []
  (0..str.size-1).each do |index|
    length = str.size - index
    str_arr.concat(leading_substrings(str.slice(index, length)))
  end
  str_arr
end

p substrings('abcde')