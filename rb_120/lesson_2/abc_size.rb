# Formula:

# abc_size = Math.sqrt(a**2 + b**2 + c**2)

if move1 == "rock" && (move2 == "scissors" || move2 == "lizard")...

# Refactored

def rock_wins?(move1, move2)
  move1 == "rock" && (move2 == "scissors" || move2 == "lizard")
end

if rock_wins?(move1, move2)...