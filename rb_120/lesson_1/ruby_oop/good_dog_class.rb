# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name
  
#   def initialize(n)
#     @name = n
#   end

#   def speak
#     super + " from GoodDog class"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new('Sparky')
# paws = Cat.new
# puts sparky.speak
# puts paws.speak


# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   attr_accessor :color

#   def initialize(color)
#     super
#     @color = color
#   end
# end

# class BadDog < Animal
#   attr_accessor :age
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end


# # bruno = GoodDog.new("brown")
# # puts bruno.name
# # puts bruno.color

# sparky = BadDog.new(2, 'Sparky')
# puts sparky.name
# puts sparky.age

class Animal
  def initialize
    puts "`#initialize` in `Animal` has been invoked"
  end
end

class Bear < Animal
  def initialize(color)
    super(1)
    @color = color
  end
end

bear = Bear.new("black")