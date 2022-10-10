require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_for_subclasses
    value = [1, 'abc'].sample
    # assert_includes value.class.ancestors, Numeric
    assert_kind_of Numeric, value
  end
end