require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :list

  def setup
    @list = List.new
  end

  def test_odd
    assert_same(list, list.process)
  end
end


class List
  def initialize
    @list = (1..10).to_a
  end

  def process
    [self, 'random'].sample
  end
end
