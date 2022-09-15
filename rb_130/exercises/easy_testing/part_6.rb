require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :value

  def setup
    @value = [Numeric.new, 1, 2.0].sample
  end

  def test_odd
    p value
    assert_instance_of(Numeric, value)
  end
end

