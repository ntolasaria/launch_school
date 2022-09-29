require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :value

  def setup
    @value = [Numeric.new, 1, 2.0, 'a', ['b']].sample
  end

  def test_odd
    p value
    assert_includes value.class.ancestors, Numeric
    assert_kind_of Numeric, value
  end
end
