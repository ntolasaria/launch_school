items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*fruits_vegetables, grains|
  puts fruits_vegetables.join(', ')
  puts grains
end

gather(items) do |fruits, *vegetables, grains|
  puts fruits
  puts vegetables.join(', ')
  puts grains
end

gather(items) do |fruits, *other_produce|
  puts fruits
  puts other_produce.join(', ')
end

gather(items) do |produce1, produce2, produce3, produce4|
  puts "#{produce1}, #{produce2}, #{produce3} and #{produce4}"
end