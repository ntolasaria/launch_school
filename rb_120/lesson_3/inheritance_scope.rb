# module Swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog  
#   include Swim

#   def swim
#     'swimming' if @can_swim
#   end
# end

# teddy = Dog.new
# teddy.enable_swimming
# p teddy.swim




# Class Variables

# class Animals
#   @@total_animals = 0

#   def initialize
#     @@total_animals += 1
#   end
# end

# class Dog < Animals
#   def total_animals
#     @@total_animals
#   end
# end

# spike = Dog.new
# p spike.total_animals

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# class Car < Vehicle; end

# p Motorcycle.wheels
# p Vehicle.wheels
# p Car.wheels

# Constants

# module FourWheeler
#   WHEELS = 4
# end

# class Vehicle
#   def maintenance
#     "Changing #{WHEELS} tires."
#   end
# end

# class Car < Vehicle
#   include FourWheeler

#   def wheels
#     WHEELS
#   end
# end

# car = Car.new
# puts car.wheels
# puts car.maintenance




# Top level not included

class Vehicle
  WHEELS = 4
end

WHEELS = 6

class Car# < Vehicle
  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels