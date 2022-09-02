# Inside a preschool there are children, teachers, class assistants, 
# a principle, janitors, and cafeteria workers. Both teachers and assistants 
# can help a student with schoolwork and watch them on the playground. A 
# teacher teaches and an assistant helps kids with any bathroom emergencies. 
# Kids themselves can learn and play. A teacher and principle can supervise a 
# class. Only the principle has the ability to expel a kid. Janitors have the 
# ability to clean. Cafeteria workers have the ability to serve food. Children, 
# teachers, class assistants, principles, janitors and cafeteria workers all 
# have the ability to eat lunch.

# - Children
# - teacher
# - class assistants
# - principle
# - janitors
# - cafeteria workers

module Eatable
  def lunch
    "Eats lunch!"
  end
end

module Helpable
  def schoolwork_help
    "Helps with schoolwork!"
  end

  def watch_on_playground
    "Watches student on playground!"
  end
end

module Supervisable
  def supervise
    "Supervises!"
  end
end

class Children
  def learn
    "Learns!"
  end

  def play
    "Plays!"
  end
end

class SchoolStaff
end

class Teacher < SchoolStaff
  include Helpable
  include Supervisable

  def teach
    "Teaches!"
  end
end

class ClassAssistant < SchoolStaff
  include Helpable

  def bathroom_emergencies
    "Helps with bathroom emergencies!"
  end
end

class Principle < SchoolStaff
  include Supervisable

  def expel
    "Expels a kid!"
  end
end

class Janitor < SchoolStaff
  def clean
    "Cleans!"
  end
end

class CafeteriaWorker < SchoolStaff
  def serve_food
    "Serves food!"
  end
end
