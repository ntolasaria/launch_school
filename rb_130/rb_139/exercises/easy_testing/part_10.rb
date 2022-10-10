require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_for_not_include
    list = [['a', 'xyz'], [1, 2, 3]].sample
    refute_includes list, 'xyz'
  end
end
