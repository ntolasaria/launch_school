Code Examples for concepts:

# Encapsulation

```ruby
class Student
  def initialize(name)
    @name = name
    @scores = []
  end

  def update_scores(score)
    if score.to_s.to_i == score && score >= 0
      @scores << score
    else
      puts "Please enter a valid score"
    end
  end

  def display_grade
    "The grade is #{grade}."
  end

  private

  def grade
    case (@scores.reduce(:+) / @scores.size)
    when (90..100)  then 'A'
    when (80..89)   then 'B'
    else                 'C'
    end
  end
end
```

# Polymorphism

Polymorphism thorugh inheritance (Simple Launch School example for this one):

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

# Duck Typing

```ruby
class Architect
  def display_work
    puts "Architecture"
  end
end

class Engineer
  def display_work
    puts "Engineering"
  end
end

class Programmer
  def display_work
    puts "Programming"
  end
end

persons = [Architect.new, Engineer.new, Programmer.new]
persons.each(& :display_work)
```
# Inheritance

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    "My name is #{@name}, I am a  #{self.class}"
  end
end

class Student < Person
  def initialize(name, age, education)
    super(name, age)
    @education = education
  end
end

class Professional < Person
  def initialize(name, age, profession)
    super(name, age)
    @profession = profession
  end
end
```

# Modules

```ruby
module Swimmable
  def swim; end
end

class Pet; end

class Mammal < Pet; end

class Fish < Animal
  include Swimmable
end

class Dog < Mammal
  include Swimmable
end

class Cat < Mammal
end

```


# Method Access Controls

```ruby
class Player
  def initialize(name, score)
    @name = name
    @score = score
  end

  def display_result
    puts "The result is: #{result}"
  end

  def match_result(other)
    if score > other.score
      "#{name} wins!"
    elsif score < other.score
      "#{other.name} wins!"
    else 
      "It's a tie"
    end
  end

  protected

  attr_reader :name, :score

  private

  def result
    case score
    when (91..100)  then "excellent"
    when (81..90)   then "good"
    when (71..80)   then "fair"
    else                 "poor"
    end
  end
end

mike = Player.new('Mike', 95)
mike.display_result

tim = Player.new('Tim', 85)

tim.display_result

puts tim.match_result(mike)
```

# Class Variables

```ruby
class Book
  @@no_of_books = 0

  def initialize(title, author)
    @title = title
    @author = author
    @@no_of_books += 1
  end

  def self.total_books
    @@no_of_books
  end
end
```

# Collaborator Objects:

```ruby
class Pet
  def initialize(name, type)
    @name = name
    @type = type
  end

  def info
    "A #{@type} named #{@name}"
  end
end

class Person
  attr_reader :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt(pet)
    @pets << pet
  end
end

sparky = Pet.new("Sparky", "Dog")
kitty = Pet.new("Kitty", "Cat")

mike = Person.new("Mike")
mike.adopt(sparky)
mike.adopt(kitty)

mike.pets.each { |pet| puts pet.info}
```