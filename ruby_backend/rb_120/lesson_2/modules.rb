module Swim
  def swim
    "swimming!"
  end
end

class Dog
  include Swim
  # code
end

class Fish
  include Swim
  # code
end

puts Dog.ancestors
puts "-------------"
puts Fish.ancestors
