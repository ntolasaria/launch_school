require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :value

  def setup
    @value = rand(1..10)
  end

  def test_odd
    p value
    assert value.odd?, "value is not odd"
    assert_equal(true, value.odd?)
  end
end

