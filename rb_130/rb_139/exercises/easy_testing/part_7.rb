require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_instance_of_numeric
    value = [Numeric.new, 1].sample
    assert_instance_of Numeric, value
  end
end