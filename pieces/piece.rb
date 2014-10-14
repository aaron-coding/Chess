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
  
  def delete
    
  end
  

end
