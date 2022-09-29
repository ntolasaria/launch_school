module Parkable
  def park
    "I am parking"
  end
end


class Vehicle
  require 'time'
  @@vehicle_count = 0

  attr_accessor :color
  attr_reader :model, :year

  def initialize(y, m, c)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
    @@vehicle_count += 1
  end

  def speed_up(num)
    @current_speed += num
  end
  
  def brake(num)
    @current_speed -= num
  end

  def current_speed
    puts "Current Speed: #{@current_speed}"
  end

  def shut_down
    @current_speed = 0
    puts "The car is now shut down."
    current_speed
  end

  def info
    "Year: #{year}\nColor: #{color}\nModel: #{model}\nSpeed: #{@current_speed}"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "The color of your car is now #{color}"
  end

  def self.gas_mileage(ltr, km)
    mileage = km / ltr.to_f
    puts "#{mileage} kilometers per litre of gas."
  end

  def self.gas_mileage(km, ltr)
    puts "#{km / ltr.to_f} kilometers per litre"
  end

  def self.no_of_vehicles
    puts "#{@@vehicle_count} Vehicles"
  end

  def age
    "Your #{model} is #{years_old} years old."
  end

  private

  def years_old
    Time.new.year - year
  end

end

class MyCar < Vehicle
  NO_OF_DOORS = 4
  include Parkable

  def to_s
    "Car Details:\nYear: #{year}\nColor: #{color}\nModel: #{@model}\nCurrent Speed: #{@current_speed}"
  end
end

class MyTruck < Vehicle
  NO_OF_DOORS = 2
  def to_s
    "Truck Details:\nYear: #{year}\nColor: #{color}\nModel: #{@model}\nCurrent Speed: #{@current_speed}"
  end
end

# honda = MyCar.new
# hyundai = MyCar.new
# volvo = MyTruck.new

# Vehicle.no_of_vehicles

# puts honda.park

# puts "---MyTruck method lookup---"
# puts MyTruck.ancestors
# puts "---MyCar method lookup---"
# puts MyCar.ancestors
# puts "---Vehicles method lookup---"
# puts Vehicle.ancestors

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down

MyCar.gas_mileage(95, 10)

lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts lumina.age