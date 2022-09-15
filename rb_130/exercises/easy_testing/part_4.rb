require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :list

  def setup
    @list = [%w(a b c), [], [1, 2, 3]].sample
  end

  def test_odd
    p list
    assert_empty(list)
  end
end

