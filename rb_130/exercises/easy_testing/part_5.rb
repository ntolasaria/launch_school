require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :employee

  def setup
    @employee = Employee.new
  end

  def test_odd
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end

class NoExperienceError < StandardError; end

class Employee
  attr_reader :experience

  def initialize
    @name = "generic employee"
    @experience = rand(1..10)
  end

  def hire
    if @experience < 5
      raise NoExperienceError, "Not enough experience"
    end
    @experience
  end
end
