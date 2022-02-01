require 'date'

def friday_13th(year)
  start_date = Date.new(year, 1, 13)
  result = 0
  12.times do 
    result += 1 if start_date.friday?
    start_date = start_date.next_month
  end
  result
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2