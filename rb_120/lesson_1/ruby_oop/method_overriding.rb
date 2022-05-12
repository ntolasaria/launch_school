class Parent
  def say_hi
    p "Hi from Parent."
  end
end

class Child < Parent
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end

  def instance_of?
    p "I am a fake instance"
  end
end

# c = Child.new
# p c.instance_of? Child
# p c.instance_of? Parent

heir = Child.new
heir.instance_of? Child