
class Board
  attr_reader :board
  
  def initialize(fill = true)
    @board = Array.new(8) { Array.new(8) }
    populate if fill
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
    
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
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
  
  # def pieces
  #   @board.flatten.compact
  # end
  
  def find_king(color)
    (0..7).each do |row|
      (0..7).each do |col|
        if !(@board[row][col].nil?)
          if @board[row][col].color == color && @board[row][col].is_a?(King) 
            return [row, col]
          end
        end   
      end
    end
    nil
  end
  
  def swap_color(color)
    return :white if color == :black
    :black
  end
  
  def in_check?(color)
    kings_coords = find_king(color)
    #p "in_check is here"
    all_moves(swap_color(color)).include?(kings_coords)
  end
  
  def all_moves(color) 
    all_moves = []
    (0..7).each do |row|
      (0..7).each do |col|
        if !(@board[row][col].nil?) 
          if @board[row][col].color == color
            if !(@board[row][col].moves.nil?) 
              all_moves += @board[row][col].moves
            end
          end
        end   
      end
    end
    all_moves
  end
  
  def move(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    
    if @board[start_row][start_col].nil?
      raise "No piece there"
    elsif !(@board[start_row][start_col].valid_moves.include?(end_pos))
      raise "That piece can't go there, dude!"
    elsif @board[start_row][start_col].move_into_check?(end_pos)
      raise "You can't put yourself into check."
    end
    move!(start_pos, end_pos)
    # p "hi"
#     @board[end_row][end_col] = @board[start_row][start_col]
#     #@board[end_row][end_col].pos = end_pos
#     @board[end_row][end_col].set_pos(end_pos)
#     @board[start_row][start_col] = nil
  end
  
  def move!(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    @board[end_row][end_col] = @board[start_row][start_col]
    @board[end_row][end_col].set_pos(end_pos)
    @board[start_row][start_col] = nil
  end

  def dup
    duped_board = Board.new(false)
    (0..7).each do |row|
      (0..7).each do |col|
        old_spot = @board[row][col]
        if old_spot.nil?
          duped_board.board[row][col] = nil
        else
          duped_board.board[row][col] = 
          (old_spot.class).new(old_spot.color, [row, col], duped_board)
        end
      end
    end
    duped_board
  end
  
  def display
    @board.each do |row|
      p row
    end
  end
    
  def checkmate?(color)
    if in_check?(color)
      return all_moves(color).count == 0
    end
    false
  end
end