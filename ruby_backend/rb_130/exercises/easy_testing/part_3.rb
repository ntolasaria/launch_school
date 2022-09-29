require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :value

  def setup
    @value = ['XYZ', 'xyz', 'Xyz', 'abc', nil].sample
  end

  def test_odd
    p value
    assert_nil(value)
  end
end

