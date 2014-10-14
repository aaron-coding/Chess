class Piece  
  def initialize(color, pos, board_obj)
    @color = color
    @board_obj = board_obj
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
