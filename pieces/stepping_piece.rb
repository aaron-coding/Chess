 

class SteppingPiece < Piece
  
  def moves
    piece_moves = []

    directions.each do |delta|
      temp_move = @pos.dup
      temp_move[0] += delta[0]
      temp_move[1] += delta[1]
      piece_moves << temp_move.dup
    end    
    
    piece_moves.select do |p_move| 
      p_move[0] >= 0 && 
      p_move[0] <= 7 && 
      p_move[1] >= 0 && 
      p_move[1] <= 7
    end
    
  end
end


