require 'pry-byebug'

class Card
  FACE = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(H D C S)
  FACE_CARDS = %w(Jack Queen King)

  # attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'C' then 'Clubs'
    when 'S' then 'Spades'
    end
  end

  def to_s
    "#{face} of #{suit}"
  end

  def value
    if face.to_i.to_s == face
      face.to_i
    elsif FACE_CARDS.include?(face)
      10
    else
      11
    end
  end
end

class Deck
  attr_reader :cards

  def initialize
    shuffle_cards!
  end

  def deal_card
    @cards.pop
  end

  def shuffle_cards!
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACE.each do |face|
        @cards << Card.new(face, suit)
      end
    end
    @cards.shuffle!
  end

  def show_cards
    @cards.each { |card| puts card }
  end
end

class Participant
  attr_reader :cards, :score

  def initialize
    @cards = []
  end

  def busted?
    total > 21
  end

  def give_card(card)
    @cards << card
  end

  def show_cards
    puts "#{name} has:"
    @cards.each { |card| puts card }
    puts "------------------------"
    puts "Total: #{total}"
    puts ""
  end

  def total
    sum = 0
    @cards.each do |card|
      sum += card.value
    end
    @cards.select { |card| card.face == 'Ace' }.each do
      sum -= 10 if sum > 21
    end
    sum
  end

  def reset
    @cards = []
  end
end

class Player < Participant
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end
end

class Dealer < Participant
  DEALER_NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']
  attr_reader :name

  def initialize
    super
    @name = DEALER_NAMES.sample
  end

  def show_flop
    puts "#{name} has:"
    puts @cards[0]
    puts "??"
    puts "------------------------"
    puts ""
  end
end

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new(ask_for_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @current_player = @player
  end

  def start
    loop do
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn
      show_result
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  def reset_game
    deck.shuffle_cards!
    player.reset
    dealer.reset
  end

  def deal_cards
    2.times do
      player.give_card(deck.deal_card)
      dealer.give_card(deck.deal_card)
    end
  end

  def show_initial_cards
    system 'clear'
    dealer.show_flop
    player.show_cards
  end

  def player_turn
    loop do
      input = hit_or_stay
      if input.downcase == 's'
        puts "#{player.name} stays!"
        break
      end
      player_hits
      break if player.busted?
    end
    @current_player = dealer
  end

  def player_hits
    player.give_card(deck.deal_card)
    player.show_cards
  end

  def dealer_turn
    return if player.busted?
    while dealer.total < 17
      dealer_hits
    end
    puts "#{dealer.name} stays!" if dealer.total <= 21
    puts ""
    dealer.show_cards
  end

  def dealer_hits
    puts "#{dealer.name} hits!"
    dealer.give_card(deck.deal_card)
  end

  def busted?
    player.busted? || dealer.busted?
  end

  def show_result
    if busted?
      show_busted
    else
      winning_total
    end
  end

  def show_busted
    if player.busted?
      puts "#{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} busted! #{player.name} wins!"
    end
  end

  def winning_total
    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif dealer.total > player.total
      puts "#{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def hit_or_stay
    input = nil
    puts "Would you like to (h)it or (s)tay?"
    loop do
      input = gets.chomp
      break if %w(h s).include?(input.downcase)
      puts "Please enter a valid input ('h' or 's')!"
    end
    input
  end

  def ask_for_name
    puts "Please enter your name:"
    name = nil
    loop do
      name = gets.chomp
      break if !name.empty?
      puts "Please enter a valid name!"
    end
    name
  end

  def play_again?
    puts "Would you like to play again (y/n)?"
    input = nil
    loop do
      input = gets.chomp
      break if %w(y n).include?(input.downcase)
      puts "Please enter a valid input (y or n):"
    end
    input == 'y'
  end

  def display_goodbye_message
    puts ""
    puts "Thank you for playing Twenty-One"
    puts "Goodbye!!!"
  end
end

Game.new.start
