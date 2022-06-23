1.
```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end 
end

bob = Person.new
p bob.name
```
What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

**Answer:**

The above code outputs and returns `nil`.

On lines 1-7 a class `Person` is defined which has one instance variable `@name` and one instance method `set_name`.

On line 9, an object of class `Person` is instantiated using the `new` class method and assigned to the local variable `bob`.  On line 10 the method `p` is invoked to which `bob.name` is passed as an argument. Here the instance method `name` is called on `bob` which is essentially the getter method for the instance variable `@name`. The instance variable in the class `Person` is initialized when the instance method `set_name` is invoked. Since, it is not invoked over here, the instance variable `@name` is not initialized and hence the getter method `name` returns `nil` which is output and returned by the method `p`.

This demonstrates the fact that even though an instance variable is not initialized, trying to reference it returns `nil` whereas when trying to reference a local variable which has not been initialized raises `NameError`.

2.
```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end 

class Dog
  include Swimmable
  
  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```
What is output and why? What does this demonstrate about instance variables?

**Answer:**

The above code outputs and returns `nil`.

On lines 1-5 a module `Swimmmable` is defined with one method `enable_swimming`. On lines 7-13 a class `Dog` is defined in which the module `Swimmable` is mixed in.

On line 15 an object of the class `Dog` is instantiated with the `new` class method and the local variable `teddy` is initialized to it. On line 16, the method is called and `teddy.swim` is passed as argument. Here the instance method `swim` is called on the local variable `teddy`. Within this method, the `if` condition is falsey as the instance variable `@can_swim` is not initialized yet and trying to reference it returns `nil`. In the above code, the instance variable `@can_swim` would be intialized if the method `enable_swimming` within the module `Swimmable` would have been called. And since, it was not called, the instance variable was not initialized. Since the `if` condition evaluates to `false` the instance method `swim` returns `nil` which is output and returned by the method `p`.

This demonstrates that trying to refernce an instance variable which has not been initialized returns `nil` whereas with local variables, trying to access a local variable which has not been initialized raises `NameError`.

3.
```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable
  
  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape
```
What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?

**Answer:**

The above code outputs `4` two times and then raises an error `NameError`.

In the first call to method `p`, `Square.sides` is passed as an argument. Here the class method `sides` is called on the class `Square`. Within the class method `sides`, which is defined in the class `Shape` which is a superclass of `Quadrilateral` which in turn is a superclass of `Square`,  the expression `self::SIDES` is executed. Here `self` refers to the class `Square` on which the method `sides` is called. Hence `self::SIDES` returns the value of the constant `SIDES` which is `4` as intialized in the class `Quadrilateral` which is superclass of the class `Square` and thus `4` is output returned by the method `p`. Hence, it can be seen that a constant initialized in one class is available in the scope of its subclasses.

In the second call to method `p`, `Square.new.sides` is passed as an argument. Here the instance method `sides` is called on the object instantiated and returned by the class method `new` called on the class `Square`. What this does is basically call the instance method `sides` on an object of the `Square` class. The instance method `sides` is defined in the superclass `Shape`. Here within, the method the expression `self.class::SIDES` is executed. Here, `self` refers to the object of the `Square` class, hence `self.class` basically refers to `Square` itself and `self.class::SIDES` basically means `Square::SIDES` which returns the value of the constant `SIDES` defined in the class `Quadrilateral` which is `4` and this is output and returned by the method `p`.

In the third call to method `p`, `Square.new.describe_shape` is passed as an argument. Here the method `describe_shape` is called on the object of the class `Square` which is instantiated and returned by the class method `new` called on the class `Square`. The method `describe_shape` is defined in the module `Describable` which is mixed in the class `Shape` which is also a superclass of the class `Square`. Hence, this method is available to the objects of the class `Square`. Within the method `describe_shape`, `self` refers to the object on which the method is called which an object of the `Square` class. Hence, `self.class` refers to the class `Square`. However, the constant `SIDES` is not available in the scope of the module `Describable` and thus tring to refernce it raises a `NameError` and stops further execution.

Here, we can see that a constant initialized in a class is available in the scope of that class as well as it's subclasses. Howver, the constant is not available in the scope of its superclass as well as in the scope of any modules mixed in to the class or its superclass.

