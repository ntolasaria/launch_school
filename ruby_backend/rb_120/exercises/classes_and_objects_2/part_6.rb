class Cat
  COLOR = %w(purple pink grey brown white)

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR.sample} cat!"
  end
end


kitty = Cat.new('Sophie')
kitty.greet
