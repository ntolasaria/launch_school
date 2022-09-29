require 'date'

def friday_13th(year)

  first_date = Date.new(year)
  last_date = Date.new(year + 1)
  result = 0
  (start_date...last_date).each do |date|
    result += 1 if date.friday? && date.day == 13
  end
  result 
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2