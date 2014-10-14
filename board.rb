
class Board
  attr_reader :board
  
  def initialize
    @board = Array.new(8) {Array.new(8) {nil} }
    # @board[0][0] = Rook.new(:black, [0, 0], self)
    # @board[4][0] = Pawn.new(:black, [4, 0], self)
    # @board[0][3] = Queen.new(:white, [0, 3], self)
    populate
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def populate
    #populate pawns
    (0..7).each do |idx|
      @board[1][idx] = Pawn.new(:black, [1, idx], self)   
      @board[6][idx] = Pawn.new(:white, [6, idx], self)   
    end
    
    #populate rooks
      @board[0][0] = Rook.new(:black, [0, 0], self)   
      @board[0][7] = Rook.new(:black, [0, 7], self)   
      @board[7][0] = Rook.new(:white, [7, 0], self)   
      @board[7][7] = Rook.new(:white, [7, 7], self)   
      
    #populate Knight
      @board[0][1] = Knight.new(:black, [0, 1], self)   
      @board[0][6] = Knight.new(:black, [0, 6], self)   
      @board[7][1] = Knight.new(:white, [7, 1], self)   
      @board[7][6] = Knight.new(:white, [7, 6], self)   
    
    #populate Bishop
      @board[0][2] = Bishop.new(:black, [0, 2], self)   
      @board[0][5] = Bishop.new(:black, [0, 5], self)   
      @board[7][2] = Bishop.new(:white, [7, 2], self)   
      @board[7][5] = Bishop.new(:white, [7, 5], self)   
    
    #populate Queen
      @board[0][3] = Queen.new(:black, [0, 3], self)   
      @board[7][3] = Queen.new(:white, [7, 3], self)   
  
    #populate King
      @board[0][4] = King.new(:black, [0, 4], self)   
      @board[7][4] = King.new(:white, [7, 4], self)      
  end
  
  def move(start_pos, end_pos)

  end
  
  def on_board?(coords)
    
  end
  
end