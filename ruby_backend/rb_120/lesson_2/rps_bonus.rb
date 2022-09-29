# Score to be kept :

# Noun: Score

# Class -> Human, Computer 
# State -> score, setter and getter in class Player

# downcase

# Rock crushes Lizard
# Rock crushes Scissors
# Paper covers Rock
# Paper disproves Spock
# Scissor cuts Paper
# Scissors decapitates Lizard
# Lizard poisons Spock
# Lizard eats Paper
# Spock smashes Scissors
# Spock vaporizes Rock

class Rock
  def >(other)
    other.class == Scissors ||
    other.class == Lizard
  end
end

class Paper
  def >(other)
    other.class == Rock ||
    other.class == Spock
  end
end

class Scissors
  def >(other)
    other.class == Paper ||
    other.class == Lizard
  end
end

class Lizard
  def >(other)
    other.class == Spock ||
    other.class == Paper
  end
end

class Spock
  def >(other)
    other.class == Scissors ||
    other.class == Rock
  end
end

class Player
  MOVES = { 'rock' => Rock, 'paper' => Paper, 'scissors' => Scissors,
            'lizard' => Lizard, 'spock' => Spock }

  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, spock:"
      choice = gets.chomp
      break if MOVES.has_key?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = MOVES[choice].new
    self.move_history << self.move.class.to_s
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case self.name
    when 'R2D2'
      self.move = Rock.new
    when 'Hal'
      choose_hal
    when 'Chappie'
      self.move = Paper.new
    else
      self.move = MOVES[MOVES.keys.sample].new
    end
    self.move_history << self.move.class.to_s
  end

  def choose_hal
    choices = []
    95.times { choices << Scissors }
    5.times { choices << Rock }
    self.move = choices.sample.new
  end
end

# Game Orchestration Engine

class RPSGame
  attr_accessor :human, :computer

  NO_OF_MOVES = 5

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "---------------------------------\n\n\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
    puts "---------------------------------------------------\n\n\n"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.class}."
    puts "#{computer.name} chose #{computer.move.class}.\n\n"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!\n\n"
      human.score += 1
    elsif computer.move > human.move
      puts "#{computer.name} won!\n\n"
      computer.score += 1
    else
      puts "It's a tie!\n\n"
    end
    display_scores
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry must, be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def match_over?
    human.score == NO_OF_MOVES || computer.score == NO_OF_MOVES
  end

  def display_grand_winner
    if human.score > computer.score
      puts "#{human.name} is the Grand Winner!!!"
    else
      puts "#{computer.name} is the Grand Winner!!!"
    end
    puts "\n\n"
  end

  def display_scores
    puts "Score:"
    puts "#{human.name}: #{human.score}, #{computer.name}: #{computer.score}\n\n"
  end

  def print_move_history
    puts "#{human.name}  x  #{computer.name}"
    human.move_history.each_with_index do |human_move, idx|
      puts "#{idx + 1}. #{human_move} x #{computer.move_history[idx]}"
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if match_over?
    end
    display_grand_winner
    display_goodbye_message
    print_move_history
  end
end

RPSGame.new.play
