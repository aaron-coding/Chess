# encoding: utf-8
class Bishop < SlidingPiece
  #
  # def initialize(color, pos, board)
  #   super(color, pos, board)
  # end
  
  def directions
    [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end
  
  def inspect
    color == :white ? "♗" : "♝"
  end
  
end