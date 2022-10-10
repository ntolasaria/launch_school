require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_for_xyz_in_list
    list = [['a', 'xyz', 'b'], [1, 2, 3]].sample
    assert_includes list, 'xyz'
  end
end
