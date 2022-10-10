require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize
    @experience = rand(1..10)
  end

  def hire
    raise NoExperienceError if @experience < 5
    p @experience
  end
end


class TestClass < Minitest::Test
  def test_for_experience
    assert_raises(NoExperienceError) do
      Employee.new.hire
    end
  end
end
