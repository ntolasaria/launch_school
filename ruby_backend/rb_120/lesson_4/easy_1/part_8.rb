class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

new_bag = Bag.new('brown', 'leather')
p new_bag