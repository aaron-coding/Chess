class SlidingPiece < Piece
  
  def initialize(color, pos, board_obj)
    super(color, pos, board_obj)
  end
  
  def moves
    piece_moves = []
    directions.each do |delta|
      temp_move = @pos.dup
      until (temp_move[0] < 0 || temp_move[0] > 7) || 
        (temp_move[1] < 0 || temp_move[1] > 7)  
        piece_moves << temp_move.dup
        temp_move[0] += delta[0]
        temp_move[1] += delta[1]
      end  
    end
    piece_moves.select{|p_move| p_move != @pos}
    
  end
end



 