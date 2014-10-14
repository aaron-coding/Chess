class Game
end

class Board
  attr_reader :board
  
  def initialize
    @board = Array.new(8) {Array.new(8) {nil} }
    populate
  end
  
  def populate
    (0..7).each do |idx|
      @board[1][idx] = Pawn.new(:black, [1, idx], self)   
      @board[6][idx] = Pawn.new(:white, [6, idx], self)   
    end
  end
  
  def move(start_pos, end_pos)

  end
  
end

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
  
  def initialize
    @direction
  end
  
  def moves
    all_moves = super
    
    piece_moves = []
    if @directions.include?(:a)
      piece_moves += all_moves.select do |pos_move|
        (@pos[0] - pos_move[0]).between?(-1,1) && 
        (@pos[1] - pos_move[1]).between?(-1,1)
      end
    end
    
    if @directions.include?(:kn)
      piece_moves += all_moves.select do |pos_move|
        ((@pos[0] - pos_move[0]).abs == 1 && (@pos[1] - pos_move[1]).abs == 2) ||
        ((@pos[0] - pos_move[0]).abs == 2 && (@pos[1] - pos_move[1]).abs == 1)
      end
    end
    

    piece_moves.select{|p_move| p_move != @pos}
  end
end

class King < SteppingPiece
  
  def initialize
    super
    @directions = [:a]
    @pos = [1,1]
  end
  
  def moves
    super
  end
  
end

class Knight < SteppingPiece
  
  def initialize
    @directions = [:kn]
    @pos = [4,4]
  end
  
  def moves
    super
  end
  
end

class Pawn < Piece
  
  def initialize(color, pos, board_obj)
    super(color, pos, board_obj)
    # @color = :black
  end
  
  def moves
    all_moves = super
    piece_moves = []
    
    if @color == :white
      piece_moves += all_moves.select do |pos_move|
        move_1 = (pos_move == [@pos[0] - 1, @pos[1]] )
        if @pos[0] == 6 
          move_1 || pos_move == [@pos[0] - 2, @pos[1]] 
        else
          move_1
        end
      end
    end
    
    if @color == :black
      piece_moves += all_moves.select do |pos_move|
        move_1 = (pos_move == [@pos[0] + 1, @pos[1]] )
        if @pos[0] == 1 
          move_1 || pos_move == [@pos[0] + 2, @pos[1]] 
        else
          move_1
        end
      end
    end
      piece_moves
    end
  
end
