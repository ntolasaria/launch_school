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
puts tim.older?(bob)
puts bob.older?(tim)
```