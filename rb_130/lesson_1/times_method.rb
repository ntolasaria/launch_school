# method implementation
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end

  number
end

# method invocation
times(5) do |num|
  puts num
end

# Expected output and return

# 0
# 1
# 2
# 3
# 4
# => 5

# trace
# line 13 -> 2 -> 3 -> loop starts

# 4 -> 5 -> 13 -> 14 -> 15 -> 6 -> 7 checks again at 4 and repeats or breaks total

# 9 -> 10