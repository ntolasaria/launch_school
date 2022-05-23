# Instance Variables

# class Person
#   # def initialize(n)
#   #   @name = n
#   # end

#   def get_name
#     @name
#   end
# end

# bob = Person.new#('bob')
# # joe = Person.new('joe')

# # puts bob.inspect
# # puts joe.inspect

# p bob.get_name



# Class Variables

# class Person
#   @@total_people = 0

#   def self.total_people
#     @@total_people
#   end

#   def initialize
#     @@total_people += 1
#   end

#   def total_people
#     @@total_people
#   end
# end

# p Person.total_people
# Person.new
# Person.new
# p Person.total_people

# bob = Person.new
# p bob.total_people

# joe = Person.new
# p joe.total_people

# p Person.total_people



# Constant Variables aka CONSTANTS

class Computer
  GREETINGS = ['Beep', 'Boop']
end

class Person
  def self.greetings
    Computer::GREETINGS.join(', ')
  end
  def greet
    Computer::GREETINGS.sample
  end
end

puts Person.greetings
puts Person.new.greet

