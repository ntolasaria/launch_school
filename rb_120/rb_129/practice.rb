require 'pry-byebug'

module Describable
  def describe_shape
    binding.pry
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable
  
  def self.sides
    binding.pry
    self::SIDES
  end

  def sides
    binding.pry
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral
  def self.test_sides
    binding.pry
    puts "The constant 'SIDES' can be printed, see: #{SIDES}"
  end
end

p Square.sides
p Square.new.sides
p Square.new.describe_shape