require 'date'

def time_of_day1(minutes)
  hhmm_arr = minutes.divmod(60)
  hhmm_arr[0] = hhmm_arr[0] % 24
  format('%02d:%02d', hhmm_arr[0], hhmm_arr[1])
end

def time_of_day2(minutes)
  time = Time.new(2021)
  time += (minutes * 60)
  time.strftime('%H:%M')
end

def time_of_day3(minutes)
  time = Time.new(2017)
  time += (minutes * 60)
  time.strftime('%A, %H:%M')
end


puts time_of_day3(0) 
puts time_of_day3(-3)
puts time_of_day3(35)
puts time_of_day3(-1437) 
puts time_of_day3(3000) 
puts time_of_day3(800) 
puts time_of_day3(-4231) 