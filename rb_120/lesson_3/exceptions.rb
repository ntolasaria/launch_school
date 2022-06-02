# class ValidateAgeError < StandardError; end

# def validate_age(age)
#   raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
# end

# begin
#   puts "Enter an age:"
#   age = gets.chomp.to_i
#   attempts ||= 0
#   validate_age(age)
# rescue ValidateAgeError => e
#   attempts += 1
#   p e
#   puts e.message  
#   retry if attempts < 3
# end

module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
  def sides
    SIDES
  end
end

class Square < Quadrilateral; end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides."