class Pawn < Piece
  
  def initialize(color, pos, board_obj)
    super(color, pos, board_obj)
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
