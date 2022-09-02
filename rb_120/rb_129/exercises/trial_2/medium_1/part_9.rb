class Card
  include Comparable
  attr_reader :rank, :suit
  
  FACE_CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    FACE_CARDS.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    generate_and_shuffle
  end

  def generate_and_shuffle
    @deck = SUITS.product(RANKS).map do |suit, rank|
      Card.new(rank, suit)
    end
    @deck.shuffle!
  end

  def draw
    generate_and_shuffle if @deck.empty?
    @deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
