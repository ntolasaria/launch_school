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

*Important Note: The phrase "everything is an object" is not strictly true. There are a few things in Ruby that are not objects, like methods, blocks, `if` statements, arguments lists etc.* 

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



## Use `attr_*` to create setter and getter methods

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

*Class methods are sometimes confusingly called a "singleton method" (the term is used in other contexts as well). Good to know, not required to be used though.*

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

Duck typing occurs when objects of different unrelated types both respond to the same method name. The class or type of object is not important, what is important is that if an object has a particular behaviour. "If an object quacks like duck, then we can treat it as a duck". Duck typing is a form of polymorphism. As long as the objects involved use the same method name and take the same number of arguments, we can treat the object as belonging to a specific category of objects. 

Example: (needs to be verified)

```ruby
class Batsman
  def play
    "Bat"
  end
end

class Bowler
  def play
    "Bowl"
  end
end

class Fielder
  def play
    "Field"
  end
end

class CricketGame
  def start_game(players)
    players.each { |player| player.play}
  end
end

game = CricketGame.new

game.start_game([Batsman.new, Bowler.new, Fielder.new])
```

One important note - *polymorphic methods are intentionally designed to be polymorphic, if there's no intention, you probably shouldn't use them polymorphically*.

Example:

```ruby
class Circle
  def draw; end
end

class Blinds
  def draw; end
end
```

In theory the methods above can be used polymorphically as they are both named `draw` and take no arguments. However, for a circle it probably means to draw a circle and for blinds it means to open or close blinds. So even, though they can be used polymorphically, this is not polymorphism as it is unlikely to make sense or help in the code. Unless you are calling the methods in a polymorphic manner (with intent), you don't have polymorphism.


### Encapsulation

Encapsulation lets us hide the internal representation of an object from the outside and only expose methods and properties that users of the object need. Method access control can be used to expose those properties and methods through the public interface of a class: it's public methods.

Example:

```ruby
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private

  attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny")  # changed nickname to "barny"
puts dog.greeting             # => Barny says Woof Woof!
```

In the example we change the nickname of the dog by calling the `change_nickname` method without needing to know how the `Dog` class and this method are implemented.

Similary, when `greeting` is called on a `Dog` object. The greeting is output with the name capitalized. Again, the method implementation is hidden. Its important to note that `setter` method for `nickname` is private. If we try to call it like `dog.nickname = "barny"` it would raise an error.

***One important distinction to note here is that even though the `setter` method for `nickname` is private, it is being called with `self` prepended within the `change_nickname` method. This is an exception in Ruby, `self` must be used to call private `setter` methods, if not used Ruby would think a new local variable is being created.***

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

## Reading OO code









## Fake operators and equality

### Equivalence

Equivalence in Ruby can be summarized as follows:

`==`
- for most objects `==` compares the values of the objects
- `==` operator is actually a method. Most built-in classes in Ruby like `Array`, `String`, `Integer` etc. provide their own `==` method, and this defines how the objects of those classes are compared.
- `BasicObject#==` does not perform an equality check, instead it returns true if two objects are the same object. Hence, classes must provide their own behaviour for the method `==`.
- In order to compare custom objects, the `==` method must be defined.

`equal?`
- `equal?` method does not only determine if two variables have the same value, but also whether they point to the same object.
- `equal?` should not be defined.
- it's not often used
- comparing the `object_id` of two objects has the same effect as comparing them with `equal?`.
  
`===`
- used implicitly in `case` statements.
- like `==`, the `===` operator is actually a method
- this method is rarely called explicitly. And it is defined very rarely, in case you anticipate your objects will be used in `case` statements.

`eql?`
- `eql?` method determines if two objects contain the same value and if they're of the same class. Used by `Hash` to determine equality among its members.
- used implicitly by `Hash`.
- very rarely used explicitly


Equivalence though seemingly simple is a actually a little complicated.

A string, integer, symbol is equal to another string, integer, symbol of the same value respectively.

When compared using the operator `==` they should return true if the value is the same.

```ruby
str1 = "something"
str2 = "something"
str1 == str2            # => true

int1 = 1
int2 = 1
int1 == int2            # => true

sym1 = :something
sym2 = :something
sym1 == sym2            # => true
```

When we are comparing `str1` and `str2` using `==` we are comparing the values not that are the two objects the same. Here the method `equal?` comes in use. The method `equal?` checks whether the two objects are the same only.

Example:
```ruby
str1 = "something"
str2 = "something"
str1_copy = str1

str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

str1.equal?(str2)       # => false
str1.equal?(str1_copy)  # => true
str2.equal?(str1_copy)  # => false
```

It can be clearly seen above that `str1` and `str1_copy` point to the same object and hence the method `equal?` returns true when comparing them.

Basically the method `==` compares the two variables' values wheras the method `equal?` determines whether the two variables point to the same object.

The `==` method:

The original `==` method is defined in the `BasicObject` class, which is the parent class for all classes in Ruby. This implies that every object in Ruby has `==` method. However each class should define the method `==` to specify the value to compare.

`==` though looks like an operator is actually a method. `str1 == str2` is actually a method call `str1.==(str2)`.

We can define the `==` method for classes which helps to specify the value to compare.

Example:

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2     # false, this is the `BasicObject#==` method, which sees if both are pointing to the same object (same as equal?)

bob_copy = bob
bob == bob_copy  # true, they both are pointing to the same object
```

Hoever, we can define the `==` in our `Person` class to tell Ruby what `the same` means for a `Person` object.

```ruby
class Person
  attr_accessor :name

  def ==(other)
    name == other.name
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2           # => true, the names of the two objects are compared
```

In this case by defining the `==` method we are overriding the default `BasicObject#==` method and providing a more suitable way to compare two `Person` objects.

Important Note: The `Person#==` method is actually using the `String#==` method for comparison. Every core library class will have its own `==` method which can be used to compare `Array`, `Hash`, `Integer`, `String` and other objects.

Comparing object_ids of two objects (which we can get from the method `object_id`) have the same effect as the method `equal?`.

Example:
```ruby
str = "something"
str_copy = str

str.object_id == str_copy.object_id     # => true
str.equal?(str_copy)                    # => true
```

The `===` method

`===` is also an instance method like `==`. It's actually used implicitly in the `case` statement.

Example:
```ruby
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end
```

Since all comparisons above are with ranges, here the `Range#===` method is being used. Whats actually happening is as follows:

```ruby
num = 25

if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end
```

Basically the way `===` works, is like it's asking "if `(1..50)` is a group, would `25` belong in that group?"

Example:

```ruby
String === "hello"  # => true, "hello" is an instance of String
String === 15       # => false, 15 is not an instance of String
Integer === 15      # => true, 15 is an instance of Integer
```

### Fake Operators

Many methods in Ruby look like operators like `==`, `<`, `>` etc. Below is a table that shows which operators are real operators and which ones are methods disguised as operators (listed by order of precedence, highest first) :


| Method | Operator                                                                              | Description                                                                         |
| ------ | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| no     | `.`, `::`                                                                             | Method/constant resolution operators                                                |
| yes    | `[]`, `[]=`                                                                           | Collection element getter and setter.                                               |
| yes    | `**`                                                                                  | Exponential operator                                                                |
| yes    | `!`, `~`, `+`, `-`                                                                    | Not, complement, unary plus and minus (method names for the last two are +@ and -@) |
| yes    | `*`, `/`, `%`                                                                         | Multiply, divide, and modulo                                                        |
| yes    | `+`, `-`                                                                              | Plus, minus                                                                         |
| yes    | `>>`, `<<`                                                                            | Right and left shift                                                                |
| yes    | `&`                                                                                   | Bitwise "and"                                                                       |
| yes    | `^`, `|`                                                                              | Bitwise exclusive "or" and regular "or" (inclusive "or")                            |
| yes    | `<=`, `<`, `>`, `>=`                                                                  | Less than/equal to, less than, greater than, greater than/equal to                  |
| yes    | `<=>`, `==`, `===`, `!=`, `=~`, `!~`                                                  | Equality and pattern matching (`!=` and `!~` cannot be directly defined)            |
| no     | `&&`                                                                                  | Logical "and"                                                                       |
| no     | `||`                                                                                  | Logical "or"                                                                        |
| no     | `..`, `...`                                                                           | Inclusive range, exclusive range                                                    |
| no     | `? :`                                                                                 | Ternary if-then-else                                                                |
| no     | `=`, `%=`, `/=`, `-=`, `+=`, `|=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `||=`, `**=`, `{` | Assignment (and shortcuts) and block delimiter                                      |

Hence, we can see that many operators which are actually methods and can be defined in our classes to change their default behaviors. Such fake operators can be defined and made to work the way we intend to.

Many operators (methods) are overridden to provide fake operators. 

**Equality methods**

- One of the most common fake operators is `==`. Defining `==` method also gives us `!=` method automatically.

**Comparison methods**

Defining a comparison method, give us really nice syntax for comparing objects.

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)


puts "bob is older" if bob > kim    # => "bob is older"

# alternate syntax

puts "bob is older" if bob.>(kim)   # => "bob is older"
```
In the code above the age of the two objects of class `Person` is being compared. The comparison functionality is being pushed to the `Integer#>` method. The method `Person#>` can be used in conditionals.

Defining `>` doesn't automatically give us `<`. We need to define it separately.

`<<` method

Fake operator can also be used for the `<<` which is actually a method. It's best used when working with a class that represents a collection.

`+` method

Even `+` is a method. so `1 + 1` is actually `1.+(1)` which returns `2`.

We can write a `+` method for our own objects. The way Ruby's standard library implements is as follows :

- `Integer#+`: increments the value by value of the argument, returning a new integer
- `String#+`: concatenates with argument, returning a new string
- `Array#+`: concatenates with argument, returning  a new array
- `Date#+`: increments the date in days by value of the argument, returning a new date

It's generally a good idea to follow the general usage of a method as in the standard libraries.

Element setter and getter methods - `[]`, `[]=`

Element setter and getter methods `[]=` and `[]` are most commonly used for arrays. These are also methods. The syntactical sugar is a little too extreme though :

```ruby
array = ['a', 'b', 'c', 'd']

# element refernce
array[2]          # => 'c'

# it's actually a method call
array.[](2)       # => 'c'

# element assignment
array[4] = 'e'
p array           # => ['a', 'b', 'c', 'd', 'e']

# it's also a method call
array.[]=(5, 'f')
p array           # => ['a', 'b', 'c', 'd', 'e', 'f']
```

When defining `[]` and `[]=` methods for our own classes we must keep in mind the way it's used in the standard library. It's usually good for classes that represent a collection. However, being instance methods they can be defined to bo whatever we want, but it is not a good idea generally.

Sample code showing all the fake operators in action:

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push(person)
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
dream_team.name = "Dream Team"

dream_team[4]
dream_team[5] = Person.new("JJ", 72)

puts dream_team.inspect
```

## Working with collaborator objects

Classes group common behaviour and objects encapsulate state. Object's states are saved in an object's instance variables. Instance methods operate on those instance variables. The instance variables can hold objects belonging to classes such as `String`, `Integer` etc., also collections like `Array`, `Hash`, etc. or even an object of a custom class we've created. Objects that are stored as state within another object are called "collaborator objects". 

They are called collaborators because they work in conjunction (or in collaboration) with the class they are associated with. 

Example:

```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Bulldog
  def speak
    puts "bark!"
  end

  def fetch
    puts "fetching!"
  end
end

bob = Person.new("Robert")
bud = Bulldog.new

bob.pet = bud                 # `bob`'s `@pet` now points to `bud` which is a `Bulldog` object.

bob.pet                       # => #<Bulldog:0x007fd8399eb920>
bob.pet.class                 # => Bulldog

bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"
```

Here, for `bob` we have a collaborator object stored in `@pet` variable. When we need that `Bulldog` object to perform some action, we can go through `bob` and call the method on the object stored in `@pet` such `speak` or `fetch`. 

When we work with collaborator objects, they are usually custom objects of user defined classes. However, collaborator objects aren't strictly custom objects. Even the string object stored in `@name` within `bob` in the code above is technically a collaborator object.

Collaborator objects play an important role in OO design. They also represent the connection between various classes in your program. They allow you to chop up and modularize the problem domain into cohesive pieces; they are at the core of OO programming and play an important role in modelling complicated problem domains.
