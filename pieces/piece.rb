class Piece  
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(color, pos, board)
    @color = color
    @board = board
    @pos = pos
  end
  
  def moves
  end 
  
  def set_pos(new_pos)
    @pos = new_pos[0], new_pos[1]
  end
  
  def valid_moves
    moves.select! do |move|
      move_into_check?(move) == false
    end
  end
  
  def move_into_check?(new_pos)
    dupped_board = board.dup
    dupped_board.move!(@pos.dup, new_pos)
    dupped_board.in_check?(color)
  end
      

end
