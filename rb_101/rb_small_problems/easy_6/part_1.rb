DEGREE = "\xC2\xB0"

def dms(angle)
  result = []
  
  deg = angle % 360
  min = (deg - deg.to_i) * 60 
  sec = (min - min.to_i) * 60

  format(%(#{deg.to_i}#{DEGREE}%02d'%02d"), min.to_i, sec.to_i)

end



p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")