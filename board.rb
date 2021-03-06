require_relative 'pieces'

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
  
  def pieces
    @board.flatten.compact
  end
  
  def find_king(color)
    pieces.each do | piece |
        return piece.pos if piece.color == color && piece.is_a?(King)
    end
    nil
  end
  
  def swap_color(color)
    return :white if color == :black
    :black
  end
  
  def in_check?(color)
    kings_coords = find_king(color)
    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(kings_coords)
    end
  end
  
  def all_moves(color) 
    all_moves = []
    pieces.each do |piece|
      if piece.color == color  
        all_moves += piece.valid_moves  
      end
    end
    all_moves
  end
  
  def move(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    
    if @board[start_row][start_col].nil?
      raise ChessError.new("No piece there")
    elsif !(@board[start_row][start_col].valid_moves.include?(end_pos))
      raise ChessError.new("That piece can't go there, sorry!")
    elsif @board[start_row][start_col].move_into_check?(end_pos)
      raise ChessError.new("You can't put yourself into check.")
    end
    move!(start_pos, end_pos)

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
    puts "\n\n"
    print "    0   1   2   3   4   5   6   7"
    @board.each_with_index do |row, idx|
      puts "\n   ________________________________"
      print "#{idx} | "
      row.each do |piece|
        print "#{piece.inspect} | " unless piece.nil?
        print "  | " if piece.nil?
      end 
    end
      puts "\n   ________________________________"
  end
    
  def checkmate?(color)
    return false unless in_check?(color)
    all_moves(color).count == 0
  end
end