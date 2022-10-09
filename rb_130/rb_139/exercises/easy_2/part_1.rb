def step(first, last, step)
  current = first
  loop do
    yield(current)
    break if current + step > last
    current += step
  end
  current
end

p step(1, 10, 3) { |value| puts "value = #{value}" }