module Promptable
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
    puts "\nWould you like to play again (y/n)?"
    input = nil
    loop do
      input = gets.chomp
      break if %w(y n).include?(input.downcase)
      puts "Please enter a valid input (y or n):"
    end
    input == 'y'
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
end

class Card
  FACE = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  SUITS = %w(Hearts Diamonds Clubs Spades)
  FACE_CARDS = %w(Jack Queen King)

  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
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
    reset
    @score = 0
  end

  def busted?
    total > 21
  end

  def give_card(card)
    @cards << card
  end

  def show_cards
    puts "\n#{name} has:"
    @cards.each { |card| puts card }
    puts "------------------------"
    puts "Total: #{total}\n\n"
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

  def increment_score
    @score += 1
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
    puts "\n#{name} has:"
    puts @cards[0]
    puts "??"
    puts "------------------------"
  end
end

class Game
  include Promptable

  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new(ask_for_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @current_winner = nil
  end

  def start
    loop do
      deal_cards_and_show_flop
      player_turn
      dealer_turn
      show_result_and_update_score
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  def reset_game
    deck.shuffle_cards!
    player.reset
    dealer.reset
    @current_winner = nil
  end

  def deal_cards_and_show_flop
    system 'clear'

    show_scores

    2.times do
      player.give_card(deck.deal_card)
      dealer.give_card(deck.deal_card)
    end

    dealer.show_flop
    player.show_cards
  end

  def show_scores
    puts "Scores:"
    puts "#{player.name}: #{player.score},    #{dealer.name}: #{dealer.score}"
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
  end

  def player_hits
    player.give_card(deck.deal_card)
    player.show_cards
  end

  def dealer_turn
    return if player.busted?

    while dealer.total < 17
      break if dealer.total > player.total
      dealer_hits
    end

    puts "#{dealer.name} stays!" if dealer.total <= 21
    dealer.show_cards
  end

  def dealer_hits
    puts "#{dealer.name} hits!"
    dealer.give_card(deck.deal_card)
  end

  def busted?
    player.busted? || dealer.busted?
  end

  def show_result_and_update_score
    if !(winner.nil?)
      print "#{busted_player.name} busted! " if busted?
      print "#{winner.name} wins!\n"
      winner.increment_score
    else
      puts "It's a tie!"
    end
  end

  def busted_player
    if player.busted?
      player
    elsif dealer.busted?
      dealer
    end
  end

  def winner
    if player.busted?
      dealer
    elsif dealer.busted?
      player
    elsif player.total > dealer.total
      player
    elsif dealer.total > player.total
      dealer
    end
  end

  def grand_winner
    if dealer.score > player.score
      dealer
    elsif player.score > dealer.score
      player
    end
  end

  def display_final_scores_and_winner
    puts "Overall results\n\n"
    show_scores
    if !grand_winner.nil?
      puts "\nThe Grand winner is #{grand_winner.name}!!!\n\n"
    else
      puts "\nThe game ends in a tie!!!\n\n"
    end
  end

  def display_goodbye_message
    display_final_scores_and_winner
    puts "Thank you for playing Twenty-One\n\n"
    puts "Goodbye!!!\n\n"
  end
end

Game.new.start
