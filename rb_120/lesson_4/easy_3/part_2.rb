class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    greeting = Hello.new
    greeting.hi
  end


end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi