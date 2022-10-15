class Parent
  private

  def a_method
    puts "private method from Parent!"
  end
end

class Child < Parent
end

Child.new.a_method
