require_relative 'board'

class Game
  attr_reader :board
  def initialize(player1 = "NoName1", player2 = "NoName2")
    @board = Board.new
    @white_player = Player.new(player1, :white)
    @black_player = Player.new(player2, :black)
    @current_player = @white_player
   # play
  end

  def swap_player
    @current_player = @current_player == @white_player ? @black_player : @white_player
  end

  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
    @board.display
    if @board.in_check?(@current_player.color)
      puts "#{@current_player.name} is in check!"
    end 
      begin
        from_piece = @current_player.gets_from_piece
        if @board[from_piece].nil?
          raise ChessError.new("That space is empty")
        elsif @board[from_piece].color != @current_player.color
          raise NotYourPiece.new("Pick your own piece")
        end  
        
        to_piece = @current_player.gets_to_piece
        
        
          
        @board.move(from_piece, to_piece)
      rescue ChessError => e
        @board.display
        puts "ErrorType: #{e.class}"
        puts e.message
        retry
      end  
      swap_player
      
    end
    @board.display
    p "Checkmate!"
  end
end


class Player
  attr_reader :name, :color
  def initialize(name, color)
    @name = name
    @color = color
  end
  
  def gets_from_piece
    begin
      puts "#{@name} please select a #{color} piece, eg. 00 = row 0, col 0"
      from_piece = gets.chomp.split("").map(&:to_i) #[1, 1]
      raise "Please choose 2 numbers" if from_piece.count != 2
    rescue => e
      puts e.message
      retry
    end
    from_piece  
  end
  
  def gets_to_piece
    begin
      puts "Please where the piece will go, eg. 00 = row 0, col 0"
      to_piece = gets.chomp.split("").map(&:to_i)
      raise ChessError.new("Please choose 2 numbers") if to_piece.count != 2
    rescue => e
      puts "ErrorType: #{e.class}"
      puts e.message
      retry
    end
    to_piece
  end
end


class ChessError < RuntimeError
end

class NotYourPiece < ChessError
end
