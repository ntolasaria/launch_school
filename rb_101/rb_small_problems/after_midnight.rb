def after_midnight(hhmm_str)
  hours = (hhmm_str.slice(0,2).to_i) % 24
  minutes = hhmm_str.slice(3,2).to_i
  minutes_from_midnight = (hours * 60) + minutes
  minutes_from_midnight
end

def before_midnight(hhmm_str)
  (1440 - after_midnight(hhmm_str)) % 1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0