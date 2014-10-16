# encoding: utf-8
class Knight < SteppingPiece
  def directions
    [[1, 2], [1, -2], [2, 1],  [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
  end
  
  def inspect
    color == :white ? "♘" : "♞"
  end
end