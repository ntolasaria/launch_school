# st - 1 nd - 2 rd - 3 th - 4 - 0

#INT_TO_STR = {  'st' => [1,21,31,41,51,61,71,81,91],
 #               'nd' => [2,22,32,42,52,62,72,82,92],
  #              'rd' => [3,23,33,43,53,63,73,83,93] }


def century(year)
  year_div = []
  century = 0
  year_div = year.divmod(100)
  if year_div[1] == 0
    century = year_div[0]
  else
    century = year_div[0] + 1
  end

  "#{century.to_s}#{century_suffix(century)}"
end

def century_suffix(century)
  if [11,12,13].include?(century % 100)
    'th'
  else
    last_digit = century % 10
    case last_digit
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
    end
  end
end

puts century(2000) 
puts century(2001) 
puts century(1965) 
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201) 

 
    
