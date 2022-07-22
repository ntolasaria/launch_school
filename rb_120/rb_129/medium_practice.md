1. What will the following code output? Why?

```ruby
class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    @id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
p tom.id
```

**Answer:**

The above code outputs and returns `45`.

In the above code a class `Student` is defined which has two instance variables `@name` and `@id`, a getter method for `@id`, a constructor method `intialize` and a setter method `id=`.

A new object of the class `Student` is instantiated by calling the class method `new` on the class `Student` and the string `"Tom"` is passed as an argument. The local variable `tom` is initialized to this object. On instantiation the constructor method `initialize` is called, wherein the string referenced by the parameter `name` is assigned to the instance variable `@name`. The instance variable `@id` is initialized. 

On the next line the setter method `id=` is called on the object referenced by `tom` and `45` is passed as an argument. This assigns the interger `45` to the instance variable `@id`. 

On the next line the method `p` is called and the return value of the method `id` called on the object referenced by `tom` is passed as an argument. This call to the getter method returns the value refernced by instance variable `@id` which in this case is the integer `45`. Hence, `45` is output and that is only returned.

2. Define a class of your choice with the following:
- Constructor method that initializes 2 instance variables.
- Instance method that outputs an interpolated string of those variables.
- Getter methods for both (you can use the shorthand notation if you want).
- Prevent instances from accessing these methods outside of the class.
- Finally, explain what concept(s) you’ve just demonstrated with your code.

**Answer:**

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    "Hi, my name is #{name}, I am #{age} years old"
  end

  private

  attr_reader :name, :age
end
```

The above code defines a class `Person`, which has two instance variables `@name` and `@age`, one constructor method `initialize`, one public instance method `greet` and two private getter methods for the instance variables `@name` and `@age`.

The above code demonstrates the concept of method access control in ruby. The getter methods are private, and hence they can be only accessed within the class as done in the instance method `greet`. If tried to be accessed from outside the class it will raise an error.

```ruby
tom = Person.new("Tom", 33)
puts tom.greet    # => Hi, my name is Tom, I am 33 years old
tom.name          # => NoMethodError
```

Hence, it can be seen that we can make the methods that we don't want to be accessed from outside the class private. This helps in restricting access, preventing unwanted access and also restricts unwanted changes to our code.


3. What concept does the following code aim to demonstrate?
   
```ruby
module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"
```

**Answer:**

The above code defines a module `Greet` which has one method `greet`. It further defines two classes `Teacher` and `Student` both of which have the module `Greet` mixed in. 

The code demonstrates the concept of polymorphism through interface inheritance (modules). When a module is mixed in to a class, the instances of the class can access the methods defined in the module.

In this case, the instances of the classes `Teacher` and `Student` referenced by `tom` and `rob` respectively can access the method `greet` defined in the module `Greet` which takes in one parameter. 

Even, though `tom` and `rob` point to objects of different classes, they both respond to the method `greet`, this is polymorphism.

The code outputs `Bonjour!` and `Hello!` in that order and returns `nil`.

4. What will the last line of code return?

**Answer:**

```ruby
class Student
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  def ==(other)
    self.id == other.id
  end

  private

  attr_reader :id, :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

rob == tom
```

The last line of the code will raise an error `NoMethodError`. 

The last line `rob == tom` is actually a method call `rob.==(tom)`. Here the method `==` of the class `Student` is called which tries to compare the instance variables `@id` of both object on which the method is called and the object passed as argument. In this case the `Integer#==` should be used for comparison. However, within the class `Student` the getter method for `@id` is private hence the method call `rob.==` cannot access the getter method of the object referenced by `tom` and hence a `NoMethodError` is raised. 

One, way to rectify this would be to make the getter method for `@id` protected, this provides access to the method in between different instances of the class. It can be done as follows:

```ruby
class Student
  ...

  private

  attr_reader :name

  protected

  attr_reader :id
end
```

If the code is run after this rectification, the code will return `false` as it will use the `Integer#==` for comparison and since the ids of both the objects have different values, `false` is returned.

5. — What will the last 2 lines of code output?

```ruby
class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a
puts Foo.method_b(Foo)
```

# Pending

6. Will the following code execute? What will be the output?

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
     "Hello! they call me #{name}"
  end
end

class Puppet < Person
  def initialize(name)
    super
  end

  def greet(message)
    puts super + message
  end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")
```

The above code will raise an error `ArgumentError`. 

The above code defines a class `Person`. Another class `Puppet` is defined which inherits from `Person`.

An object of the class `Puppet` is instantiated and the string `"Cookie Monster"` is passed as an argument. Local variable `puppet` is initialized to this object. When the class method `new` is called, the `initialize` method for `Puppet` is automatically invoked and `"Cookie Monster"` is passed as an argument. Within the `initialize` method `super` is called and this in turn calls the method with the name `initialize` up the method lookup chain. In this case, that is the `initialize` method of class `Person`. All the arguments from the original method call are also passed. Within the `initialize` method in `Person` the instance variable `@name` is made to reference to the string `"Cookie Monster"`. 

On the next line, the method `greet` is called on the object referenced by `puppet` and the string `" and I love cookies!"` is passed as an argument. Within the instance method `greet` of class `Puppet`, `super` is called and this invokes the method with the same name up the method lookup path. In this case the method `greet` in class `Person`. Also, all the arguments are also passed by default. Since, the method `greet` of `Person` does not take any arguments an `ArgumentError` is raised. To sort this we can call super with empty parentheses like `super()` and by doing this the method `greet` of class `Person` will be called without any arguments and it will return `"Hello, they call me Cookie Monster"` which will be added with the string `" and I love cookies!"` and will be output.

7. What concept does this code demonstrate? What will be the output?

**Answer:**

```ruby
class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)
```

The above code will output `"Bird is flying!"`, `"Pigeon is flying!"` and `"Duck is flying!"` in that order.

The above code defines a class `Bird` and two more classes `Pigeon` and `Duck` both of which are sub-classes of `Bird`. The class `Bird` has a method `fly`. Due to inheritance, even `Pigeon` and `Duck` have accesss to the method `fly`. 

On the last line the local variable `birds` is initialized to the return value of the method `each` called on the array `[Bird.new, Pigeon.new, Duck.new]` and with `&:fly` as argument which basically calls the method `fly` on each of the objects in the array.

Within the method `fly`, a string is returned in which the name of the individual class is also contained by string interpolation. This method returns strings `"Bird is flying!"`, `"Pigeon is flying!"` and `"Duck is flying!"` in the same order.

This demonstrates the concept of polymorphism, particularly polymorphism by inheritance. Each of the objects respond to the method `fly` and hence they can be used in this way. Even though the output is tailored according to each class, the important thing is that objects of each class have a method `fly` which takes no arguments and hence they can be used polymorphically.

8. What does the self keyword refer to in the good method?

**Answer:**

```ruby
class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog"
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good
```
The above defines a class `Dog` which has one instance method `good`, one instance variable `@name` and a getter as well as setter method for `@name`.

Within the instance method `good` the keyword `self` is used. This refers to the object (or instance) on which the method is called. In this case `self` refers to the object being referenced by `bandit`.

9. What will the last three lines of code print to the console? After song.artist is called, what would be returned if we inspect the song object?

```ruby
class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

p song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist
```

**Answer:**

The first line outputs the object of class `Song` and shows the instance variable `@title` with value `"Superstition"`.

The second line outputs the return value of the 


