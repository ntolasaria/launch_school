# class Person
#   # attr_reader :name # this is only for getter method
#   attr_accessor :name # this provides both setter and getter
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"
# puts bob.name

class Student
  attr_accessor :name, :grade
  
  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    @grade = new_grade
    p self
  end

end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade 

