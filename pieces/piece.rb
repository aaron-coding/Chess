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
  
  def valid_moves
    
  end
  
  def move_into_check?(new_pos)
    in_check = false
    # moves.each do |coord|
    dupped_board = board.dup
    p "pos.dup #{@pos.dup} n_pos #{new_pos}"
    dupped_board.move!(@pos.dup, new_pos)
    in_check = true if dupped_board.in_check?(color)
    in_check
  end
      

end
