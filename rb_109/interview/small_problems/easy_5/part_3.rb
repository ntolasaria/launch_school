MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  hrs, mins = time.split(':').map(&:to_i)
  minutes = (hrs * MINUTES_PER_HOUR) + mins
  minutes % MINUTES_PER_DAY
end

def before_midnight(time)
  hrs, mins = time.split(':').map(&:to_i)
  minutes = (hrs * MINUTES_PER_HOUR) + mins
  (MINUTES_PER_DAY - minutes) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0