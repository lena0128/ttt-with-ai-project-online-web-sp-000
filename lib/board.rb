class Board
  attr_accessor :cells

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end

def valid_move?(position)
   position.to_i.between?(1,9) && !taken?(position)
end

  def update(position, player)
       self.cells[position.to_i-1] = player.token
  end

end
