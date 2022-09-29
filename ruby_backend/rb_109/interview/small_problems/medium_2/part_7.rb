# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given by 
# an argument. You may assume that the year is greater than 1752 
# (when the United Kingdom adopted the modern Gregorian Calendar) and that 
# it will remain in use for the foreseeable future.

# Input - year
# Output - integer

# Rules
# - output will be the count of fridays that are dated 13 in the given year

# Algorithm

# - require class 'date'
# - initialize `date` to 13th january of the given year
# - initialize variable `result` to 0
# - start loop (12 times)
# - add 1 to result if day is friday
# - set date to 13th of next month

# return result

require 'date'

# def friday_13th(year)
#   date = Date.new(year, 1, 13)
#   friday_count = 0
#   12.times do 
#     friday_count += 1 if date.friday?
#     date = date.next_month
#   end
#   friday_count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# Further Exploration

# An interesting variation on this problem is to count the number of months that have five Fridays. 
# This one is harder than it sounds since you must account for leap years.

# Input - integer - year
# Output - integer - count of months that have 5 fridays

# Algorithm 

# - set `date` to 1st day of the input year
# - iterate to friday
# - initialize variable `month_count` to 0
# - start loop
#   - set variable friday count to 0
#   - set variable current_month to the month of corresponding date
#   - start loop
#     - add 1 to friday count
#     - add 7 date 
#   - break if current_month is not equal to month for date
#   if friday is greater than 4 add 1 month_count
# - break if year for date is not equal to input year

# - return month_count

MONTHS = %w(January February March April
            May June July August
            September October Novemeber December)

def five_friday_months(year)
  date = Date.new(year)
  date += 1 until date.friday?
  month_count = 0
  months = []
  while date.year == year
    fridays = 0
    current_month = date.month
    while current_month == date.month
      fridays += 1
      date += 7
    end
    month_count += 1 if fridays > 4
    months << current_month if fridays > 4
  end
  months.map { |month| MONTHS[month - 1] }
end

p five_friday_months(2000)
