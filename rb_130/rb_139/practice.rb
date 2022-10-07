def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call           # => 1
p s1.call           # => 2
p s1.call           # => 3
puts

s2 = sequence
p s2.call           # => 1
p s1.call           # => 4 (note: this is s1)
p s2.call           # => 2