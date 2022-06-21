# Specific Topics of Interest

## Classes and objects

Object Oriented Programming, referred to as OOP, is a programming paradigm created to deal with the growing complexity of large software systems. One small change would trigger a ripple effect of errors due to dependencies throughout the program. A way was needed to create containers for data that could be managed and manipulated without affecting the entire program. This was solved using OOP.

Some features are:

**Encapsulation** is hiding pieces of functionality and making it unavailable to the rest of the code of base, so that data cannot be changed or manipulated without obvious intention. Ruby accomplishes this task by creating objects and exposing interfaces (i.e., methods) to interact with those objects.

Objects offer a new-level of abstraction

**Polymorphism** is the ability for different types of data to respond to a common interface. OOP gives us flexibility to use pre-written code for new purposes. For example, if we have a method that expects arguments that have a `move` method, we can pass it any type of argument, provided it has a compatible `move` method. It let's different types of objects respond to the same method invocation. 

Another way polymorphism is applied is using `Modules`. They are similar to classes, however an object cannot be created with a module. A module must be mixed in with a class using the `include` method invocation. This is called `mixin`. The behaviours declared in a module ae availale to the class and its objects.

**Inheritance** is where a class inherits the behaviours of another class, referred to as superclass. The class that inherits the behaviours is called subclass.

What are Objects?

Anything that can be said to have a value is an object like numbers, strings, arrays, classes, modules etc. However few things like methods, blocks and variables are not objects.

Objects are created from classes. Think of classes as molds and objects as the things you produce out of these molds. Individual objects will contain different information from other objects, yet they are instances of the same class. Example

```bash
irb :001 > "hello".class
=> String
irb :002 > "world".class
=> String
```

The `class` instance method can be used to determine what class an object belongs to. Objects are intantiated from a class. 

Ruby defines the attributes and behaviours of its objects in classes. Classes are a basic outline of what an object should be made of and what it should be able to do.

Classes are defined using a similar syntax as methods, the `def` is replaced with `class` and the CamelCase naming convention is used to create the name. 

Example of class definition and instantiation:

```ruby
class GoodDog
end

sparky = GoodDog.new
```

The above code creates an instance of the class `GoodDog` and stores it in variable `sparky`. The entire workflow of creating a new object or instance of a class is called instantiation, so it can be said that we have instantiated an object called `sparky` from the class `GoodDog`. Object is returned by calling the class method `new`. 

Objects of a class have two aspects - States and Behaviours which are defined in the class. States track attributes for individual objects. Behaviours are what objects are capable of doing. Instance variables are used to track this state information. Instance variables are scoped at the object (or instance) level and are how the objects keep track of their states.

Different objects of the same class contain indentical behaviours. For example 2 different `GoodDog` objects should be able to bark, run, fetch and perform other common behaviours of good dogs. These behaviours are defined as instance methods in a class. Instance methods are available to objects (or instances) of that class.

Basically :
Instance variables - keep track of state
Instance methods - expose behaviour for objects


Example:

```ruby
class GoodDog
  def initialize(name)
    @name = name
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new("Sparky")  # => "This object was initialized!"
```

Calling the `new` class method leads us to the `initialize` instance method, which is also called a constructor method, because it is a special method that builds the object when a new object is instantiated. It gets triggered by the `new` class method.

Instance variables have the symbol `@` in front of it. They exist as long as the object instance exists. They do not die after the initialize method is run. They "live on", to be referenced untill the object instance is destroyed. Above, the initialize method is defined with one parameter `name`. Arguments can be passed to the `initialize` instance method through the `new` class method as demonstrated above. The string `Sparky` is passed from the `new` method through to the `initialize` method, and is assigned to the local variable `name`. Within the contructor, the instance variable `@name` is set to `name` which results in assigning the string `"Sparky"` to the `@name` instance variable.

Every object's state is distinct and instance variables keep track of it.


Behaviours are defined by **Instance Methods**.

Example:

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak    # => Sparky says Arf!
```

The above program outputs the string `"Sparky says Arf!"`

All objects instantiated of the `GoodDog` will have the same behavious though they contain different states. We can expose information about state of the objecy thorugh instance methods.

Every object will output their respective names, because of the string interpolation which accesses the value stored in instance variable `@name`.



- Use `attr_*` to create setter and getter methods

If we want to access the instance variables of a class, we have to define a method which returns the object stored in the instance variable. We can modify the above code as follows with a method `get_name`, the job of this method is to return the value of the variable `@name`.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak    # => Sparky says Arf!
puts sparky.name     # => Sparky 
```

This is called a *getter* method.

If we want to change the name of `sparky`. Then we have to use a *setter* method, shown in the example below.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak    # => Sparky says Arf!
puts sparky.name     # => Sparky 
puts sparky.name = "Spartacus"
puts sparky.name      # => Spartacus
```

`puts sparky.name = "Spartacus"` is Ruby's special syntax for `puts sparky.name=("Spartacus")`.

*Setter* methods always return the value that is passed in as an argument, regardless of what happens inside the method. If the setter method tries to return something other than the argument's value, it just ignores that attempt.


Ruby has a built in way to create getter and setter methods, using `attr_accessor` method.

The above code can be refactored as follows :

```ruby 
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"
```

The `attr_accessor` method takes a symbol as an argument which is used to create setter and getter methods. That one line replaced two method definitions.


Incase of only *getter* method - use method `attr_reader`
Incase of only *setter* method - use method `attr_writer`.

For multiple states the following syntax can be used
```ruby
attr_accessor :name, :height, :weight
```

## How to call setters and getters

For accessing instance variables getter methods must be used rather than accessing them directly. This is also gives added flexibility to format the way the value of a variable is returned etc.

If setter method call is used to change the value of one or more instance variables within a class, then we must call it with `self` added to it. Like `self.name = `, else it will result in creation of local variables at the instance method level. This can be used for getter methods as well, though it is not required.

`self.` that can also be prefixed for calling instance methods not just accessor methods.

While this works, the general rule from the Ruby style guide is to "Avoid self where not required."


## Instance methods vs. class methods

- Instance methods are methods that pertain to an instance or object of the class. There are also class level methods, called class methods. Class methods are methods that we can call directly on the class itself, without having to instantiate any objects. 

Example definition
```ruby
# ... rest of code ommitted for brevity

def self.what_am_i          # Class method definition
  "I'm a GoodDog class!"
end

puts GoodDog.what_am_i      # Class method invocation
```

- Class methods are where we put functionality that does not pertain to individual objects. 

- Instance variables capture information related to specific instances of classes (objects). We can create variables for an entire class, that are called **class variables**. Class variables are created using `@@`. An example showing the use of class variables.

```ruby
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs     # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs     # => 2
```

Since `initialize` gets called every time we instantiate a new object of the class with the `new` method, the class variable is incremented by 1 everytime an object is instantiated.


## Method Access Control
Method access control is generally implemented through the use of *access modifiers*. The purpose of access modifiers is to allow or restrict access to a particular thing (being the methods in a class).

In Ruby it is implemented through the use of `public`, `protected` and `private` access modifiers. 

**Public method** is a method that is available to anyone who knows either the class name or the object's name. These methods are readily available for the rest of the program to use and comprise the class's interface (that's how other classes and objects will interact with this class and its objects).

**Private method** is a method that is doing work in the class but is not needed to be available to the rest of the program. To define a private method we use the `private` method call in our program and anything below it is private (unless another access modifier like `protected` is called after it to negate it). Example:

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end


sparky = GoodDog.new("Sparky", 4)
sparky.human_years        # => NoMethodError
```

The private method `human_years` in the above code can be used within the class as follows:

```ruby
class GoodDog
  ...

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private
  ...
end
```

Note, we cannot use `self.human_years`, because `human_years` method is private. `self.human_years` is equivalent to `sparky.human_years`, which is not allowed for private methods. Hence, we just have to use `human_years`. So basically, private methods are not accessible outside the class definition at all, and are only accessible from inside the class when called without `self`.


**Protected Methods** fall in between public and private methods. They are similar to private methods in that they cannot be invoked outside the class. The main difference between them is that protected methods allow access between class instances, while private methods do not.

Example:

```ruby
class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling)     # => true
sterling.older?(malory)     # => false

malory.age                  # => NoMethodError
```

It is clear that like private methods, protected methods cannot be invoked from outside of the class. However unlike private methods, other instances of the class (or subclass) can also invoke the method. This allows for controlled access, but wider access between objects of the same class type.

## Referencing and setting instance variables vs. using getters and setters



## Class inheritance, encapsulation, and polymorphism

### Inheritance:

Inheritance is when a class inherits behaviour from another class. The class that is inheriting behaviour is called *subclass* and the class it inherits from is called *superclass*.

Inheritance is a way to extract common behaviour from classes that share that behviour and move it to a superclass. Example:

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak       # => Hello!
puts paws.speak         # => Hello!
```

The symbol `<` is used to signify that `GoodDog` and `Cat` classed are inheriting from `Animal` class. All methods of class `Animal` are available to both the classes for use. In the above code, both the classes are using the superclass `Animal`'s `speak` method.

If we wanted to added special functionality in the `speak` method for any one of our sub-classes we can define another method `speak` in that subclass thereby overriding the `speak` method in `Animal`. Ruby will look up the Method Lookup Path. If it finds a method in the class it will execute that else, it will look for the method above in the method lookup path. \

Inheritance is a way of removing duplication in code. "DRY" means Don't Repeat Yourself. It means that if you find yourself writing the same logic over and over again in your programs, there are ways to extract that logic to one place for reuse.


### Polymorphism

Polymorphism refers to the ability of different object types to respond to the same method invocation, often but not always, in different ways. In other words, data of different types can respond to a common interface. It's a crucial concept in OO programming that can lead to more maintainable code.

When two or more objects types have a method with the same name, we can invoke that method with any of those objects. When we don't care what type of object is calling the method, we're using polymorphism. Polymorphism might be implemented by inheritance or without it as well.

Examples :

*Polymorphism through inheritance*

```ruby
class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }
```

Every object in the array is a different animal, but the client code (the code that uses those objects) doesn't care what each object is. The only thing required is that each object have a `move` method that requires no arguments. The interface for this class hierarchy lets us work with all of those types in the same way even though the implementations may be dramatically different. This is polymorphism.

Looking at each object :

The `Sponge` and `Coral` classes don't have a `move` method (at least not one of their own). They both inherit from the `Animal` class. Thus, for both objects belonging to these classesm the `move` method in the class `Animal` is called. This is polymorphism through inheritance, inside of providing their own behavior for the `move` method, inheritance is used to acquire the behviour of a superclass.

For `Fish` object, we call `move` method from the `Fish` class which enables a fish to swim. For the `Cat` object, we call `move` method from the `Cat` class which enables a cat to walk. Here polymorphism is demonstrated by the fact that two  different object types can respond to the same method call simply by overriding a method inherited from a superclass. 

*Polymorphism through duck typing*



## Modules

Another way of DRY up code is using *Modules*. Modules can be used to extract common behaviour in one place. The module can then be mixed in also known as mixin to different classes which gives access to the methods defined in the module. A module is added to a class by invoking the `include` method. Example:

```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

sparky.swim       # => I'm swimming!
neemo.swim        # => I'm swimming!
paws.swim         # => NoMethodError
```

A common naming convention for Ruby is to "able" suffix on whatever verb describes the behaviour that the module is modelling.

Points to not for mixing in modules(interface inheritance) vs class inheritance :

- You can only subclass from one class, however you can mix in as many modules as you like.
- If there is an "is-a" relationship, class inheritance is usually the choice. If there's a "has-a" relationship, interface inheritance is generally a better choice. Example, a dog "is an" animal and it "has an" ability to swim.
- You cannot instantiate modules (no object can be created from a module). Modules are used only for namespacing and grouping common methods together.


There are other uses for modules as well.

**Namespacing**
In this context, namespacing means organizing similar classes under a module. In other words, using modules to group related classes. It makes it easier to recognize related classes in our code, also it reduces the likelihood of our classes colliding with other similarly named classes in the codebase. 

Example:

```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```
Classes in modules are called by appending the class name to the module name with two colons `::` as follows:

```ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')       # => "Arf!"
kitty.say_name('kitty')   # => "kitty"
```
**Container**
Modules can be used a container for methods, called module methods. Here modules are used to house other methods. It's useful for methods that seem out of place in the code. Example:

```ruby
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end
```

The method can be called in the two ways demonstrated below. The first way is the preffered way.

```ruby
value = Mammal.some_out_of_place_method(4)
value = Mammal::some_out_of_place_method(4)
```

## Method lookup path

Method lookup path is the order in which classes are inspected when a method is called. 
Can also be written as - The method lookup path is the order in which Ruby will traverse the class hierarchy to look for methods to invoke.

Example:

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

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts GoodDog.ancestors
```

Output:

```bash
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```

Here we, can see the order in which Ruby looks up the classes and modules. The module included last is searched first. Also, it is interesting to note that the module `Walkable` also made it's way in the method lookup path. Hence, the module / modules included in the superclasses also become available to the subclasss.

## `self`

If setter method call is used to change the value of one or more instance variables within a class, then we must call it with `self` added to it. Like `self.name = `, else it will result in creation of local variables at the instance method level. This can be used for getter methods as well, though it is not required.

`self.` that can also be prefixed for calling instance methods not just accessor methods.

While this works, the general rule from the Ruby style guide is to "Avoid self where not required."

## Calling methods with self, More about `self`

`self` can refer to different things depending on where it is used.

- for calling setter methods from within the class. We use `self` to allow Ruby to disambiguate between initializing a local variable and calling a setter method.
- for class method definitions

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self
# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">
```

What does `self` really represent?

From within the class when an instance method uses `self`, it refernces the calling object (instance).  Therefore from within the `change_info` method, calling `self.name=` acts the same as calling `spark.name=` from outside the class (you can't call `sparky.name=` inside the class, though, since it isn't in scope). In this case `self` 
represents the object referenced by `sparky`.

When `self` is prepended to a method definition, it is defining a **class method**. Like in the earlier example with the class method called `self.total_number_of_dogs`. Using `self` inside a class but outside of an instance method refers to the class itself. Let's see the code below for example:

```ruby
class GoodDog
  # ... rest of code omitted for brevity
  puts self
end
```
Here `GoodDog` will be output. Sence `def self.total_number_of_dogs` is equivalent to `def GoodDog.total_number_of_dogs`.


To be clear :

- `self` inside an instance method refernces the instance (object) that called the method. 
- `self` outside of an instance method, references the class and can be used to define class methods.

Therefore, `self` is a way of being explicit about what our program is referencing and what our intentions are as far as behaviour. `self` changes depenidng on the scope it is used in. 




- Reading OO code
- Fake operators and equality
- Working with collaborator objects

