class CustomSet
  def initialize(set=[])
    @elements = set.uniq 
  end

  def empty?
    elements.empty?
  end

  def contains?(el)
    elements.include?(el)
  end

  def subset?(other)
    @elements.all? { |el| other.contains?(el) }
  end

  def disjoint?(other)
    @elements.all? { |el| !other.contains?(el) }
  end

  def eql?(other)
    elements.sort == other.elements.sort
  end

  def ==(other)
    eql?(other)
  end

  def add(el)
    @elements << el unless contains?(el)
    self
  end

  def intersection(other)
    shared_elements = elements.select do |el|
      other.contains?(el)
    end
    CustomSet.new(shared_elements)
  end

  def difference(other)
    different = elements.select do |el|
      !other.contains?(el)
    end
    CustomSet.new(different)
  end

  def union(other)
    union_set = CustomSet.new(elements)
    other.elements.each { |el| union_set.add(el) }
    union_set
  end

  protected

  attr_reader :elements
end