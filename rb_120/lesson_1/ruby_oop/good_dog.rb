# module Speak
#   def speak(sound)
#     puts "#{sound}"
#   end
# end

# class GoodDog
#   # include Speak
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says Arf!"
#   end 
# end

# Refactored with `#attr_accessor`

# class GoodDog
#   attr_accessor :name, :height, :weight
  
#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
  
#   def some_method
#     info
#   end

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info
# puts GoodDog.what_am_i


# class HumanBeing
#   include Speak
# end

# sparky = GoodDog.new("Sparky")
# fido = GoodDog.new("Fido")

# puts sparky.speak
# puts fido.speak

# puts sparky.name
# sparky.name = "Spartacus"
# puts sparky.name
# sparky.speak("Arf!")
# bob = HumanBeing.new
# bob.speak("Hello!")

# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ''
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors

# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new('Sparky', 4)
# puts sparky.age

# puts "#{sparky}"

### Playing around with `self`

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

  puts self
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self