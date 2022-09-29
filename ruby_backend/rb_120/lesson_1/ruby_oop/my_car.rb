class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
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

  def shut_off
    @current_speed = 0
    puts "The car is now shut down."
    current_speed
  end

  def info
    "Year: #{@year}\nColor: #{@color}\nModel: #{@model}\nSpeed: #{@current_speed}"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "The color of your car is now #{color}"
  end

  def self.gas_mileage(ltr, km)
    mileage = km / ltr.to_f
    puts "#{mileage} kilometers per litre of gas."
  end

  def to_s
    puts "Year: #{year}\nColor: #{color}\nModel: #{@model}\nCurrent Speed: #{@current_speed}"
  end
end

honda = MyCar.new(2014, 'Brown', 'Honda City')
# honda.speed_up(40)
# honda.current_speed

# honda.speed_up(20)
# honda.current_speed

# honda.brake(40)
# honda.current_speed

# honda.shut_off
# puts honda.info

# puts honda.color

# honda.spray_paint('silver')
# puts honda.info

MyCar.gas_mileage(10, 95)
"#{honda}"