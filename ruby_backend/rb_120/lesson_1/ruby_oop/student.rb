class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
  


end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 85)

puts "Well done!" if joe.better_grade_than?(bob)
