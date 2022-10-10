require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_downcase_xyz
    value = ['abc', 'XYZ', 'xyz'].sample
    assert_equal('xyz', value.downcase)
  end
end