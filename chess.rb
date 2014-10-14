class Game
end

class Board
  attr_reader :board
  
  def initialize
    @board = Array.new(8) {Array.new(8) {nil} }
    
  end
  
  def move(start_pos, end_pos)
#    start_pos =

  end
  
end

class Piece
  
  def initialize(type, color, pos, board_obj)
    @type = type
    @color = color
    @board_obj = board_obj
    @position = pos
  end
  
  def moves
    board_spots = []
    (0..7).each do |row|
      (0..7).each do |col|
        board_spots << [row,col]
      end
    end
    board_spots
  end
  
  def delete
    
  end
end

class SlidingPiece < Piece
  
  def initialize
    @direction
  end
  
  def moves
    all_moves = super
    piece_moves = []
    if @directions.include?(:hv)
      p "wow we're awesome"
      piece_moves += all_moves.select do |pos_move|
        (pos_move[0] == @pos[0] || pos_move[1] == @pos[1])
      end
    end
    
    if @directions.include?(:d)
      p "wow we're working"
      piece_moves += all_moves.select do |pos_move|
        (pos_move[0] - pos_move[1] == @pos[0] - @pos[1] ||
        pos_move[0] + pos_move[1] == @pos[0] + @pos[1]) 
        end
    end
    piece_moves.select{|p_move| p_move != @pos}
  end
end

class Rook < SlidingPiece

  def initialize
    @directions = [:hv]
    @pos = [0,0]
  end
  
  def moves
    super
  end
  
end

class Bishop < SlidingPiece
  
  def initialize
    @directions = [:d]
    @pos = [0,1]
  end
  
  def moves
    super
  end
  
end
  
class Queen < SlidingPiece
  
  def initialize
    @directions = [:d, :hv]
    @pos = [0,0]
  end
  
  def moves
    super
  end
  
  
end

class SteppingPiece < Piece

end


p Board.new.board
