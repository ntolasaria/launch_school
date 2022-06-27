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

4.
```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end 
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes
```
What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?

**Answer:**

The above code outputs and returns an array made up of objects of the class `Animal`. A more appropriate output would have been a new object of the `AnimalClass` class containing all the `Animal` objects from both the objects of `AnimalClass` in the method `AnimalClass#+`. 

The implementation could of the method could be changed as follows:

```ruby
class AnimalClass
  ...
  def +(other_class)
    temp_object = AnimalClass.new("Temporary")
    temp_object << (animals + other_class.animals)
    temp_object
  end
end
```

Here we instantiate an object of the class `AnimalClass` with the string `'Temporary'` passed in as argument and assign it to the local variable `temp_object`. We then call the `<<` method on this objects and pass in the animals of both the objects to the object referenced by `temp_object`. This adds all the animals to the instance variable `@animals` of the object referenced by `temp_object`. We then, return `temp_object`. What this does is return a new object of the class `AnimalClass` with all the animals stored in the instance variable `@animals` and the `@name` as `'Temporary'` which can be changed to more appropriate name later.

5.
```ruby
class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end
  
  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.
```
We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?

**Answer:**

In the above code the `change_info` method does not actually change the values of the instance variables `@name`, `@height` and `@weight`. What it does is intialize three local variables by the name of `name`, `height` and `weight` and assign them the arguments `n`, `h` and `w` respectively which were passed to the method. To make it work as expected we must add `self` to the variable names, so that the setter method is called and the values of the respective instance variables are changed. It can be does as follows:

```ruby
class GoodDog
  ...

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
end
```

6.
```ruby
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name
```
In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?

**Answer:** (Needs to be verified)

When the method `change_name` is called the code `name = name.upcase` is exeecuted. What this does is initialize a local variable `name` and try to assign it to the return value of the method `upcase` called on itself. Since the initialized local variable is `nil`, this raises an error as the method `upcase` does not exist for it. This could be made fine by prepending `name` with `self.`. This would make sure to reference the setter method for the instance variable `@name` rather than initializing a new local variable and the value of `@name` would be changed to the uppercased version of the string. The code can be made fine as follows:

```ruby
class Person
  ...

  def change_info
    self.name = name.upcase
  end
end
```

7.
```ruby
class Vehicle
  @@wheels = 4
  
  def self.wheels
    @@wheels
  end 
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels
```

What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

**Answer:**

The above code outputs `4`, `2`, `2`, `2`, `2`, `2`.

In the code above the class `Vehicle` initializes a class variable `@@wheels` to the integer `4`. It has one class method `self.wheels` which returns the class variable `@@wheels`. Another class `Motorcycle` is defined which inhertits from the class `Vehicle`. Here the class variable `@@wheels` is reassigned to the integer `2`. What this does is change the value of the class variable. Another class `Car` is defined which inherits from the class `Vehicle` as well. Now, the class variable, `@@wheels` is available to the class `Vehicle` as well as all its subclasses and class variable `@@wheels` now points to integer `2` which is what is returned when trying to reference the class variable from any class.

What this demonstartes is that when working with inheritance class variables must not be used or used with caution, as any of the subclasses can change the value of the class variable and that will effect the value for all classes. This can create confusion and undesirable results.

8.
```ruby
class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno
```
What is output and why? What does this demonstrate about `super`?

**Answer:**

The above code outputs and returns the object referenced by `bruno` which is an object of the `GoodDog` class with two instance variables `@name` and `@color` both have the value `'brown'`.

On line 16 the a new object is instantiated by calling the class method `new` on the class `GoodDog` and passing the string `'brown'` as an argument, and this object is assigned to the local variable `bruno`. After the method call, the constructor method of the class `initialize` is automatically called and the parameter `color` now references the string `'brown'` and is available for use within the method as a local variable. Within the method, the method `super` is called which looks up the method lookup path for a method with the same name which happens to be the `initialize` method of the superclass `Animal`. Since, `super` is called without any arguments, all arguments are passed to the method of the superclass. Because of this the instance variable `@name` points to the string `'brown'`. After this the instance variable `@color` is assigned to the object being referenced by the local variable `color` which is the string `'brown'`. So, now the instance variable `@color` points to the same string `'brown'`.

On line 17 the method `p` is called and `bruno` is passed as an argument which outputs and returns the `GoodDog` object being referenced by the local variable `bruno`. 

What this demonstartes about the method `super` is that `super` looks for and calls the method with the same name in which it is called in the method lookup chain. Also, when `super` is called without any arguments, all the arguments of the method in which it is used is passed up the method lookup chain. The method `super` then returns the return value of the method up the lookup chain which was called by it.

9.
```ruby
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
```
What is output and why? What does this demonstrate about `super`?

**Answer:**

The above code raises an error `ArgumentError`.

On line 13 a new object is instantiated by calling the class method `new` on the class `Bear` and the string `'black'` is passed in as an argument and this object is then assigned to the local variable `bear`. After this method call, the constructor method `initialize` of the class `Bear` is called.

After this method call, the parameter `color` references the string `'black'` and is available for use within the method body as a local variable. Within the method, the method is `super` is called. Since `super` is called without any arguments, it looks up the method lookup chain for a method with the same name as `initialize` and by default passes all the arguments to it. Since, the method `initialize` in the superclass `Animal` has no parameter, it can receive no arguments and thus raises an `ArgumentError`.

What this demonstrates is that `super` when called without any arguments, passes all the arguments. 

This code can be made to work by adding blank parantheses `()` to the method call `super` like `super()`. This will make sure that no arguments is passed to the method called by `super`.

10.
```ruby
module Walkable
  def walk
    "I'm walking."
  end 
end

module Swimmable
  def swim
    "I'm swimming."
  end 
end

module Climbable
  def climb
    "I'm climbing."
  end 
end

module Danceable
  def dance
    "I'm dancing."
  end 
end

class Animal
  include Walkable
  def speak
    "I'm an animal, and I speak!"
  end 
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
```
What is the method lookup path used when invoking `#walk` on `good_dog`?

**Answer:**

Method lookup path for method `walk` on `good_dog`.

The method lookup path for `good_dog` can be accessed by calling the class method `ancestors` on the class of `good_dog` which is `GoodAnimals::GoodDog`. It can also be called like `good_dog.class.ancestors`.

GoodAnimals::GoodDog
Danceable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject

The method lookup path first looks in the class of the object on which the method is called. It then proceeds to look into the included modules in the order such that the module added last in looked in first. Then it looks into the superclass and then the modules of the superclass in the same order as before.

In this case it looks in the class `GoodAnimals::GoodDog` then the included modules in the order `Daneable`, `Swimmable` then the superclass `Animal`, then the module mixed in to the the superclass `Walkable` and then the default `Object`, `Kernel` and lastly `BasicObject`.

11.
```ruby
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]

array_of_animals.each do |animal|
  feed_animal(animal)
end
```
What is output and why? How does this code demonstrate polymorphism?

**Answer:**

The above code outputs `"I eat."`, `"I eat plankton."` and `"I eat kibble."` in the same order.

In the above code the local variable `array_of_animals` is initialized to an array with three elements each belonging to the class `Animal`, `Fish` and `Dog` respectively.

The method `each` is called on the array being referenced by `array_of_animals` and the `do..end` block following it is passed as an argument with one parameter `animal`. Within the block the method `feed_animal` is invoked and the local variable `animal` is passed as an argument. After the method call the instance method `eat` is called on the object being referenced by the local variable `animal`.

What this essentially does is call the instance variable `eat` for each of the objects belonging to the classes `Animal`, `Fish` and `Dog`. When the instance method `eat` is called for the objects belonging to the different, the method lookup path for every object is looked up and the instance method encountered first in the method lookup path is executed.

In this case, for the object of `Animal` class, the instance method `eat` belonging to the class `Animal` is executed and `"I eat."` is output. For the object of the class `Fish`, the instance method `eat` belonging to the class `Fish` is executed and `"I eat plankton."` is output. Lastly, for the object of class `Dog` the instance method `eat` belonging to the class `Dog` is executed and `"I eat kibble."` is output.

Here, it can be seen that a method `eat`, which takes in no arguments can be called on objects belonging to different classes and have each of them respond differently. This demonstrates polymorphism and specifically in this case, polymorphism by inheritance. Here whet matters is that all the objects must have a method `eat` in their method lookup and that it should take no arguments.

12.
```ruby
class Person
  attr_accessor :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.jump
```
We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?

**Answer:**

The last line of the above code raises a `NoMethodError`. 

In the above code a class `Person` is defined with a constructor method two instance variables `@name` and `@pets`. A class `Pet` is defined with one instance method `jump`. Two classes `Cat` and `Bulldog` are defined both of which are sub-classes of the class `Pet`. 

A local variable `bob` is initialized to the return value of the class method `new` called on the class `Person` with the string `"Robert"` passed is as an argument. This instantiates a new object of the class `Person`, the instance variable `@name` is assigned to the string `"Robert"`. Two objects belonging to classes `Cat` and `Bulldog` are instantiated and assigned to the local variable `kitty` and `bud` respectively. The method `<<` is called on the return value of the setter method `pets` of the object `bob` and the arguments `kitty` and then `bud` are passed to it. What this does is add the objects being referenced by `kitty` and `bud` to the array referenced by the instance variable `@pets` of the object `bob`. 

On the last line the method `jump` is called on the setter method `pets` being called on `bob`. what this does is call the method `jump` on the array referenced by the instance variable `@pets` of `bob`. Since, the method `jump` exists for objects of the class `Pet` and its sub-classes and is not available for arrays, a `NoMethodError` is raised.

This can be made fine by calling the method `jump` on the individual objects in the array referenced by `@pets` rather than calling on the array itself. One way to do it is as follows:

```ruby
bob.pets.each { |pet| pet.jump }
```

This outputs the string `"I'm jumping!"` twice.

In this code the the relation between objects referenced by `kitty` and `bud` and the object of the `Person` class is that they are collaborator objects.

