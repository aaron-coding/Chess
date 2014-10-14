class King < SteppingPiece
  
  def directions
    [[1, 1], [-1, -1], [-1, 1], [1, -1],[1, 0], [0, 1], [-1, 0], [0, -1]]
  end
  
  def inspect
    "K"
  end
end


