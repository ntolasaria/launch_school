require 'pry-byebug'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # digonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(arr, sym=', ', str='or')
  case arr.size
  when 0 then ''
  when 1 then arr[0]
  when 2 then arr.join(" #{str} ")
  else
    arr[0...-1].join(sym) << " #{str} #{arr[-1]}"
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Chose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

# def find_winning_square(brd, line)
#   if brd.values_at(*line).count(COMPUTER_MARKER) == 2
#     brd.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
#   else
#     nil
#   end
# end


def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|  # offence
    square = find_at_risk_square(brd, line, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|  # defence
      square = find_at_risk_square(brd, line, PLAYER_MARKER)
      break if square
    end
  end
  
  if !square
    square = empty_squares(brd).sample if empty_squares(brd).size == 9
  end

  if !square 
    square = 5 if empty_squares(brd).include?(5)
  end

  if !square
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  !player
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def decide_turn(player, decider='Player')
  system 'clear'
  if decider == 'Computer' 
    player = [true,false].sample
    if player
      prompt "Computer decides player goes first."
    else
      prompt "Computer decides to go first."  
    end
    prompt "Press any key to continue:"
    input = gets.chomp
  else
    player = false
    prompt "Who goes first (press 'p' for player):"
    turn = gets.chomp
    player = true if turn.downcase.start_with?('p') 
  end
  player
end

def print_in_box(str)
  box_width = str.length + 4
  horizontal_line = "+#{'-' * (box_width - 2)}+"
  empty_line = "|#{' ' * (box_width - 2)}|"
  puts horizontal_line
  puts empty_line
  puts "| #{str} |"
  puts empty_line
  puts horizontal_line
end

score = { 'Player' => 0, 'Computer' => 0 }

current_player = false
current_player = decide_turn(current_player)

loop do
  system 'clear'
  board = initialize_board # board state - hash
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    score[detect_winner(board)] += 1
  else
    prompt "It's a tie!"
  end
  
  prompt "Score:"
  score.each {|k, v| prompt "#{k}: #{v} "}

  if score.values.any?(5)
    prompt "#{detect_winner(board)} wins!"
    break
  end

  puts "\nPress any key to continue or (q) to quit"
  key = gets.chomp
  break if key.downcase.start_with?('q')

  current_player = decide_turn(current_player, detect_winner(board))

end

print_in_box("Thank you for playing Tic Tac Toe! Good bye!")

