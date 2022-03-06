# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Input - Integer - year
# Output - String century -> 20th, 21st, 102nd etc....

# Data Structures -> integer, string 

# Algorithm
# 1st part -> getting the numeric portion of the century ]

# VAR cent


# if year % 100 is 0 then year / 100
# else (year / 100) + 1

# 2nd part - method suffix, argument - cent
# cent % 100
# if [11, 12, 13] -> then th
# else
#   cent % 10
#   1 - st
#   2 nd
#   3 rd
#   else - th
# end
# end

# join cent + suffix

def suffix(cent)
  return 'th' if [11, 12, 13].include?(cent % 100)

  last = cent % 10
  
  case last
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else        'th'
  end
end


def century(year)
  arr = year.divmod(100)
  if arr[1] > 0
    cent = arr[0] + 1
  else
    cent = arr[0]
  end
  cent.to_s + suffix(cent)
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'