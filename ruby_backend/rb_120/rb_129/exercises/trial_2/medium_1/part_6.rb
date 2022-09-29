class GuessingGame
  NUMBER_RANGE = (1..100)
  NO_OF_GUESSES = 7

  def reset
    system 'clear'
    @number = rand(NUMBER_RANGE)
    @remaining_guesses = NO_OF_GUESSES
    @user_input = nil
  end

  def play
    reset
    loop do
      display_remaining_guesses
      ask_for_user_input
      display_result
      break if user_won? || guesses_over?
    end
    display_final_result
  end

  def display_remaining_guesses
    if @remaining_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@remaining_guesses} guesses remaining."
    end
  end

  def ask_for_user_input
    print "Enter a number between #{NUMBER_RANGE.min} and #{NUMBER_RANGE.max}: "
    loop do
      @user_input = gets.chomp.to_i
      break if NUMBER_RANGE.include?(@user_input)
      print "Invalid guess. Enter a number between #{NUMBER_RANGE.min} and #{NUMBER_RANGE.max}: "
    end
    @remaining_guesses -= 1
  end

  def display_result
    if @user_input < @number
      puts "Your guess is too low."
    elsif @user_input > @number
      puts "Your guess is too high."
    else
      puts "That's the number!"
    end
    puts
  end

  def user_won?
    @user_input == @number
  end

  def guesses_over?
    @remaining_guesses == 0
  end

  def display_final_result
    puts
    if user_won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The number was: #{@number}"
    end
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