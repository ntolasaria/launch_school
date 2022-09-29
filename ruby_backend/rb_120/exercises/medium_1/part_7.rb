class GuessingGame
  def initialize(first, last)
    @range = (first..last)
    @max_guesses = Math.log2(@range.size).to_i + 1
    reset
  end

  def reset
    @number = rand(@range)
  end


  def play
    reset
    @max_guesses.downto(1) do |remaining_guesses|
      input_prompt(remaining_guesses)
      display_result
      break if user_won?
    end
    display_outcome
  end

  def input_prompt(remaining_guesses)
    puts "You have #{remaining_guesses} guesses remaining."
    print "Enter a number between #{@range.first} and #{@range.last}: "
    input = nil

    loop do
      input = gets.chomp.to_i
      break if @range.include?(input)
      print "Invalid guess. Enter a number between #{@range.first} and #{@range.last}: "
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

game = GuessingGame.new(501, 1500)
game.play