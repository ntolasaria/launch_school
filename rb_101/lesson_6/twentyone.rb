# Initialize deck
# Deal cards to player and dealer
# Plyer turn  : hit or stay
# - repeat until bust() or stay -> (gets)
# If player bust, dealer wins.
# Dealer turn : hit or stay
# - repeat until total >= 17
# If dealer bust, playe wins
# Compare cards and declare winner

require 'pry-byebug'

CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(H D C S)
GAME_TOTAL = 21
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def generate_deck
  deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      deck << [suit, card]
    end
  end
  deck.shuffle
end

def total(cards)
  card_values = cards.map { |card| card[1] }

  sum = 0
  card_values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i.to_s != value
      sum += 10
    else
      sum += value.to_i
    end
  end

  card_values.count('A').times do
    sum -= 10 if sum > GAME_TOTAL
  end

  sum
end

def bust?(cards)
  total(cards) > GAME_TOTAL
end

def hit(cards, deck)
  cards << deck.pop
end

def initial_deal(player, dealer, deck)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def join_card_values(card_values)
  if card_values.size <= 2
    card_values.join(' and ')
  else
    card_values[0..-2].join(', ') << ' and ' << card_values[-1]
  end
end

def card_display(cards)
  card_values = cards.map do |card|
    if card[1].to_i.to_s == card[1]
      card[1]
    elsif card[1] == 'J'
      'Jack'
    elsif card[1] == 'Q'
      'Queen'
    elsif card[1] == 'K'
      'King'
    else
      'Ace'
    end
  end

  join_card_values(card_values)
end

def game_display(player, dealer, player_turn=true)
  if player_turn
    prompt "Dealer has : #{card_display([dealer[1]])}"
  else
    prompt "Dealer has : #{card_display(dealer)}"
  end
  prompt "Player has : #{card_display(player)}"
  prompt "Player total is : #{total(player)}"
end

def total_winner(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)

  player_total = (GAME_TOTAL - player_total)
  dealer_total = (GAME_TOTAL - dealer_total)

  if player_total < dealer_total
    'Player'
  elsif dealer_total < player_total
    'Dealer'
  end
end

def game_winner(player, dealer)
  if bust?(player)
    'Dealer'
  elsif bust?(dealer)
    'Player'
  else
    total_winner(player, dealer)
  end
end

def final_display(player, dealer)
  puts "\n\n"
  prompt "Dealer has #{dealer} cards, total of: #{total(dealer)}"
  prompt "Player has #{player} cards, total of: #{total(player)}"
  if !!game_winner(player, dealer)
    prompt "The winner is: #{game_winner(player, dealer)}"
  else
    prompt "It's a tie"
  end

  puts "\n\n"
end

game_score = []

loop do
  deck = generate_deck
  player_turn = true
  player_cards = []
  dealer_cards = []
  system 'clear'

  initial_deal(player_cards, dealer_cards, deck)
  game_display(player_cards, dealer_cards, player_turn)

  loop do
    prompt "(h)it or (s)tay ?"
    input = gets.chomp
    if input.downcase.start_with?('s')
      prompt "You chose to stay"
      break
    elsif !input.downcase.start_with?('s') && !input.downcase.start_with?('h')
      prompt "Please chose a valid option (h or s)"
      next
    end

    prompt "You chose to hit"

    hit(player_cards, deck)
    game_display(player_cards, dealer_cards, player_turn)
    if bust?(player_cards)
      prompt "Player busted"
      break
    end
  end

  player_turn = !player_turn

  loop do
    break if  game_winner(player_cards, dealer_cards) == 'Dealer' ||
              bust?(dealer_cards) ||
              total(dealer_cards) >= DEALER_STAY

    game_display(player_cards, dealer_cards, player_turn)

    hit(dealer_cards, deck)
  end

  prompt "Dealer busted" if bust?(dealer_cards)

  final_display(player_cards, dealer_cards)

  game_score << game_winner(player_cards, dealer_cards)

  prompt "Dealer score : #{game_score.count('Dealer')}"
  prompt "Player score : #{game_score.count('Player')}"

  if game_score.count('Player') == 5 || game_score.count('Dealer') == 5
    prompt "The grand winner is #{game_winner(player_cards, dealer_cards)}"
    break
  end

  gets.chomp

end


prompt "Thank you for playing Twenty One. Goodbye."
