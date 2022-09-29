MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

DEGREE = "\xC2\xB0"

def dms(deg_f)
  total_sec = (deg_f * SEC_PER_DEG).round
  deg, bal_sec = total_sec.divmod(SEC_PER_DEG)
  min, sec = bal_sec.divmod(SEC_PER_MIN)
  deg = deg % 360

    
  format("%d#{DEGREE}%02d'%02d\"", deg, min, sec)
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