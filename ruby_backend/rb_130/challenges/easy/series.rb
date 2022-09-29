class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.split('').map(& :to_i)
  end

  def slices(size)
    raise ArgumentError if size > numbers.size
    numbers.each_cons(size).to_a
  end
end