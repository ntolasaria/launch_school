class Card
  include Comparable

  FACE_CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    if value == other.value
      suit_value <=> other.suit_value
    else
      value <=> other.value
    end
  end

  protected

  def value
    FACE_CARDS.fetch(rank, rank)
  end

  def suit_value
    SUIT_VALUES.fetch(suit)
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    reset
  end

  def reset
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
    @cards.shuffle!
  end

  def draw
    reset if @cards.empty?
    @cards.pop
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