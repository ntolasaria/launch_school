class Dice
  def initialize
    @values = (1..6).to_a
  end

  def roll
    @values.sample
  end
end

class Board
  attr_reader :total

  def initialize
    @dice = (1..2).map { Dice.new }
    @total = nil
  end

  def roll
    puts "Dealer rolls..."
    total = 0
    puts
    @dice.each_with_index do |dice, idx|
      sleep(0.75)
      roll = dice.roll
      total += roll
      puts "Dice #{idx + 1}: #{roll}"
      puts
    end
    puts "Total: #{total}"
    @total = total
  end

  def result
    case @total
    when (2..6)   then "Seven Down"
    when (8..12)  then "Seven Up"
    else               "Lucky Seven"
    end
  end
end

class Player
  def initialize
    @wallet = 100
  end

  def place_bet(amount)
    @wallet -= amount if valid_bet?(amount)
  end

  def valid_bet?(amount)
    @wallet >= amount
  end

  def receive(winnings)
    @wallet += winnings
  end

  def balance
    @wallet
  end

  def bankrupt?
    @wallet == 0
  end
end

class SevenUpDown
  attr_reader :player, :board

  CHOICES = { 'd' => 'Seven Down', 'u' => 'Seven Up', '7' => 'Lucky Seven' }
  PAYOUTS = { 'd' => 2, 'u' => 2, '7' => 5 }

  def initialize
    @board = Board.new
    @player = Player.new
    @choice = nil
    @bet = nil
  end

  def play
    print_welcome_message
    game_play
    print_goodbye_message
  end

  def game_play
    loop do
      display_wallet_amount
      player_chooses_option
      player_places_bets
      dice_roll
      print_result_of_roll
      print_result_of_deal
      settle_bet
      break if player_bankrupt?
      break unless play_again?
      clear
    end
  end
 
  def clear
    system 'clear'
  end

  def print_welcome_message
    clear
    puts "Welcome to Seven Up Seven Down!!!"
    puts "Press any key to continue..."
    gets
  end

  def display_wallet_amount
    clear
    puts "Player wallet: $ #{player.balance}"
    puts
  end

  def player_chooses_option
    puts "Please choose from the following options:"
    puts "Seven Down (d), Seven Up (u), Lucky Seven (7)"
    loop do
      @choice =  gets.chomp.downcase
      break if CHOICES.include?(@choice)
      puts "Please enter a valid option ('d', 'u' or '7')!"
    end
    puts "Player chooses #{CHOICES[@choice]}!"
    puts
  end

  def player_places_bets
    puts "Please enter the amount to bet:"
    loop do
      @bet = gets.chomp.to_i.abs
      break if player.place_bet(@bet)
      puts "Please enter a valid amount!"
    end
    puts
  end

  def dice_roll
    board.roll
  end

  def print_result_of_roll
    puts
    puts "The result is: #{board.result}"
    puts
  end

  def print_result_of_deal
    if player_wins?
      puts "Player Wins!"
    else
      puts "Player Loses!"
    end
    puts
  end

  def player_wins?
    CHOICES[@choice] == board.result
  end

  def settle_bet
    if player_wins?
      winnings = @bet * PAYOUTS[@choice]
      player.receive(winnings)
    end
  end

  def player_bankrupt?
    player.bankrupt?
  end

  def play_again?
    input = nil
    loop do
      puts "Would you like to play again (y / n) ?"
      input = gets.chomp.downcase
      break if input.start_with?('y') || input.start_with?('n')
      puts "Please enter a valid input ('y' or 'n')!"
    end
    input.start_with?('y')
  end

  def print_goodbye_message
    puts "It looks like the player is bankrupt!" if player_bankrupt?
    puts
    puts "Thank you for playing Seven Up Seven Down!"
    puts
    puts "Your wallet balance $ #{player.balance}"
    puts
  end
end

SevenUpDown.new.play

