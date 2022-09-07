class GuessingGame
  def initialize(lower, upper)
    @number_range = (lower..upper)
    @total_guesses = Math.log2(@number_range.size).to_i + 1
  end 

  def reset
    system 'clear'
    @number = rand(@number_range)
    @remaining_guesses = @total_guesses
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
    loop do
      print "Enter a number between #{@number_range.min} and #{@number_range.max}: "
      @user_input = gets.chomp.to_i
      break if @number_range.include?(@user_input)
      print "Invalid guess. "
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
    if user_won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The number was: #{@number}"
    end
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