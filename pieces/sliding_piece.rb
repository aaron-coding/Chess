class SlidingPiece < Piece
  
  def moves
    piece_moves = []
    directions.each do |delta|
      var_move = @pos.dup
      var_move[0] += delta[0]
      var_move[1] += delta[1]
      #var_move == 1, 0
      until (var_move[0] < 0 || var_move[0] > 7) ||
        (var_move[1] < 0 || var_move[1] > 7)    
        
        if board[var_move] != nil
           # p "we ran into another piece at #{var_move} running board[var_move]"
           break if board[var_move].color == color
           piece_moves << var_move.dup
           break
        end
        piece_moves << var_move.dup
        var_move[0] += delta[0]
        var_move[1] += delta[1]
      end  
    end
    
    piece_moves
    
  end
end



 