def light_toggle_round(lights, round)
  idx = (round - 1)
    while idx < lights.size
      lights[idx] = !lights[idx]
      idx += round
    end
  lights
end

def on_lights(lights_arr)
  result = []
  lights_arr.each_with_index do |val, idx|
    result << (idx + 1) if val
  end
  result
end

def lights_1000(num_of_lights)
  lights_arr = Array.new(num_of_lights, false)
  (1..num_of_lights).each do |round|
    light_toggle_round(lights_arr, round)
  end

  on_lights(lights_arr)
end


p lights_1000(5)
p lights_1000(10)
p lights_1000(1000)

    





