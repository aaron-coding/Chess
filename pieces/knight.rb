# encoding: utf-8
class Knight < SteppingPiece
    #
  # def initialize(color, pos, board)
  #   super(color, pos, board)
  # end
  #
  def directions
    [[1, 2], [1, -2], [2, 1],  [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
  end
  
  def inspect
    color == :white ? "♘" : "♞"
  end
end