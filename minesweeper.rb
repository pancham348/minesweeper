
class Board
  BOMBS = 8
  def initialize
    @board = Array.new(9) { Array.new(9) }
    populate_board
  end
  
  def populate_board
    bomb_indices = choose_bomb_indices

    @board.each_index do |i|
      @board.each_index do |j|
        @board[i][j] = Tile.new(self)
        if bomb_indices.include?([i , j])
          @board[i][j].bomb = true 
        end
      end
    end
    
  end
  
  def display
    @board.each do |row|
      row_display = row.map { |tile| tile.mark }
      p row_display
    end
  end
  
  def choose_bomb_indices
    bomb_indices = []
    
    while bomb_indices.length < BOMBS
      index = [rand(9), rand(9)]
      
      unless bomb_indices.include?(index)
        bomb_indices << index
      end
    end
    bomb_indices
  end
  
  
end

class Tile
  
  attr_accessor :bomb
  def initialize(board, bomb = false)
    @bomb = bomb
    @revealed
    @flagged
    @board = board
  end
  
  def mark
    if @bomb == false
      return '_'
    else
      return 'b'
    end      
  end
end

board = Board.new
board.display



