require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def test_empty_array
    array = [[], [1, 2, 3], []].sample
    # assert array.empty?, "#{array} is not empty!"
    assert_empty array
  end
end