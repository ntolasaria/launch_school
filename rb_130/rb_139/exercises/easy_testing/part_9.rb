require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!


class List
  def process
    [self, 'random'].sample
  end
end

class TestClass < Minitest::Test
  def test_for_process
    list = List.new
    assert_same list, list.process
  end
end