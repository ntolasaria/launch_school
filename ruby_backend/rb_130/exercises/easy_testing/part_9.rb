require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :list

  def setup
    @list = [[1, 2, 3], ['abc', 'xyz']].sample
  end

  def test_odd
    p list
    refute_includes list, 'xyz'
  end
end

