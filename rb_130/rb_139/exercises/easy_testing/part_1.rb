require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_for_add
    value = rand(1..10)
    assert(value.odd?, "#{value} is not odd")
  end
end
