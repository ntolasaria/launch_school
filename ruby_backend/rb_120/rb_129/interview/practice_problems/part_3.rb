#  PENDING
t


class Human  # Problem received from Raul Romero
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end

  def equal?(other)
    name == other.name
  end

  def to_s
    self
  end
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna

puts anna.equal?(gilles) #should output true # 
puts anna + gilles # should output annagilles 
