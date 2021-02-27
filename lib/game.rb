class Game
  attr_accessor :board, :player_1, :player_2, :user_input

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
         @board.cells[win_combination[0]] == @board.cells[win_combination[2]] &&
         @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
         @board.taken?(win_combination[0]+1) #user-input between?(1-9)
        return win_combination
      end
     end
   return false
  end

def draw?
  @board.full? && !won? ? true : false
end

def over?
  (draw? || won?) ? true : false
end

  def winner
    if ( !won? && !over? && !draw? )
      return nil # If this line-> @board.taken?(win_combination[0]+1) not included in won?, this will return " "
  elsif win = won?
      return @board.cells[win[0]]
  end
end

def turn
  puts "Please enter 1-9:"
  @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
       @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
       @board.display
       turn
    end
  @board.display
end

def play
   turn until over?
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
