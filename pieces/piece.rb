class Piece  
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(color, pos, board)
    @color = color
    @board = board
    @pos = pos
  end
  
  
  def moves
    board_spots = []
    (0..7).each do |row|
      (0..7).each do |col|
        board_spots << [row, col]
      end
    end
    board_spots
  end
  
  def valid_moves
    
  end
  
  def move_into_check?(new_pos)
    in_check = false
    # moves.each do |coord|
    dupped_board = board.dup
    dupped_board.move(@pos, new_pos)
    in_check = true if dupped_board.in_check?(color)
    in_check
  end
      

end
