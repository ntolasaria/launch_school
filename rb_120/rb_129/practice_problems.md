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

13.
```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end
  
  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end 
end

teddy = Dog.new("Teddy")
puts teddy.dog_name
```
What is output and why?

**Answer:**

The about code outputs the string `"bark! bark!  bark! bark!"` and returns `nil`.

In the above code a class `Animal` is defined with a constructor method `initialize`, it has one instance variable `@name`. Another class `Dog` is defined which is a subclass of `Animal`. It has one constructor method which takes in one parameter `name`. It has an instance method `dog_name`. The class `Dog` has an instance variable `@name`. 

When a new object of the class `Dog` is instantiated and the string `"Teddy"` is passed as n argument. The constructor method of the class `Dog` is called. The method parameter `name` now references the string `"Teddy"`. Since, the method body is empty, nothing is done within the method.

When the method `dog_name` is called on the `Dog` object refernced by `teddy` the instance method `dog_name` is called. Within this method, the instance variable `@name` is referenced by string interpolation. Since, the instance variable `@name` is not yet initialized trying to access it returns `nil`. Hence when the method `puts` is called and `teddy.dog_name` is passed as argument, the string `"bark! bark!  bark! bark!"` is output and `nil` is returned.

Even though the superclass of `Dog` - `Animal` has a method named `initialize`, the same was not called. There were two ways in which it could have been called, by calling `super` from within the `initialize` method of the class `Dog` or by removing the `initialize` method from the class `Dog` altogether.

14.
```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end 
end

al = Person.new('Alexander')
alex = Person.new('Alexander')

p al == alex # => true
```

In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`?

Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?

**Answer:**

The last line of the code currently uses the `BasicObject#==` method which compares to see if the two variables point to the same object and thus it returns `false` as both are different objects. 

To, elaborate, we have instantiated two objects of the class `Person` and passed in the argument `'Alexander'` for each of them and made the local variables `al` and `alex` refernce one object each. The argument passed in while instantiation is assigned to the instance variable `@name` as defined in the constructor method `initialize`.

If we want to compare, whether the two objects have the same name, then we have to define a custom `==` method in the `Person` class which will specify the criteria for comparison. The same can be done as follows:

```ruby
class Person
  ...

  def ==(other_person)
    name == other_person.name
  end
end
```
Now if we execute the code `p al == alex`, `true` will be returned. The method `==` in `Person` relies on the method `String#==` to compare the values of the strings and returns the result accordingly.

Now, `al.name == alex.name` returns `true` this means that the value of the string object referenced by `al.name` and `alex.name` is the same, not that they are the same objects. This can be tested by comparing the `object_id` of both the strings or by using the method `equal?` for comparison. This can de done as follows:

```ruby
p al.name.object_id == alex.name.object_id      # => false

# or

p al.name.equal?(alex.name)                     # => false
```

15.
```ruby
class Person
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    "My name is #{name.upcase!}."
  end 
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
```
What is output on `lines 14, 15, and 16` and why?

**Answer:**

The output of `lines 14, 15 and 16` is `"Bob"`, `"My name is BOB."` and `"BOB"` respectively.

In the above code a class `Person` is defined with a contructor method `initialize` and an instance method `to_s`. It has one instance variable `@name`. On `line 13` a new object of class `Person` is instantiated and the string `'Bob'` is passed as an argument. local variable `bob` is initialized and made to reference this `Person` object. Now, the within the contstructor method `initialize`, instance variable `@name` references the string `"Bob"`.

On `line 14`, the getter method `name` is called on the object refernced by `bob` and the return value is passed to the method `puts` as argument. The getter method returns the object being referenced by the instance variable `@name`, which in this case is the string `"Bob"` and hence that is output and `nil` is returned.

On `line 15`, the method `puts` is called and `bob` is passed as an argument. This calls the `to_s` instance method defined in the class `Person` and the return value of the method `to_s` belonging to the class `Person` is output. Here the last line of the method `to_s` is `"My name is #{name.upcase!}."` where the getter method is called and the method `upcase!` which is a destructive / mutating method is called on the return value of the method. The getter method returns the object being referenced by `@name` and the method `upcase!` mutates the object to the value `"BOB"`. The result of this is that `"My name is BOB."` is output. Also, now the string object being referenced by `@name` has the value `"BOB"`.

On `line 16` the method `puts` is called and the return value of the method `name` called on `bob` is passed argument. The method `name` returns the object being referned by `@name` which is now, `"BOB"`, hence the `"BOB"` is output ad `nil` is returned.

16.

Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.

**Answer:** (Needs to be verified)

When trying to set an instance variable within a class, it is generally a good idea to use the setter method instead of referencing the instance variable directly. This gives us more control over the way, we want our instance variables to be assigned. Also, if we wanted some added functionality like data validation or assigning a specific type of data we get the flexibility to do that just by changing the setter method. 

Assume a class `Person` with an instance variable `@age`. We want to assign the integer value of the number passed in string format. We can use incorporate that functionality in the setter method. And it works for the entire code. Example:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def age=(string)
    @age = string.to_i
  end

  def age
    @age
  end
end
```

In the setter method `age=()` above, the argument is converted into an integer and then assigned to the instance variable `@age`. Now, if someone would happen to pass in a numeric string, the method code would still work.


17.
Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`.

**Answer:** (Needs to be verfied and improved)

Ruby provides use with the method `attr_reader` to define getter method. However, sometimes its useful to create our own getter methods. This gives the flexibility to display and reference the data the way in which it is intended and revelant to the program. 

For example, say there is an instance variable `@card_number` containing the bank card numbers of account holders. And for safety and as a protocol only the last for digits are required to be referenced throughout the program. We can make this change in our getter method and that would enable it accross the entire program.

For example:

```ruby
def card_number
  # converts '1234-5678-1234-5678' to 'xxxx-5678'
  'xxxx-' + @card_number.split('-').last
end
```

Here it can be seen that the card number is returned the way we would like to. This gives us flexibility to do so. Also, say if we need to change the way the card number is accessed in the future, it can be changed by simply changing the getter method.


18.
```ruby
class Shape
  @@sides = nil
  
  def self.sides
    @@sides
  end
  
  def sides
    @@sides
  end 
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end
```

What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

**Answer:**

In the code above a class `Shape` is defined with one class variable `@@sides`, one class method `self.sides` and one instance method `sides`.

Two more classes are defined named `Triangle` and `Quadrilateral` and both are made the subclasses of `Shape`. Both the classes have a constructor method `initialize`.

When we execute `Triangle.sides`, the class method `sides` is invoked on the class `Triangle`. The class method for the class `Triangle` is up in the method lookup path in its superclass `Shape`. Here the class method `self.sides` returns the class variable `@@sides` which is also intialized in the class `Shape` and has the value `nil`. Thus executing `Triangle.sides` returns `nil`.

When `Triangle.new.sides` is executed. A new object of the class `Triangle` is instantiated and the constructor method `initialize` is automatically executed. Within the `initialize` method the class variable `@@sides` is reassigned to the integer `3`. Then the instance variable `sides` is called on this object of class `Triangle`. The instance method `sides` is located up in the method look up path in the superclass `Shape` where it returns the value of the class variable `@@sides`. The class variable `@@sides` now points to the integer `3` and that is what is returned.

This demonstartes the fact that class variables initialized in one class can be modified in its subclasses. This can be a confusing behaviour and thus when working with inheritance, class variables must be used with caution.


19.
What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.

**Answer:** (To be verified, and example improved)

Ruby provides with a method `attr_accessor` which creates a setter and a getter method for an instance variable. The way the `attr_accessor` method is used is as follows:

```ruby
attr_accessor :name
```

The instance variable is given as an argument in the form of a symbol. The `attr_accessor` method above will provide us with a setter method `name=` and a getter method `name` for the instance variable `@name`. 

It might be a bad idea to add an `attr_accessor` method for every instance variable in a class. As it provides us with an interface to change / modify the value of instane variables, which might not be a good thing always. 

Lets, asssume a class `Person` with an instance variable `@name`. We want to set the instance variable when the object is instantiated and don't want to change it. We might however want to access the value stored in `@name`. In this case, its a better idea to use to the `attr_reader` method.

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('Bob')
puts bob.name     # => Bob
bob.name = 'Tim'  # => NoMethodError
```

Trying to change the value of the instance variable `@name` raises an error. This protects our data from unwanted changes.


21.
What is the difference between instance methods and class methods?

**Answer:**

Instance methods are methods within a class that can be called on instances (or objects) of classes. They are available to use for the objects of the class only. These methods provide the interface for interacting with the attributes of the object and performing the required behaviour. 

Class methods are methods within a class that can only be called on the class itself. They are defined with `self` prepended to their name. Class methods are used to define behaviour which is required at a class level and not at the object (or instance) level. 

Example:

```ruby
class Person
  @@total_persons = 0

  def initialize(name)
    @name = name
    @@total_persons += 1
  end

  def say_name
    puts "Hi, my name is #{@name}."
  end
  
  def self.number_created
    @@total_persons
  end
end

bob = Person.new('Bob')
tim = Person.new('Tim')

bob.say_name
tim.say_name

puts Person.number_created
```

In the code above `say_name` is an instance method and is called on the instances (objects) of the class `Person` referenced by local variables `bob` and `tim`. The method references the instance variable `@name` for each of the object. The method acts or provides an interface at the object level.

`number_created` is a class variable and keeps track of the class related aspects, like the total number of objects created of that class. It has to be called on the class `Person` itself and not on any instance (object) of it.

Another way of visualising the difference in the way the methods are called can be seen below:

```ruby
Person.new('Bob').say_name    # => Hi, my name is Bob.
Person.number_created         # => 1
```

22.
What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

**Answer:**

Objects encapsulate state and attributes. The states of an object are saved in it's instance variables. Instance method operates on those instance variables. The instance variable in turn holds objects belonging to classes like `String`, `Integer`, `Array`, `Hash` etc. or even an object of a custom class we have created. Objects that are stored as state within another object are called "collaborator objects".

They are called collaborator objects because they work in collaboration (or conjuntion) with the class they are asssociated with.

Example: 
```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Dog
  def speak
    puts "bark!"
  end

  def fetch
    puts "fetching!"
  end
end

bob = Person.new("Bob")
bud = Dog.new

bob.pet = bud

bob.pet.speak       # => "bark!"
bob.pet.fetch       # => "fetching!"
```

In the code above, the instance variable `@pet` of the object `bob` is set to variable `bud` which references an object of the `Dog` class. So here the object referenced by `bud` is the collaborator object. If we need the collaborator object to perform some actions /  behaviours we can call the method by going through the `bob` and calling the the method on the object referenced by `@pet` such as `fetch` or `speak`.

For a mental model, the relationship between a class and collaborator objects should a "has-a" relationship. For instance, A `Person` has a pet `Dog`.

23.

How and why would we implement a fake operator in a custom class? Give an example.

**Answer:**

Ruby provides with many methods like `==`, `+`, `-`, `<`, `>` etc. which actually look like operators. Since, these are methods, we can define them in our custom classes and make then override the default methods and behave in the way we intend to. It provides us with a very nice and clean syntax when writing code.

For example, lets assume a class `Person` which has two instance variables `@name` and `@age`. And when we compare two `Person` objects we are actually comparing their age. We can define the relevant operators (methods) in our class in order to do so.

```ruby
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def ==(other_person)
    age == other_person.age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
tim = Person.new("Tim", 33)

puts kim == tim         # => true as the age is the same

puts "Bob is elder" if bob > kim  # => "Bob is elder"
```

We can see in the code above, by defining the methods `==` and `>` in our class `Person` we can use them for comparison of two objects of the class `Person` in the way that is relevant to our program. In this case we compare the integer value of the instance variable `@age` of the different objects.

24.

What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

**Answer:**

`self` in Ruby is used for several things inside a class. For example, when used within an instance method, `self` allows us to call setter methods and allows Ruby to distinguish that from creating a new local variable.

For example :

```ruby
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def change_name(name)
    self.name = name
  end
end

bob = Person.new("Bob")
bob.change_name("Tim")
```

Here, within the instance method `change_name` adding `self.` before `name` helps in calling the setter method for instance variable `@name`. Without the use of `self` it would have simply created a local variable with `name` instead of calling the setter method for `@name`. 

Here, `self` represents the object itself, in this case the `Person` object referenced by `bob`. So basically `self.name` is the same as calling `bob.name` from outside the class. 

It can also be used to cause getter methods, though that is not always required.

When used outside of instance methods, `self` refers to the class itself and can be used to define class methods. 

Example:

```ruby
class Person
  attr_accessor :name

  @@total_persons = 0

  def initialize(name)
    @name = name
    @@total_persons += 1
  end

  def self.number_of_persons
    @@total_persons
  end
end
```

Here, the class method `number_of_persons` uses `self`. Here, `self` refers to the class itself, in this case `Person`. Basically, the method `self.number_of_persons` is the same as `Person.number_of_persons` from outside the class.

So, it can be seen that what is referred to by `self` changes depening on the scope it used in

- when used within an instance method, `self` refers to the object on which the instance method is being called.
- when used outside of an instance method, `self` refers to the class itself.


25. **Needs to be verified**
    
```ruby
class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"
```

What does the above code demonstrate about how instance variables are scoped?

**Answer:**

In the above code a class `Person` is defined which has one instance variable `@name` and two instance methods, one constructor `initialize` and another `get_name`.

On lines 11 and 12 two objects of the class `Person` are instantiated and the local variables `bob` and `joe` are initialized to reference these objects. 

when `puts` is called on `bob.inspect` and `joe.inspect`, the objects being referenced by the local variables `bob` and `joe` are output. It can be seen that these are objects of the class `Person` and each have an instance variable `@name` which is different for both the objects.

Hence, it can be seen that the scope of an instance variable is the object (instance) itself. The instance variable `@name` exists for each instance of the class and is unique for the object. 

On the last line `p bob.get_name` outputs and returns the value of the instance variable `@name` for the object referenced by `bob` which has the value `"bob"` and that is what is output and returned.


26.

How do class inheritance and mixing in modules affect instance variable scope? Give an example.

**Answer:** (Needs to be verified)

Instance variables are scoped at the instance (object) level. They exist as long as the object exists. Since, instance variables are scoped at the object level and not at a class level, they are available across the entire inheritance heirarchy of an object which includes classes and modules that are mixed in. They have to be accessed by referring to the particular object.

Example:

```ruby
module Walkable
  def walk
    "#{@name} is walking"
  end
end

class Being
  def initialize(name)
    @name = name
  end
end

class Person < Being
  include Walkable
  
  def initialize(name, education)
    super(name)
    @education = education
  end

  def greet
    "Hi, my name is #{@name}, I study #{@education}"
  end
end

tim = Person.new("Tim", "Architecture")
puts tim.walk     # => Tim is walking
puts tim.greet    # => Hi, my name is Tim, I study Architecture
p tim             # => Person object
```
In the above code it can be seen that the object of class `Person` referenced by `tim` has two instance variables `@name` and `@education`. `@name` is initialized in it's super class `Being` and `@education` is initialized in `Person`. However, both these instance variables are available accross the entire inheritance heirarchy. 

Also, even mixed in modules are included in this. It can be seen that the module `Walkable` which is mixed in to the class `Person` can reference the instance variable `@name`. 

Hence, it can be seen that instance variables are scoped at the object level rather than being scoped at the level of any particular class. 


27.

How does encapsulation relate to the public interface of a class?

**Answer:**

Encapsulation is an important concept in object oriented programming. It lets us hide the internal representation of an object from the outside and only exposes methods and properties that users need. Method access control can be used and the methods and properties that are needed only within the class can be made private or protected as per the requirement. The methods and properties that's needed to be used outside the class can be exposed through the public interface of the class by making the methods and properties public.

Example:

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hi, my name is #{name.capitalize}."
  end

  def change_name(name)
    self.name = name
  end

  private

  attr_writer :name
end

tim = Person.new("tim")
puts tim.greet
tim.change_name("tom")
puts tom.greet
```

In the code above, the public method, `change_name` is used to change the `@name` of the `Person` object which in turn uses the private setter method of the class to change the value of the instance variable `@name`. This functionality is within the class and hidden from us. Also, the method `greet` returns a greeting with the name of the particular object interlopated and capitalized. Here, again the method implementation is hidden, all we know is that calling the method returns a string greeting.

So, we can see that classes provide a way of encapsulating behaviour and only expose the behaviours and properties that are required to be used, these are done via the public interface of the class.

28.
```ruby
class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end 
end

sparky = GoodDog.new("Sparky", 4)
puts sparky
```

What is output and why? How could we output a message of our choice instead? # How is the output above different than the output of the code below, and why?

```ruby
class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end 
end

sparky = GoodDog.new("Sparky", 4)
p sparky
```
**Answer:**

In the first code above, a class `GoodDog` is defined, in the constructor method `initialize` the instance variables `@name` and `@age` are intialized to the value of the method parameters `n` and `a` by calling the setter methods for the instance variables `self.name` and `self.age`. 

A new object of the class `Person` is instantiated and the arguments `"Sparky"` and `4` are passed as arguments. The values assigned to `@name` and `@age` are `"Sparky"` and `28` respectively.

When the method `puts` is called and `sparky` is passed as an argument, the `GoodDog` object is output and `nil` is returned. 

We can choose to output a message of our choice by defining a `to_s` method. When `puts` is called, the method `to_s` is automatically looked for and if defined in the class, the output can be cutomised as per our need. We can make it do that as follows :

```ruby
class GoodDog
  ...

  def to_s
    "Hi, my name is #{name}, and I am #{age} years in human age."
  end
end
```

In the 2nd code, the same behaviour is done. However, within the `initialize` method, the instance variables `@name` and `@age` are initialized directly rather than through the setter method. When the method `p` is invoked and `sparky` is passed as an argument the `GoodDog` object is output alongwith the instance variables and their respective values.

29.

When does accidental method overriding occur, and why? Give an example.

**Answer:**

Accidental method overriding can occur if we define a method by the same name of a default or existing method without the intent and it breaks the functionality. Care should be taken not to define methods with the same name as that of existing or default methods. It can make break the program and make it confusing to debug as well. 

For example, lets look at the code below:

```ruby
class Mailbox

  def initialize
    @inbox = []
    @sent = []
  end

  def send(mail)
    @sent << mail
  end
end

```

In the code above, we define a class `Mailbox` and define an instance method with the name `send` which takes one argument. Now, `send` is a method in the class `BasicObject` and that is being overridden here. By default `send` takes in the name of a method as a symbol and another argument and calls the method of the same name as the symbol. In this case the method `send` will be overridden and if tried to use will lead to unexpected results. It can be made fine by using a unique name for our method. Like, demonstrated below:

```ruby
class Mailbox
  ...

  def send_mail(mail)
    @sent << mail
  end
end
```

30.

How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

**Answer:**

Method access control is implemented in Ruby through the use of access modifiers. The purpose of them is to allow or restrict access to certain methods in a class.

Ruby provides us with the access modifiers `public`, `private` and `protected`.

`public` methods are available to the entire program and comprise the class's interface (public interface). Other classes and objects interact will use public methods to interact with a class and its objects.

`private` access modifiers are used for private methods that work within a class but are not needed to be available to the rest of the program. To enable it we use the `private` method call and anything below it is private unless another access modifier like `protected` is called to negate it.

`protected` access modifier is used to define protected methods, which fall in between public and private methods. Like, private methods, they cannot be invoked outside the class, however unlike private methods they allow access between class instances (objects).

An example demonstrating the use of access modifiers:

```ruby
class Person
  def initialize(score)
    @score = score
  end

  def result
    pass? ? "pass" : "fail"
  end

  private

  def pass?
    score > 90
  end
end

bob = Person.new(95)
tim = Person.new(85)
puts bob.result       # => "pass"
puts tim.result       # => "fail"
bob.pass?             # NoMethodError
```

Here, it can be seen that the method `pass?` is private and though it can be used within the class to determine the result by the `result` instance method, trying to call it from outside the class raises an error.

```ruby
class Person
  def initialize(age)
    @age = age
  end

  def older?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

bob = Person.new(33)
tim = Person.new(37)

puts tim.older?(bob)      # => true
puts bob.older?(tim)      # => false
```

The above code demonstrates the use of the `protected` access modifier. The getter method for the instance variable `@age` is protected and hence can be used between different objects of the same class in this case the objects being referenced by `bob` and `tim`.

31.

Describe the distinction between modules and classes.

**Answer:**

Classes provides templates for states and behaviours from which objects can be instantiated. Modules provide a way to extract common behaviour in one place.

Modules can be mixed into classes, this is called mixin and those classes can then access the behaviours defined in the mixed in modules.

A few distinctions between classes and modules are as follows: 

- Objects can be instantiated from classes, however the same is not true for modules.
- Classes provides with states and behaviours for its objects, modules only provide behaviour.
- For inheritance, a class can inherit from only one superclass, but as many modules can be mixed into a class as required.
- Usually, class inhertiance is used when there is an "is-a" relationship and modules are mixed in when there is a "has-a" relationship.
- Modules can also be used for namespacing, which is grouping related classes together. It helps reduce the likelihood of our classes colliding with other similarly named classes in the codebase.


32.

What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

**Answer:**

Polymorphism refers to the ability of different object types to respond to the same method invocation, often but not always in different ways. 

Data of different types can respond to a common interface. It's an important concept in OOP and helps in writing more maintainable code.

Polymorphism can be achieved mainly through the following two ways in Ruby:

- Polymorphism through inheritance

```ruby
class Animal
  def speak
  end
end

class Bird < Animal
  def speak
    "chirp"
  end
end

class Dog < Animal
  def speak
    "bark"
  end
end

class Cat < Animal
  def speak
    "meow"
  end
end

class Snail < Animal; end

animals = [Bird.new, Dog.new, Cat.new, Snail.new]
animals.each { |animal| animal.speak }
```

In the above code we can see that though every object is a different animal, we can use the method `speak` for each one of them and have it respond according to the type of animal. For `Bird`, `Cat` and `Dog` the `speak` method defined in the respective classes are used. `Snail` doesn't have a `speak` method in its class and hence the `speak` method of class `Animal` is invoked. 

Here, the code does not care about the type of animal, it just requires that each object has a `speak` method which takes in no arguments. The implementation of the `speak` method can be dramatically different for each class. This is polymorphism.

- Polymorphism through duck typing:

Duck typing occurs when objects of different unrelated types respond to the same method name. As long as the objects have a method with same name and same number of arguments they can be treated as belonging to a specific category of objects.

```ruby
class WebDeveloper
  def work
    "Web Development"
  end
end

class Architect
  def work
    "Architecture"
  end
end

class Artist
  def work
    "Art"
  end
end

persons = [WebDeveloper.new, Architect.new, Artist]

persons.each { |person| person.work }
```

Here, even though the classes are unrelated, they can be used polymorphically since they all respond to the method `work` which takes in the same number of arguments, in this case zero.

Polymorphic methods are intentionally designed to be used polymorphically. If there is no intent, they shouldn't be used polymorphically.

Example:
```ruby
class Circle
  def draw; end
end

class Blinds
  def draw; end
end
```

The above code is unlikely to make sense in any real world application. For `Circle` `draw` probably means to draw a circle and for `Blinds` it probably means to open or close the blinds. 

So, basically unless methods are polymorphically with intent, it is not considered to be polymorphism.

33.

What is encapsulation, and why is it important in Ruby? Give an example.

**Answer:**

**Similar to answer 27**

34.

```ruby
module Walkable
  def walk
    "#{name} #{gait} forward"
  end 
end

class Person
  include Walkable
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  private
  
  def gait
    "strolls"
  end 
end

class Cat
  include Walkable
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  private
  
  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk
```
What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?

**Answer:**

The above code defines a module `Walkable` and two classes `Person` and `Cat` where the module is mixed in. Both the classes have an instance variable `@name` with a public getter method, a constructor method `initialize` and a private instance method `gait`. The module `Walkable` defines a method `walk` which returns a string that has the return value of the getter method `name` and `gait` interpolated. 

A new object of class `Person` is instantiated and the string `"Mike"` is passed as an argument, local variable `mike` is initialized to this object. On instantiation, the constructor method `initialize` of the class is called and the instance variable `@name` references the string `"Mike"`. On the next line the method `p` is invoked and `mike.walk` is passed as an argument, which basically the return value of the method `walk` called on the object referenced by `mike`. This outputs and returns the string `"Mike strolls forward"` using string interpolation with the return values of the methods `name` and `gait` as mentioned above.

A new object of class `Cat` is instantiated and the string `"Kitty"` is passed as an argument, local variable `kitty` is initialized to this object. Similar to above, the instance variable `@name` of the objects points to the string `"Kitty"`. When the method `p` is called and `kitty.walk` is passed as an argument, the string `"Kitty saunters forward"` is output and returned by string interpolation of the methods `name` and `gait`.

The above code outputs `"Mike strolls forward"` and `"Kitty saunters forward"` in the same order.


35.

What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?

**Answer:**

(Pending - not confident yet)


36.

What is the relationship between classes and objects in Ruby?

**Answer:**

Anything that can be said to have a value in Ruby is an object like integers, strings, arrays, hashes, classes etc. 

Objects are created from classes. Classes are like molds and objects are like the things that are produced out of the molds.

The attributes (state) and behaviours of an object is defined in the classes. Individual objects contain different information, yet they are instances of the same class.

Objects of a class have two aspects. State and behaviour. States track attributes for individual objects. Instance variables are used to track this information. Instance variables are scoped at the object (instance) level. 

Different objects of the same class have identical behaviour which are defined by the instance methods of the class. 

Example:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hi, I am #{@name}."
  end
end

bob = Person.new("Bob")
puts bob.greet
```

In the above code a class `Person` is defined. A new object of the class `Person` is instantiated by calling the class method `new`, local variable `bob` is initialized to this object. The argument `"Bob"` is assigned to the instance variable `@name`.

It can be seen that the state of the object is tracked by the instance variable, in this case `@name`. The behaviour is defined by the instance methods, in this case `greet` where is returns a greeting with the value referenced by `@name` interpolated in the string.

The information stored / tracked by instance variables can be exposed via instance methods, as shown in the above example the instance method `greet` references the instance variable `@name`.

37.

When should we use class inheritance vs. interface inheritance?

**Answer:**

There are two forms of inheritance class inheritance and interface inheritance (mixing in modules), both provide the functionality of having common behaviour in one place, from which the objects of different classes can use them. However, there are some differences between them.

- In case of class inheritance we can only sub-class from one class, but in case of modules, we can mixin as many modules as we like.
- Usually class inheritance is used when there is an is-a relationship and interface inheritance when there is a has-a relationship. Example, a dog is-an animal and has-an ability to swim. 
- Modules cant be instantiated in form of objects while objects can be instantiated from classes.

Example, showing inheritance of both types in action

```ruby
module Swimmable
  def swim
    "I'm swimming"
  end
end

class Animal
  def walk
    "I'm walking"
  end
end

class Dog < Animal
  include Swimmable
end

class Cat < Animal; end

class Person
  include Swimmable
end

dog = Dog.new
cat = Cat.new
person = Person.new

dog.swim        # => I'm swimming
cat.walk        # => I'm walking
person.swim     # => I'm swimming
```

In the above code, the classes `Dog` and `Cat` are sub-classes of the class `Animal`, wherein an instance method `walk` is defined. This available to all the sub-classes of `Animal`. This represents an is-a relationship. Dogs and cats are animals and all animals can walk so the functionality of walking is contained in the class `Animal`.

Now, for swimming, there is a has-a relationship. Dogs and Persons have an ability to swim and hence we can include the module `Swimmable` in the classes `Dog` and `Person`. Even though these are distinct classes, not of the same type they can inherit the ability to swim, since both of them can swim.

Here, it can be seen how different types of inheritance are used and what are the use cases.

38.

If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?

```ruby
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new
```

**Answer:**

In the above code, if we use `==` to compare the individual `Cat` objects, `false` will be returned. Since, there is no `==` method defined for the class `Cat`, the `BasicObject#==` method will be used. This method returns `true` only if the two objects being compared are the same objects. In this case these are all separate objects of the same class and hence `false` will be returned.

What this demonstartes is that the `==` method in Ruby can be used for comparison of objects. It must be defined in the class of the object in order to provide a basis for comparison, if not defined separately it simply compares if the objects are the same object. 

In this case, if we would like to base our comparison to see if the two objects belong to the same class. Then we can define a `==` method in the class `Cat` as follows:

```ruby
class Cat
  def ==(other)
    self.class == other.class
  end
end
```

Now, if we try to compare the individual objects, it will return `true` since they all are cats.

39.
```ruby
class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end
```
Describe the inheritance structure in the code above, and identify all the superclasses.

**Answer:**

The above code demonstartes class inheritance. Three classes are defined `Thing`, `AnotherThing` and `SomthingElse`. 

Here, the class `AnotherThing` inherits from the superclass `Thing`. Hence, for `AnotherThing`, `Thing` is a superclass.

The class `SomethingElse` in turn inherits from `AnotherThing`. Hence, the classes `AnotherThing` as well as `Thing` superclasses of the class `SomethingElse`.

The superclasses in the above code are `Thing` and `AnotherThing`.

40.
```ruby
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly
```
What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.

**Answer:**

In the last line the method `fly` is called on the object referenced by `pingu` which is an object of class `Penguin`.

The method lookup path for the class `Penguin` is as follows:

Penguin
Migatory
Aquatic
Bird
Animal
Object
Kernel
BasicObject

This can be verified by calling the method `ancestors` on the class `Penguin` as follows:

```ruby
puts Penguin.ancestors
```

Now, since the method `fly` is not defined in any of the classes in the method lookup path, an error is raised. The module `Flight` contains the method `fly` but since the module is not mixed in, it is not included in the method lookup path.

41.
```ruby
class Animal
  def initialize(name)
    @name = name
  end
  
  def speak
    puts sound
  end
  
  def sound
    "#{@name} says "
  end 
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
```
What does this code output and why?

**Answer:**

The above code outputs `"Daisy says moooooooooooo!"` and returns `nil`.

The above code defines a class `Animal` and another class `Cow` which inherits from `Animal`.

In the second last line a new object of class `Cow` is instantiated and the string `"Daisy"` is passed as an argument, this assigns the string `"Daisy"` to the instance variable `@name` of the object. The local variable `daisy` is initialized to this object.

Now, on the last line, the method `speak` is invoked on the object referenced by `daisy`. The method `speak` is defined in the superclass `Animal`. Within the method the `puts` is called and the return value of the method `sound` is passed as an argument. In this case when method `sound` is called, the method lookup path looks in the class `Cow` first where the code `super + "moooooooooooo!"` is executed. The call to `super` invokes the method with the same name up the method lookup path which in this case is the class `Animal`. The method `Animal#sound` returns the string `"Daisy says "` as a result of string interpolation of the instance variable `@name`, this is added with the string `"moooooooooooo!"` and finally the string `"Daisy says moooooooooooo!"` is returned which is output.

42.
```ruby
class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end
  
  def purr; end
  
  def jump; end
  
  def sleep; end
  
  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")
```

Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.

**Answer:**

In the above code the local variables `max` and `molly` reference objects of the class `Cat`. Both objects belong to the same class `Cat` but have distinct states which is defined or rather stored in their instance variables `@name` and `@coloring`. The data relating to the state of each object is contained in its instance variables and is unique for each object. As it can be seen in this case that for the object referenced by `max`, the `@name` is `"Max"` and `@coloring` is `"tabby"` whereas for the object referenced by `molly`, the `@name` is `"Molly"` and the `@coloring` is `"gray"`.

However, when it comes to behaviour both have the same behaviour which is defined by the instance methods of the class, in this case being the methods `purr`, `jump`, `sleep` and `eat`. It can be said that all objects of the class `Cat` have their own name and coloring, however they can all purr, jump, sleep and eat.

This demonstrates the fact that classes provide a template for the states and behaviours of its objects. Objects can be thought of as made out of those templates such that each object has their own unique state but every object of the same class share the common behaviour.


43.
```ruby
class Student
  attr_accessor :name, :grade
  
  def initialize(name)
    @name = name
    @grade = nil
  end
  
  def change_grade(new_grade)
    grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade
```
In the above code snippet, we want to return `”A”`. What is actually returned and why? How could we adjust the code to produce the desired result?

**Answer:**

The above code returns `nil`.

A new object of class `Student` is instantiated and the string `"Priya"` is passed as an argument. The local variable `priya` is initialized to this object.

The method `change_name` is called on the object referenced by `priya` and the string `"A"` is passed as an argument. Within the method `change_name`, a new local variable `grade` is initialized to the string `"A"`.

When the getter method `grade` is called on the object referenced by `priya`, the object referenced by the instance variable `@grade` is returned which `nil`.

Now, this is not the desired result. In order to change the instance variable `@grade` to `"A"` the code must be modified as follows:

```ruby
class Student
  ...

  def change_grade(new_grade)
    self.grade = new_grade
  end
end
```

By adding `self`, we call the setter method for the instance variable `@grade` instead of initializing a local variable by mistake. This assigns the strign `"A"` to the instance variable `@grade`. Now, if we call `priya.grade`, the string `"A"` will be returned.

44.
```ruby
class MeMyselfAndI
  self
  
  def self.me
    self
  end
  
  def myself
    self
  end
end

i = MeMyselfAndI.new
```
What does each `self` refer to in the above code snippet?

**Answer:**

The above code defines a class `MeMyselfAndI` which has an instance method `myself` and a class method `me`. 

`self` mentioned on line 2 refers to the class itself which is `MeMyselfAndI`.

`self` mentioned whithin the class method `self.me` refers to the object on which the method is called. Since, class methods are called on the class itself, here `self` refers to the class `MeMyselfAndI`.

`self` mentioned within the instance method `myself` again refers to the object on which the method `myself` is called, since this is an instance method, it is called on instances (objects) of the class `MeMyselfAndI`. For example, in this code it refers to the object referenced by the local variable `i`.

45.
```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```

Running the following code will not produce the output shown on the last line. Why not? What would we need to change, and what does this demonstrate about instance variables?

**Answer:**

The last line of the above code will output the object of class `Student` wherein only one instance variable `@name` will be shown with the value `"Adewale"`. The instance variable `@grade` is not initialized and hence will not be shown in the object. 

In order to produce the output like the one shown above the following change has to be made:

```ruby
class Student
  ...

  def initialize(name, grade=nil)
    @name = name
    @grade = grade
  end
end
```

This will give us the desired output. 

This demonstrates that even though setter and getter methods are defined, the instance variable must be  initialized in order to come into existence.

46.
```ruby
class Character
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name
p sir_gallant.speak
```

What is output and returned, and why? What would we need to change so that the last line outputs `”Sir Gallant is speaking.”`?

**Answer:**

The second last line outputs and returns `"Sir Gallant"` and the last line outputs and returns `"Gallant is speaking."`.

`sir_gallant` references an object of the class `Knight` which has one instance variable `@name` with tha value `"Gallant"`.

When the method `name` is called on the object referenced by `sir_gallant` the method `name` of the class `Knight` is called. Within this method the return value of `super` is added to the string `"Sir "`. `super` calls the method with the same name higher up in the method lookup path in this case being the getter method `name` in class `Character`. The return value of which is the value referenced by `@name` which is `"Gallant"`. After adding the method call returns the string `"Sir Gallant"` which is output and returned.

When the method `speak` is invoked, the string `"Gallant is speaking."` is returned as a result of string interpolation of the instance variable `@name` which is output and returned by the method `p`.

If we want to return the string `"Sir Gallant is speaking."`. The following modification can be made:

```ruby
class Character
  ...

  def speak
    "#{name} is speaking."
  end
end
```

Now when we invoke the method `speak` on the object referenced by `sir_gallant` the return value of the method `name` instead of the instance variable `@name` will be interpolated which as explained above will return the string `"Sir Gallant"` and hence, `"Sir Gallant is speaking."` will be output and returned.

47.
```ruby
class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak # => "Sheep says baa!"
p Lamb.new.speak  # => "Lamb says baa!baaaaaaa!"
p Cow.new.speak   # => "Cow says mooooooo!"
```
What is output and why?

**Answer:**

The above code outputs as shown below:

```ruby
p Sheep.new.speak # => "Sheep says baa!"
p Lamb.new.speak  # => "Lamb says baa!baaaaaaa!"
p Cow.new.speak   # => "Cow says mooooooo!"
```

When the method `speak` is invoked on the object of the class `Sheep` the method `speak` in the class `Sheep` is invoked. Here `super` is called which invokes the method `speak` in the superclass `FarmAnimal` which returns the string `"Sheep says "` as a result of string interpolation. This string is added to the string `"baa!"` and returned which is output. Thus the output is `"Sheep says baa!"`.

When the method `speak` is called on the object of class `Lamb`, the method `speak` of `Lamb` is invoked. Here `super` is used which invokes the method the `speak` of the class `Sheep` the return in value of which is like the one described above just with the changed class name because of string interpolation of `self.class`. Hence `"Lamb says baa!"` is returned and added to the string `"baaaaaaa!"`. Finally the string `"Lamb says baa!baaaaaaa!"` is output.

When the method `speak` is called on the object of class `Cow`, the method `speak` in class `Cow` is invoked. Here `super` is used which in turn calls the method `speak` of the class `FarmAnimal` which returns the string `"Cow says "` as a result of string interpolation. This is added to the string `"mooooooo!"` and finally the string `"Cow says mooooooo!"` is output and returned.

48.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
```

What are the collaborator objects in the above code snippet, and what makes them collaborator objects?

**Answer:**

The instance variables of a class can hold objects belonging to other classes. These are called collaborator objects. These can be from any class like `String`, `Integer`, `Hash`, `Array` etc. or also any custom defined class. They are called collaborator objects because they work in conjunction with the class they are associated with.

In the above code `sara` points to an an object of the class `Person`. On the next line a new object of class `Cat` is insantiated and the string `"Fluffy"` as well as the object referenced by `sara` are passed as arguments. The local variable `fluffy` is initialized to this object. On instantiation, the instance variable `@owner` refernces the object of the class `Cat`. This is the collaborator object. This object can be accessed by going through the instance variable `@owner`. Also, any states and methods of the objects can be accessed in the same way. This is what makes it a collaborator object.

49.
```ruby
number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end
```
What methods does this `case` statement use to determine which `when` clause is executed?

**Answer:**

The `case` statement inherently uses the method `===` to determine which `when` clause to execute. The `===` method is defined in different classes for their objects. Basically how it works is by comparing if the argumemnt is part of the group being defined by the object that method is called on. 

In this case the first and second `when` clause use the method `Integer#===` to determine if the object referenced `number` is a part of the given integers. The third `when` clause uses the method `Range#===` to determine if `number` is a part of the range `40..49` which is `true` and hence this clause is executed and `"third"` is returned.

50.
```ruby
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']
  
  @@total_people = 0
  
  def initialize(name)
    @name = name
  end

  def age 
    @age
  end
end
```
What are the scopes of each of the different variables in the above code?

**Answer:**

The above code defines a class `Person` which has several variables and a constant.

# to be revisited - incomplete

51.
The following is a short description of an application that lets a customer place an order for a meal:
- A meal always has three meal items: a burger, a side, and drink. # - For each meal item, the customer must choose an option.
- The application must compute the total cost of the order.

1. Identify the nouns and verbs we need in order to model our classes and methods. 
2. Create an outline in code (a spike) of the structure of this application.
3. Place methods in the appropriate classes to correspond with various verbs.

**Answer:**

1. Nouns: meal, customer
   Verb: order

2. and 3. 
```ruby
class Customer
  attr_reader :meal

  def initialize
    @meal = Meal.new
    @meal.place_order
    @meal.order_value
  end
end

class Meal
  BURGERS = { "burger1" => 10, "burger2" => 12 }
  SIDES = { "side1" => 4, "side2" => 5 }
  DRINKS = { "drink1" => 5, "drink2" => 6 }

  attr_reader :burger, :side, :drink

  def initialize
    @burger = nil
    @side = nil
    @drink = nil
  end

  def place_order
    # customer gets a prompt of options and chooses
  end

  def order_value
    # total value of order is computed
  end
end
```

52.
```ruby
class Cat
  attr_accessor :type, :age
  
  def initialize(type) 
    @type = type
    @age =0
  end
  
  def make_one_year_older
    self.age += 1
  end 
end
```
In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix? Which use case would be preferred according to best practices in Ruby, and why?

**Answer:**

In the above code, within the class `Cat` in the method `make_one_year_older` the prefix `self` is used in order distinguish between calling the setter method for the instance variable `@age` rather than initializing a local variable with name `age`. The method can be rewritten not to use `self.age` by referencing the instance variable `@age` directly. This can be done as follows:

```ruby
class Cat
  ...

  def make_one_year_older
    @age += 1
  end
end
```
However, according to the best practices in Ruby, the preffered way would be to use the setter method to reassign the instance variable rather than accessing it directly. In this ways, we would have the flexibility to implement the reassignment in ways approriate to our program. For, example if any sort of data validation is required, it can simply be incorporated in the setter method and that would make reflect across the entire code.

53.
```ruby
module Drivable
  def self.drive
    puts "driving"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
```
What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?

**Answer:**

The above code raises an error `NoMethodError`. 

The class `Car` has the module `Drivable` mixed in which has one module method `drive`.

In the last line when the method `drive` is invoked on the object of class `Car` being referenced by the local variable `bobs_car`, it raises an error because there is no method available for an object of the class `Car`. The method `drive` in the module `Drivable` is a module method and can be called on the module itself and not an object of the class it is mixed in.

In order to be available to the instances of the classes where the module is mixed in, the method must be defined without the prefix `self` as follows:

```ruby
module Drivable
  def drive
  end
end
```

Now, the method `drive` can be called on the object referenced by `bobs_car`. 

54.
```ruby
class House
  attr_reader :price
  
  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more
expensive
```

What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?

**Answer:**

To get the desired output we can mixin the module `Comparable` to the class `House` and define the method `<=>` as follows:

```ruby
class House
  include Comparable

  ... # ommited for brevity

  def <=>(other)
    price <=> other.price
  end
end
```

When the module `Comparable` is mixed in and the method `<=>` is defined with the basis of comparison, the class gets many comparison methods like `<`, `>`, `==` etc. Thus, the last two lines which use the methods `<` and `>` respectively return the desired output.

