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

