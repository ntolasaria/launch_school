VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  'sc' => 'scissors',
                  'l' => 'lizard',
                  'sp' => 'spock' }

MOVE_RESULTS = {  'rock' => ['scissors', 'lizard'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['paper', 'spock'],
                  'spock' => ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def hash_result?(first, second)
  MOVE_RESULTS[first].include?(second)
end

def result(player, computer)
  if hash_result?(player, computer)
    'player'
  elsif hash_result?(computer, player)
    'computer'
  end
end

player_score = 0
computer_score = 0
round_counter = 1

loop do
  choice = ''
  prompt("Round : #{round_counter}")
  loop do
    prompt("Choose one: ")
    VALID_CHOICES.each { |k, v| print "#{v}(#{k}) " }
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.keys.include?(choice)
      choice = VALID_CHOICES[choice]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = MOVE_RESULTS.keys.sample

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

  round_counter += 1

  break if player_score == 3 || computer_score == 3
end

prompt("Player score: #{player_score}, Computer score: #{computer_score}")

if player_score == 3
  prompt("YOU ARE THE GRAND WINNER!")
else
  prompt("COMPUTER IS THE GRAND WINNER!")
end

prompt("Thank you for playing. Good bye!")
