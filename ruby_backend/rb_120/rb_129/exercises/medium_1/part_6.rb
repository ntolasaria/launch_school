class GuessingGame
  NUMBER_RANGE = (1..100)
  TOTAL_GUESSES = 7

  def initialize
    @target_number = nil
  end

  def play
    loop do
      reset
      play_game
      display_win_or_loss
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def reset
    @target_number = rand(NUMBER_RANGE)
  end

  def play_game
    system 'clear'
    TOTAL_GUESSES.downto(1) do |guesses|
      display_guesses_remaning(guesses)
      ask_user_input
      display_result
      break if user_won?
    end
  end

  def display_guesses_remaning(guesses)
    if guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{guesses} guesses remaining."
    end
  end

  def ask_user_input
    print "Enter a number between 1 and 100: "
    loop do
      @input = gets.chomp.to_i
      break if NUMBER_RANGE.include?(@input)
      print "Invalid guess. Enter a number between 1 and 100: "
    end
  end

  def display_result
    return if user_won?
    if @input < @target_number
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
    puts
  end

  def user_won?
    @input == @target_number
  end

  def display_win_or_loss
    if user_won?
      puts "That's the number"
      puts
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def play_again?
    print "Do you want to play again (y/n)? "
    input = nil
    loop do
      input = gets.chomp.downcase
      break if %w(y n).include?(input)
      puts "Please enter a valid input (y or n)!"
    end
    input == 'y'
  end

  def display_goodbye_message
    puts
    puts %(Thank you for playing "Guessing Game" !!!)
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!