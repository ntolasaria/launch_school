require 'minitest/autorun'

class BooleanTest < Minitest::Test
  attr_reader :value

  def setup
    @value = ['XYZ', 'xyz', 'Xyz', 'abc'].sample
  end

  def test_odd
    p value
    assert_equal('xyz', value.downcase)
  end
end

