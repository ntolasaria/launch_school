items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *fruits_veg, grains |
  puts fruits_veg.join(', ')
  puts grains
end

gather(items) do | fruits, *vegetables , grains |
  puts fruits
  puts vegetables.join(', ')
  puts grains
end

gather(items) do | fruits, *produce |
  puts fruits
  puts produce.join(', ')
end

gather(items) do | apples, corn, cabbage, wheat |
  puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
end
