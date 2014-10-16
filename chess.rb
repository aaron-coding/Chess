require './pieces'
require './board'

class ChessError < RuntimeError
end

class NotYourPiece < ChessError
end

class Game
  attr_reader :board
  def initialize(player1 = "NoName1", player2 = "NoName2")
    @board = Board.new
    @white_player = Player.new(player1, :white)
    @black_player = Player.new(player2, :black)
    @current_player = @white_player
    play
  end

  def swap_player
    @current_player = @current_player == @white_player ? @black_player : @white_player
  end

  def play

    until @board.checkmate?(:white) || @board.checkmate?(:black)
    @board.display
      begin
        if @board.in_check?(@current_player.color)
          puts "#{@current_player.name} is in check!"
        end
        
        input = @current_player.gets_input
#        @board[input[0]].valid_moves
        if @board[input[0]] && @board[input[0]].color != @current_player.color
          raise NotYourPiece.new("Pick your own piece")
        end
        
        @board.move(input[0], input[1])
        
      rescue ChessError => e
        puts "ErrorType: #{e.class}"
        puts e.message
        retry
      end  
      swap_player
      
    end
  end
end


class Player
  
  attr_reader :name, :color
  
  def initialize(name, color)
    @name = name
    @color = color
    
  end
  
  def gets_input
    
    begin
      puts "#{@name} please select a #{color} piece, eg. 00 = row 0, col 0"
      input1 = gets.chomp.split("").map(&:to_i) #[1, 1]
      raise "Please choose 2 numbers" if input1.count != 2
    rescue => e
      puts e.message
      retry
    end
    
    begin
      puts "Please where the piece will go, eg. 00 = row 0, col 0"
      input2 = gets.chomp.split("").map(&:to_i)
      raise "Please choose 2 numbers" if input2.count != 2
    rescue => e
      puts e.message
      retry
    end
    [input1, input2]  
  end
  
  
end