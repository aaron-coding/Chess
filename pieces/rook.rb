class Rook < SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
  end
  

  def directions
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end
    
   def inspect
     return "R"
   end
end
