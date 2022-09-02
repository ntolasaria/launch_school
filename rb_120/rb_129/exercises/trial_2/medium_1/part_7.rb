class GuessingGame
  # NUMBER_RANGE = (1..100)
  # NO_OF_GUESSES = 7

  def initialize(lower, upper)
    @range = (lower..upper)
    @guesses = Math.log2(@range.size).to_i + 1
  end

  def reset
    @number = rand(@range)
  end

  def play
    system 'clear'
    reset

    @guesses.downto(1) do |remaining_guesses|
      display_guesses(remaining_guesses)
      # puts "You have #{remaining_guesses} guesses remaining."
      ask_for_user_input
      break if user_wins?
      display_result
    end

    display_final_result
  end

  def display_guesses(remaining_guesses)
    if remaining_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{remaining_guesses} guesses remaining."
    end
  end

  def ask_for_user_input
    print "Enter a number between #{@range.min} and #{@range.max}: "

    loop do
      @user_input = gets.chomp.to_i
      break if @range.include?(@user_input)
      print "Invalid guess. Enter a number between #{@range.min} and #{@range.max}: "
    end
  end

  def display_result
    if @user_input < @number
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
    puts
  end

  def display_final_result
    if user_wins?
      puts "That's the number!"
      puts
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The number was #{@number}"
    end
  end

  def user_wins?
    @user_input == @number
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