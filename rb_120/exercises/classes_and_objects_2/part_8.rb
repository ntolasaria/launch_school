class Person
  attr_accessor :secret
  # def secret=(message)
  #   @message = message
  # end

  # def secret
  #   @message
  # end
end


person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
