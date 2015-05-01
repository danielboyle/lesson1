def say(msg)
  puts "=> #{msg}"
end

def display_separator
  puts "******************************************"
end

def intro
  display_separator
  say "Welcome to Blackjack!"
  display_separator
end

def get_name
  say "Please enter your name."
  puts
  player_name = gets.chomp
end

def display_name(player_name)
  display_separator
  say "Ok, #{player_name}, let's play!"
  display_separator
end

def shuffled_deck
  cards = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
  suits = [ "S", "H", "D", "C" ]

  deck = cards.product(suits) * 3
  deck.shuffle!
end

def calculate_total(hand)
  arr = hand.map { |card| card[0] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |card| card == "A" }.count.times do
    total -= 10 if total > 21
  end 

  total
end

def blackjack?(total)
  total == 21
end

def busted?(total)
  total > 21
end

def evaluate_hand(total)
  case 
  when blackjack?(total)
    display_separator
    say "Blackjack!"
    display_separator
    sleep 1.3
  when busted?(total)
    display_separator
    say "Busted!"
    display_separator
    sleep 1.3
  end
end

def player_turn(player_hand, player_total, deck)
  evaluate_hand(player_total)

  while player_total < 21
    say "Would you like to 1) hit or 2) stay?"
    hit_or_stay = gets.chomp

    if !['1', '2'].include?(hit_or_stay)
      say "ERROR. Please enter 1 or 2"
      next
    end

    if hit_or_stay == "2"
      say "You stay."
      puts
      break
    end

    sleep 1.3
    system "clear"
    new_card = deck.pop
    display_separator
    say "You got dealt the #{new_card}"
    display_separator
    player_hand << new_card
    player_total = calculate_total(player_hand)
    say "Your total is now #{player_total}"
    display_separator

    evaluate_hand(player_total)
  end

  player_total
end

def dealer_turn(dealer_hand, dealer_total, deck)
  sleep 1.5
  system "clear"

  display_separator
  say "Dealer turns over the #{dealer_hand[1]}"
  puts
  say "Dealer is now showing #{dealer_hand[0]} and #{dealer_hand[1]} for a total of #{dealer_total}"
  puts
  evaluate_hand(dealer_total)
  sleep 1.6

  while dealer_total < 17
    new_card = deck.pop
    display_separator
    say "Dealer dealt the #{new_card}"
    puts
    dealer_hand << new_card
    dealer_total = calculate_total(dealer_hand)
    say "Dealer total is now #{dealer_total}"
    puts
    sleep 1.6

    evaluate_hand(dealer_total)
  end

  dealer_total
end

def determine_winner(final_player_total, final_dealer_total, player_name)
  if final_player_total == final_dealer_total
    sleep 1.3
    system "clear"
    display_separator
    say "#{player_name}'s total is #{final_player_total}"
    puts
    say "The Dealer's total is #{final_dealer_total}"
    display_separator
    say "It's a push."
    puts
  elsif final_player_total > final_dealer_total
    sleep 1.3
    system "clear"
    display_separator
    say "#{player_name}'s total is #{final_player_total}"
    puts
    say "The Dealer's total is #{final_dealer_total}"
    display_separator
    say "You win, #{player_name}!"
    puts
  elsif final_player_total < final_dealer_total
    sleep 1.3
    system "clear"
    display_separator
    say "#{player_name}'s total is #{final_player_total}"
    puts
    say "The Dealer's total is #{final_dealer_total}"
    display_separator
    say "You lose, #{player_name}"
    puts
  end unless final_dealer_total > 21
end

def play_blackjack(player_name)
  deck = shuffled_deck

  loop do
    player_hand = []
    dealer_hand = []

    player_hand << deck.pop
    dealer_hand << deck.pop
    player_hand << deck.pop
    dealer_hand << deck.pop

    player_total = calculate_total(player_hand)
    dealer_total = calculate_total(dealer_hand)


    sleep 1.3
    system "clear"
    display_separator
    say "Dealing Cards..."
    puts
    say "You have #{player_hand[0]} and #{player_hand[1]} for a total of #{player_total}"
    puts
    say "The dealer is showing #{dealer_hand[0]}"
    puts 

    final_player_total = player_turn(player_hand, player_total, deck)

    if final_player_total <= 21
      final_dealer_total = dealer_turn(dealer_hand, dealer_total, deck)
      
      determine_winner(final_player_total, final_dealer_total, player_name)
    end

    say "Would you like to play another hand? (y/n)"
    play_again = gets.chomp
    if play_again.downcase != "y" 
      break
    else
      next
    end

  end 
end

intro
player_name = get_name
display_name(player_name)
play_blackjack(player_name)