module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
  def initialize
    puts "This object was initialized!"
  end
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
# sparky.speak("Arf!")
# bob = HumanBeing.new
# bob.speak("Hello!")

# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ''
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors
