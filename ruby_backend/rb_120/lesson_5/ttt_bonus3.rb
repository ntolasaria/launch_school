require 'pry-byebug'

class Board
  attr_accessor :human_marker, :computer_marker

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(human_marker)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(computer_marker)
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def key_at_risk?
    !!find_at_risk_key
  end

  def win_possible?
    !!find_at_risk_key(computer_marker)
  end

  def winning_key
    find_at_risk_key(computer_marker)
  end

  def find_at_risk_key(mark=human_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_markers_one_unmarked?(squares, mark)
        return line.find { |key| @squares[key].unmarked? }
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def state
    if win_possible?
      "Offense"
    elsif key_at_risk?
      "Defense"
    elsif @squares[5].unmarked?
      "5 empty"
    else
      "Neutral"
    end
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    markers.size == 3 && markers.min == markers.max
  end

  def two_markers_one_unmarked?(squares, mark)
    squares.count { |sq| sq.marker == mark } == 2 &&
      squares.count(&:unmarked?) == 1
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :score, :name, :board

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
    @score = 0
  end

  def increment_score
    @score += 1
  end
end

class Human < Player
  def initialize(name, marker, board)
    super(name, marker, board)
    board.human_marker = marker
  end

  def move
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry that's not a valid choice."
    end
    board[square] = marker
  end
end

class Computer < Player
  def initialize(name, marker, board)
    super(name, marker, board)
    board.computer_marker = marker
  end

  def move
    case board.state
    when "Offense"
      board[board.winning_key] = marker
    when "Defense"
      board[board.find_at_risk_key] = marker
    when "5 empty"
      board[5] = marker
    else
      board[board.unmarked_keys.sample] = marker
    end
  end
end

class TTTGame
  VALID_MARKERS = ['X', 'O']
  COMPUTER_NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']
  PLAY_TO_SCORE = 5

  attr_reader :board, :human, :computer

  def initialize
    clear
    @board = Board.new
    @human = Human.new(ask_human_name, ask_human_marker, board)
    @computer = Computer.new(COMPUTER_NAMES.sample, computer_marker, board)
    @first_to_move = human
    @current_player = @first_to_move
  end

  def play
    clear
    display_welcome_message
    main_game
    display_grand_winner if winning_score_reached?
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      update_scores_and_display_result
      break if winning_score_reached? || user_wants_quit?
      reset
      display_play_again_message
    end
    display_final_scores
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def ask_human_name
    name = nil
    loop do
      puts "Enter your name:"
      name = gets.chomp
      break unless name.empty?
    end
    name
  end

  def computer_marker
    VALID_MARKERS.find { |marker| marker != human.marker }
  end

  def ask_human_marker
    user_marker = nil
    loop do
      puts "Choose your marker 'X' or 'O':"
      user_marker = gets.chomp.upcase
      break if VALID_MARKERS.include?(user_marker)
    end
    user_marker
  end

  def winning_score_reached?
    human.score == 5 || computer.score == 5
  end

  def user_wants_quit?
    puts "\nEnter 'q' to quit, any other key and return to continue:"
    input = gets.chomp.downcase
    input.start_with?('q') ? true : false
  end

  def display_grand_winner
    case board.winning_marker
    when human.marker
      puts "You are the Grand Winner!!!"
    else
      puts "#{computer.name} is the Grand Winner!!!"
    end
    puts ""
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!\n\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!\n\n"
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    puts "Scores - #{score_string}"
    puts ""
    board.draw
    puts ""
  end

  def display_final_scores
    puts "\nThe final scores are:\n\n"
    puts score_string
    puts ""
  end

  def score_string
    "#{human.name}: #{human.score},   #{computer.name}: #{computer.score}"
  end

  def join_unmarked_spaces(delimiter=', ', word='or')
    spaces = board.unmarked_keys
    return spaces.first if spaces.size == 1
    spaces[0..-2].join(delimiter) + " #{word} #{spaces[-1]}"
  end

  def display_unmarked_spaces
    puts "Choose a square from (#{join_unmarked_spaces}):"
  end

  def human_moves
    display_unmarked_spaces
    human.move
  end

  def computer_moves
    computer.move
  end

  def update_scores_and_display_result
    winning_message = update_scores_and_return_string
    clear_screen_and_display_board
    puts winning_message
  end

  def update_scores_and_return_string
    case board.winning_marker
    when human.marker
      human.increment_score
      "You won!"
    when computer.marker
      computer.increment_score
      "Computer won!"
    else
      "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset
    board.reset
    @current_player = @first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = computer
    else
      computer_moves
      @current_player = human
    end
  end

  def human_turn?
    @current_player == human
  end
end

game = TTTGame.new
game.play
