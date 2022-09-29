VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def result(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  result = result(choice, computer_choice)

  if result == 'player'
    prompt("You won!")
    player_score += 1
  elsif result == 'computer'
    prompt("Computer won!")
    computer_score += 1
  else
    prompt("It's a tie!")
  end

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Player score: #{player_score}, Computer score: #{computer_score}")

if player_score > computer_score
  prompt("YOU WON!")
elsif player_score < computer_score
  prompt("COMPUTER WON!")
else
  prompt("IT'S A TIE!")
end

prompt("Thank you for playing. Good bye!")
