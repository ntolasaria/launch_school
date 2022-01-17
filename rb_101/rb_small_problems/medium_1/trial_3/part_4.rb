def toggle_lights(lights_arr, n)
  lights_arr.each_with_index do |_, idx|
    if (idx + 1) % n == 0 
      lights_arr[idx] = !lights_arr[idx]
    end
  end
  lights_arr
end

def on_lights(lights_arr)
  result = []
  lights_arr.each_with_index do |light, idx|
    result << (idx + 1) if light
  end
  result
end


def lights_1000(n)
  lights = [false] * n

  1.upto(n) do |n|
    lights = toggle_lights(lights, n)
  end

  on_lights(lights)
end

p lights_1000(1000)