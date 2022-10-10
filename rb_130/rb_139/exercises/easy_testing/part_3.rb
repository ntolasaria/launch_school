require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_for_nil
    value = [nil, true].sample
    p value
    assert_nil(value)
  end
end
