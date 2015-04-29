# Tic Tac Toe Game
# Daniel Boyle

def intro
  puts
  puts "********** Welcome to Tic Tac Toe **********"
  puts "******** Player = X || Computer = O ********"
  puts 
  puts "***** Choose a number from 1 to 9 that *****"
  puts "***** corresponds to the numbers on the ****"
  puts "************ board you see here ************"
  puts 
  instruction_board
  puts
  puts "********* Are you ready to play ? **********"
  puts
  puts "****************** y/n *********************"
  puts
  loop do
    input = gets.chomp.downcase
    break if input == "y"
  end 
end

def instruction_board
  puts "                 1 | 2 | 3 "
  puts "                ---+---+---"
  puts "                 4 | 5 | 6 "
  puts "                ---+---+---"
  puts "                 7 | 8 | 9 "
end

def initialize_board
  board = {}
  (1..9).each { |position| board[position] = ' ' }
  board
end

def empty_squares(board)
  board.keys.select { |square| board[square] == ' ' }
end

def player_selects_square(board)
  begin
    puts "Choose a square from 1 to 9 to mark that square"
    position = gets.chomp.to_i
  end until empty_squares(board).include?(position)
  board[position] = "X"
end

def computer_selects_square(board)
  position = empty_squares(board).sample
  board[position] = "O"
end

def all_squares_filled?(board)
  empty_squares(board) == []
end

def check_winner(board)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count("X") == 3
    return "Computer" if board.values_at(*line).count("O") == 3
  end
  nil
end

def announce_winner(winner)
  puts "                #{winner} won!"
  puts
end

def draw_board(board)
  system 'clear'
  puts
  puts "                 #{board[1]} | #{board[2]} | #{board[3]} "
  puts "                ---+---+---"
  puts "                 #{board[4]} | #{board[5]} | #{board[6]} "
  puts "                ---+---+---"
  puts "                 #{board[7]} | #{board[8]} | #{board[9]} "
  puts
end

intro
loop do
  board = initialize_board
  draw_board(board)
  begin
    player_selects_square(board)
    draw_board(board)
    winner = check_winner(board)
    computer_selects_square(board)
    draw_board(board)
    winner = check_winner(board)
  end until winner || all_squares_filled?(board)
  if winner
    announce_winner(winner)
  else
    puts "It's a tie"
  end
  puts "Would you like to play again? (y/n)"
  break if gets.chomp != "y"
end