class Knight < SteppingPiece
  
  def initialize(color, pos, board_obj)
    super(color, pos, board_obj)
  end
  
  def directions
    [[1, 2], [1, -2], [2, 1],  [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
  end
  

end