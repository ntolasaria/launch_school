require 'date'

# def friday_13th(year)
#   start_date = Date.new(year)
#   end_date = Date.new(year + 1) - 1
#   result = 0

#   (start_date..end_date).each do |date|
#     result += 1 if date.day == 13 && date.friday?
#   end
#   result
# end

def friday_13th(year)
  date = Date.new(year, 1, 13)
  result = 0
  12. times do 
    result += 1 if date.friday?
    date = date.next_month
  end
  result
end
 

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2