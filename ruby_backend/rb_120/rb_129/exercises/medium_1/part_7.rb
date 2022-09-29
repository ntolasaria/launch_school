class GuessingGame
  def initialize(first_number, last_number)
    @range = (first_number..last_number)
    @guesses = Math.log2(@range.size).to_i + 1
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
    @target_number = rand(@range)
  end

  def play_game
    system 'clear'
    @guesses.downto(1) do |remaining_guesses|
      display_guesses_remaning(remaining_guesses)
      ask_user_input
      display_result
      break if user_won?
    end
  end

  def display_guesses_remaning(remaining_guesses)
    if remaining_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{remaining_guesses} guesses remaining."
    end
  end

  def ask_user_input
    print "Enter a number between #{@range.first} and #{@range.last}: "
    loop do
      @input = gets.chomp.to_i
      break if @range.include?(@input)
      print "Invalid guess. Enter a number between #{@range.first} and #{@range.last}: "
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

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!