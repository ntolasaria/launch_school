class Cube
  # attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

cube = Cube.new(100)
# p cube.instance_variable_get('@volume')
p cube.volume