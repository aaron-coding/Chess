# encoding: utf-8
class Queen < SlidingPiece
  
  # def initialize(color, pos, board)
  #   super(color, pos, board)
  # end
  #
  def directions
     [[1, 1], [-1, -1], [-1, 1], [1, -1],[1, 0], [0, 1], [-1, 0], [0, -1]]
  end
  
  def inspect
    color == :white ? "♕" : "♛"
  end
end