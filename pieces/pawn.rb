# encoding: utf-8
class Pawn < Piece
  
  def direction
    @color == :white ? -1 : 1
  end
   
  def at_home_row?
    @pos[0] == ((color == :white) ? 6 : 1)
  end

  def moves
    piece_moves = foward_steps + side_eating
    
    piece_moves.select! do |p_move| #Can't move off the board
      p_move[0] >= 0 &&
      p_move[0] <= 7 &&
      p_move[1] >= 0 &&
      p_move[1] <= 7
    end
    piece_moves
  end  
  
  def foward_steps
    forward_steps = []
    row, col = @pos
    one_step = [row + direction, col]
    
    if @board[one_step].nil? 
      forward_steps << one_step
    else 
      return [] # no forward steps if there is a piece in front of you.
    end
    two_step = [(row + (2 * direction)), col]
    
    if at_home_row? && @board[two_step].nil? 
      forward_steps += [two_step]
    end
    
    forward_steps
  end
  
  def side_eating
    side_moves = []
    row, col = @pos
    pos_eating = [[row + direction, col - 1], [row + direction, col + 1]]
    
    pos_eating.select do |pos_eat_space|
      unless @board[pos_eat_space].nil?
        @board[pos_eat_space].color != color
      end
    end
  end
    
    
    
    
    

  
  def inspect
    color == :white ? "♙" : "♟"
  end
    
end
