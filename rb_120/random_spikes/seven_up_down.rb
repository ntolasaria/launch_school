class Dice
  def initialize
    @values = (1..6).to_a
  end

  def roll
    @values.sample
  end
end

class Board
  def initialize
    @dices = []
    2.times { @dices << Dice.new }
  end

  def roll_dice
    @sum = 0
    puts "\n\n"
    @dices.each_with_index do |dice, idx|
      num = dice.roll
      @sum += num
      sleep(0.75)
      puts "Dice #{idx + 1}:  #{num}"
    end
    puts "\nTotal: #{@sum}"
  end

  def round_result
    case @sum
    when (2..6)   then "Seven Down"
    when (8..12)  then "Seven Up"
    when 7        then "Number Seven"
    end
  end
end

class Player
  attr_reader :coins, :name

  def initialize
    @coins = 100
  end

  def valid_bet?(amount)
    amount >= 10 && (@coins - amount) >= 0
  end

  def bet(amount)
    @coins -= amount
  end

  def win_bet(winning_amount)
    @coins += winning_amount
  end

  def broke?
    @coins == 0
  end

  def ask_name(name)
    @name = name
  end
end

class SevenUpDownGame
  CHOICES = { 'u' => "Seven Up", 'd' => "Seven Down", '7' => "Number Seven" }
  attr_reader :board, :player

  def initialize
    @player = Player.new
    @board = Board.new
  end

  def play
    display_welcome_message
    ask_player_name
    loop do
      main_game
      break if player_broke?
      break unless play_again?
    end
    display_final_pot
  end

  def main_game
    round_header
    player_chooses
    player_places_bet
    display_choice
    roll_dice_and_show_total
    display_outcome
    settle_bet
  end

  def ask_player_name
    puts "Please enter your name:"
    name = nil
    loop do
      name = gets.chomp
      break unless name.delete(' ').empty?
      puts "Please enter a valid name!"
    end
    player.ask_name(name)
  end
  
  def display_welcome_message
    system 'clear'
    puts "Welcome to Seven up Seven down:\n\n"
  end

  def round_header
    system 'clear'
    header = "Name: #{player.name},     Available coins: #{player.coins}"
    puts header
    animate_repetitive_char('-', header.size, 0.02)
    puts ""
  end

  def animate_repetitive_char(char, size, delay)
    size.times do
      sleep(delay)
      print char
    end
  end

  def player_chooses
    # system 'clear'
    puts "Please choose from the following:"
    puts ""
    puts "Seven up (u), Seven down(d), Number Seven(7): "
    @choice = nil
    loop do
      @choice = gets.chomp.downcase
      break if CHOICES.include?(@choice)
      puts "Please enter a valid input (u, d or 7)!"
    end
  end

  def player_places_bet
    bet = nil
    loop do
      puts "Please enter an amount to bet (minimum 1 coin): "
      @bet = gets.chomp.to_i
      break if player.valid_bet?(@bet)
      puts "Please enter a valid bet amount between!"
    end
    player.bet(@bet)
  end

  def display_choice
    puts "\nYou chose: #{CHOICES[@choice]}"
  end

  def roll_dice_and_show_total
    puts "\nDealer rolls...\n\n"
    animate_repetitive_char(' [] ', 6, 0.15)
    board.roll_dice
    puts "\nThe result is: #{board.round_result}!"
  end

  def play_again?
    puts "Would you like to play again (y/n)?"
    input = nil
    loop do
      input = gets.chomp.downcase
      break if ['y', 'n'].include?(input)
      puts "Please enter a valid input (y or n)!"
    end
    input == 'y'
  end

  def display_outcome
    if player_wins?
      puts "\nYou win"
    else
      puts "\nYou lose"
    end
  end

  def player_wins?
    board.round_result == CHOICES[@choice]
  end

  def settle_bet
    if player_wins?
      if @choice == '7'
        winning_amount = @bet * 3
      else
        winning_amount = @bet * 2
      end
      player.win_bet(winning_amount)
      puts "\nYou win #{winning_amount} coins!"
    else
      puts "\nYou lose #{@bet} coins!"
    end
    puts "\nYou now have #{player.coins} coins\n\n"
  end

  def player_broke?
    if player.broke?
      puts "It's seems you are broke!!!"
      puts "Sorry..."
      true
    end
  end

  def display_final_pot
    puts ""
    balance_string = 'Your wallet balance: '
    print balance_string
    animate_player_coins(balance_string.size)
    puts "\n\nGoodbye!!!\n\n"
  end

  def animate_player_coins(string_size)
    coins = player.coins.to_s
    coins.size.times do |idx|
      print coins[idx]
      sleep(0.25)
    end
    puts ""
    animate_repetitive_char('-', string_size + coins.size, 0.03)
  end
end
  
SevenUpDownGame.new.play

