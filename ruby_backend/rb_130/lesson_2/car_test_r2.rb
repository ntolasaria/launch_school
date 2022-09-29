require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def setup
    @car = Car.new
  end

  # testing if car exists with #assert
  def test_car_exists
    assert(@car)
  end

  # testing if car has 4 wheels with #assert_equal
  def test_wheels
    assert_equal(4, @car.wheels)
  end

  # testing if @name of car is `nil` with #assert_nil
  def test_name_is_nil
    assert_nil(@car.name)
  end

  # testing if instantiating with arguments raises error with #assert_raises
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  # testing if car object is an instance of class `Car` with #assert_instance_of
  # specially useful when dealing with inheritance
  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  # testing #assert_includes with car object in an array of other objects
  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end