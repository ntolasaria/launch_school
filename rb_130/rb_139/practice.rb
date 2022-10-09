counter = 0
s1 = Proc.new { counter += 1 }
p s1.call
p s1.call