26.

How do class inheritance and mixing in modules affect instance variable scope? Give an example.

**Answer:** (Needs to be verified)

29.
When does accidental method overriding occur, and why? Give an example.

# Questions

- Are methods defined in a module, instance methods? (TA)


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


Ruby OOP Exercises:

Debugging - part 10 `Does it Rock or Not?`

Medium_1 - part_5 - `celsius to farenheit thing`


Come up with real world examples for all concepts before the interview.

Points from Isabel:

- we use encapsulation BY creating classes
- we use encapsulation TO hide data



- CONSTANT scoping rules (looks up and is available. Not available down the heirarchy)


good example of encapsulation:

```ruby
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split(' ')
    self.first_name = parts[0]
    self.last_name = parts[1] ? parts[1] : ''
  end
end

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name

bob.name = 'John Adams'
puts bob.first_name
puts bob.last_name

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# puts bob.name == rob.name

# puts "The person's name is: #{bob}"
```