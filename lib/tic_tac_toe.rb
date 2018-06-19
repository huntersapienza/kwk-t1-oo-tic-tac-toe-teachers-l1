# class TicTacToe
#   def initialize(board = nil)
#     @board = board || Array.new(9, " ")
#   end
 
# WIN_COMBINATIONS = [
#   [0,1,2],
#   [0,4,8],
#   [0,3,6],
#   [1,4,7],
#   [2,4,6],
#   [2,5,8],
#   [3,4,5],
#   [6,7,8]
# ]
 
# def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
# end
 
# def input_to_index(input)
#   input.to_i - 1
# end

# def move(board, index, character)
#   board[index] = character
# end

# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " ")
# end

# def valid_move?(board, index)
#   index.between?(0,8) && !position_taken?(board, index)
# end

# def turn(board)
#   character = current_player(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index, character)
#     # display_board(board)
#   else
#     until valid_move?(board, index)
#       puts "Please enter 1-9:"
#       input = gets.strip
#       index = input_to_index(input)
#     end
#     move(board, index, character)
#   end
#   display_board(board)
# end

# def turn_count(board)
#   counter = 0
#   board.each do |i|
#     if i == "X" || i == "O"
#       counter += 1
#     end
#   end
# return counter
# end

# def current_player(board)
#   counter = turn_count(board)
#   if counter % 2 == 0
#     return "X"
#   else
#     return "O"
#   end
# end

# # def current_player
# # turn_count % 2 == 0 ? "X" : "O"
# # end
 
#   # def turn_count
#   #   @board.count{|token| token == "X" || token == "O"}
#   # end
 
# def won?(board)
#   WIN_COMBINATIONS.each do |combo|
#     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
#       return combo
#     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
#       return combo
#     end
#   end
#   return false
# end

# def full?(board)
#   if board.include? " "
#     return false
#   else
#     return true
#   end
# end

# # draw
# def draw?(board)
#   if !won?(board) && full?(board)
#     return true
#   else
#     return false
#   end
# end

# # over
# def over?(board)
#   if draw?(board)==true || won?(board)!=false
#     return true
#   else
#     return false
#   end
# end

# # winner
# def winner(board)
#   if won?(board)
#     combo = won?(board)
#     winner_winner_chicken_dinner = combo[0]
#     if board[winner_winner_chicken_dinner] == "X"
#       return "X"
#     else
#       return "O"
#     end
#   end
# end

# # play
# def play(board)
#   while !over?(board)
#     turn(board)
#   end
#   if won?(board)
#     winner = winner(board)
#     puts "Congratulations #{winner}!"
#   elsif draw?(board)
#     puts "Cat's Game!"
#   end
# end

# end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
## input_to_index
def input_to_index(number)
  number = number.to_i
  index = number - 1
  return index
end
## move
def move(index, counter = "X")
  @board[index]=counter
end
# position_taken
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
#valid move FIX ME
def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
    true
  else
    false
  end
end

# turn
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
    turn
  end
end
# turn count
def turn_count
  count =0
  @board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
return count
end
# current player
def current_player
  count=turn_count
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end
# won
def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    p_1 = @board[win_index_1]
    p_2 = @board[win_index_2]
    p_3 = @board[win_index_3]
    if p_1 == "X" && p_2 == "X" && p_3 == "X"
      return win_combination
      winner = "X"
    elsif p_1 == "O" && p_2 == "O" && p_3 == "O"
      return win_combination
      winner = "O"
    else
      win_combination=0
    end
  end
  if win_combination=0
    return false
  end
end
# full
def full?
  if @board.include? " "
    return false
  else
    return true
  end
end
# draw
def draw?
  if won?
    return false
  else full?
    return true
  end
end
#over
def over?
  if won?
    return true
  elsif full?
    return true
  else
    return false
  end
end
#winner
def winner
  if won?
    win_combination = won?
    windex = win_combination[0]
    if @board[windex] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play
  puts "Welcome to Tic Tac Toe!"
  while !over?
    #turn_count = turn_count
    #value = current_player
    turn
  end
  if won?
    #win=winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end