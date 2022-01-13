DEGREE = "\xC2\xB0"

def dms(deg_float)

  deg = deg_float.to_i
  mins_float = (deg_float - deg) * 60
  mins = mins_float.to_i
  secs = ((mins_float - mins) * 60).to_i
  deg = deg % 360 # takes care of negative as well as above 360degree values

  format(%(#{deg}#{DEGREE}%02d'%02d"), mins, secs)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")