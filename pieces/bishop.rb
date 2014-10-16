# encoding: utf-8
class Bishop < SlidingPiece
  def directions
    [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end
  
  def inspect
    color == :white ? "♗" : "♝"
  end
  
end