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

tim = Student.new("Tim")
tim.update_scores(90)
tim.update_scores(95)
# tim.update_scores(-10)

puts tim.display_grade



