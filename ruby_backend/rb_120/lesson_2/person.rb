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

# bob = Person.new('Robert')
# puts bob.name
# puts bob.first_name
# puts bob.last_name
# bob.last_name = 'Smith'
# puts bob.name

# bob.name = 'John Adams'
# puts bob.first_name
# puts bob.last_name

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name

puts "The person's name is: #{bob}"
