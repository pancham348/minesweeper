require './board'
class Tile
  
  attr_accessor :bomb, :revealed, :flagged
  
  def initialize(board, pos)
    @bomb = false
    @revealed = false
    @flagged = false
    @board = board
    @pos = pos
  end  
  
  def neighbors
    i, j = @pos[0], @pos[1]
    
    neighbors = [i-1, i, i+1].product([j-1, j, j+1]).select do |arr| 
      (arr[0]<= 8 && arr[0] >= 0) && (arr[1] <= 8 && arr[1] >= 0) 
    end
    neighbors.delete([i, j])
    neighbors
  end
  
  def reveal
    unless @flagged
      @revealed = true
      if self.adjacent_bombs.empty?
        p "#{@pos} is a safe space"
        self.neighbors.each { |neighbor| @board.board[neighbor[0]][neighbor[1]].reveal unless @board.board[neighbor[0]][neighbor[1]].revealed }
      else
        p "#{@pos} is a dangerous space with bombs at #{adjacent_bombs}"
      end
    end
  end
  
  def flag
    if @flagged
      @flagged = false
    else
      @flagged = true
    end
  end
  
  def adjacent_bombs
    neighbors.select { |coord| @board.board[coord[0]][coord[1]].bomb }
  end
  
  def mark
    if @flagged
      return 'F'
    end
    
    if @revealed
      if @bomb == false
        return self.adjacent_bombs.length
      else
        return 'b'
      end
    else
      return '*'
    end
           
  end

end

# b = Board.new
# t = Tile.new(b,[8,8])
# p t.neighbors