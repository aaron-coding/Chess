class SlidingPiece < Piece
  
  def moves
    piece_moves = []
    directions.each do |delta|
      temp_move = @pos.dup
      until (temp_move[0] < 0 || temp_move[0] > 7) || 
        (temp_move[1] < 0 || temp_move[1] > 7)    
        piece_moves << temp_move.dup
        temp_move[0] += delta[0]
        temp_move[1] += delta[1]
        if !(board[temp_move].nil?)
          break if board[temp_move].color == color   
          piece_moves << temp_move.dup
          break
        end
      end  
    end
    piece_moves.select{|p_move| p_move != @pos}
    
  end
end



 