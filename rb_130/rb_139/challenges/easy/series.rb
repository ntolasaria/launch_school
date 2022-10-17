class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError if size > string.size
    string.chars.map(&:to_i).each_cons(size).to_a
  end
end
