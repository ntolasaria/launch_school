class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
    raise ArgumentError unless valid?
  end

  def valid?
    @sides = @sides.sort
    @sides[0..1].sum > @sides[2]
  end

  def kind
    if @sides.uniq.size == 1
      'equilateral'
    elsif @sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
end