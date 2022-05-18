class Dog
  attr_reader :nickname

  def initialize(n)
    @name = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof!"
  end

  private
  
  attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny")
puts dog.greeting