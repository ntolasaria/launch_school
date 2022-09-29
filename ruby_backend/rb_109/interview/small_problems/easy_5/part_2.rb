# def time_of_day(int)
#   minutes = int % 1440
#   hours, minutes = minutes.divmod(60)
#   format('%02d:%02d', hours, minutes)
# end

# Without using % operator on negative numbers

def time_of_day(int)
  while int < 0
    int += 1440
  end
  mins = int % 1440
  hrs, mins = mins.divmod(60)
  format('%02d:%02d', hrs, mins)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"