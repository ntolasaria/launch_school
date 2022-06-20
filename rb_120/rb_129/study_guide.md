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
  


- How to call setters and getters
- Instance methods vs. class methods
- Method Access Control
- Referencing and setting instance variables vs. using getters and setters
- Class inheritance, encapsulation, and polymorphism
- Modules
- Method lookup path
- `self`
- Calling methods with self
- More about `self`
- Reading OO code
- Fake operators and equality
- Working with collaborator objects

