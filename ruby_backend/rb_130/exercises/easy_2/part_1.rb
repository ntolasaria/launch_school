def step(first, last, step)
  current_value = first

  loop do
    yield(current_value)
    break if current_value + step > last
    current_value += step
  end
  current_value
end

p step(1, 10, 3) { |value| puts "value = #{value}" }