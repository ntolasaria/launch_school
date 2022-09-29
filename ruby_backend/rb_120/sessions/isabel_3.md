```ruby
class Architect
  def work
    puts "Prepare plans!"
  end
end

class Programmer
  def work
    puts "Write some code!"
  end
end

class Chef
  def work
    puts "Cooks an entree!"
  end
end

[Architect.new, Programmer.new, Chef.new].each(&:work)
```

Example of polymorphism through duck typing

- Encapsulation
- Polymorphism
- Duck Typing
- Inheritance
- Modules
- Method Access Controls
- Class Variables
