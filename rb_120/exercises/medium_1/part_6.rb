class GuessingGame
  RANGE = (1..100)
  MAX_GUESSES = 7

  def initialize
    reset
  end

  def reset
    @number = rand(RANGE)
  end


  def play
    reset
    MAX_GUESSES.downto(1) do |remaining_guesses|
      input_prompt(remaining_guesses)
      display_result
      break if user_won?
    end
    display_outcome
  end

  def input_prompt(remaining_guesses)
    puts "You have #{remaining_guesses} guesses remaining."
    print "Enter a number between 1 and 100: "
    input = nil

    loop do
      input = gets.chomp.to_i
      break if (1..100).include?(input)
      print "Invalid guess. Enter a number between #{RANGE.first} and #{RANGE.last}: "
    end

    @current_guess = input
  end

  def user_won?
    @current_guess == @number
  end

  def display_result
    if user_won?
      puts "That's the number!"
    elsif @current_guess < @number
      puts "Your guess is too low."
    else
      puts "You guess is too high."
    end
    puts ""
  end

  def display_outcome
    if user_won?
      puts "You won!"
    else
      puts "You have no more guesses remaining!"
      puts "The number was '#{@number}'"
    end
    puts ""
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

game.play

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