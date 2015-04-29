# Simple RPS Game
# Daniel Boyle

CHOICES = { "r" => "Rock", "p" => "Paper", "s" => "Scissors" }
ties = 0
player_wins = 0
computer_wins = 0

def winning_message(winning_choice)
  case winning_choice
  when 'r'
    puts "Rock smashes scissors."
  when 'p'
    puts "Paper covers rock."
  when 's'
    puts "Scissors cuts paper."
  end
end

# Game Intro
puts "------- Welcome to Rock-Paper-Scissors -------\n
----------- Please enjoy the game! -----------"

loop do
  # Get picks from player and computer
  begin
    puts "Please choose: ( r, p, s )"
    player_pick = gets.chomp.downcase
  end until CHOICES.keys.include?(player_pick)
    
  computer_pick = CHOICES.keys.sample

  # Tie
  if player_pick == computer_pick
    puts "Computer picked #{CHOICES[computer_pick]} too. It's a tie."
    ties += 1
  # Player wins
  elsif ( player_pick == 'r' && computer_pick == 's' ) || ( player_pick == 'p' && computer_pick == 'r' ) || ( player_pick == 's' && computer_pick == 'p' )
    puts "Computer picked #{CHOICES[computer_pick]}"
    winning_message(player_pick)
    puts "You win!!!"
    player_wins += 1
  # Computer wins
  else
    puts "Computer picked #{CHOICES[computer_pick]}"
    winning_message(computer_pick)
    puts "You lose :("
    computer_wins += 1
  end

  puts "Scoreboard // Player: #{player_wins} | Computer: #{computer_wins} | Ties: #{ties}"
  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'

end