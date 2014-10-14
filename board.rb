class Board
  BOMBS = 8
  
  attr_accessor :board
  
  def initialize
    @board = Array.new(9) { Array.new(9) }
    populate_board
    # @empty_indices = [0, 1, 2, 3, 4, 5, 6, 7, 8].product([0, 1, 2, 3, 4, 5, 6,  7, 8]) - @bomb_indices
  end
  
  
  
  def populate_board
    # @bomb_indices = choose_bomb_indices

    @board.each_index do |i|
      @board.each_index do |j|
        @board[i][j] = Tile.new(self, [i,j])
        # if @bomb_indices.include?([i , j])
        #   @board[i][j].bomb = true
        # end
      end
    end
    place_bombs
  end
  
  def display
    @board.each do |row|
      row_display = row.map { |tile| tile.mark }
      p row_display.map { |mark| mark.to_s.rjust(2) }
    end
  end
  
  def [](pos)
    @board[pos.first][pos.last]
  end
  
  
  
  # def choose_bomb_indices
  #   bomb_indices = []
  #
  #   while bomb_indices.length < BOMBS
  #     index = [rand(9), rand(9)]
  #
  #     unless bomb_indices.include?(index)
  #       bomb_indices << index
  #     end
  #   end
  #   bomb_indices
  # end
  
  def place_bombs
    @board.flatten.sample(BOMBS).each do |tile|
      puts "bomb here"
      tile.bomb = true
    end 
  end
  
  
  
  # def reveal(pos)
  #   if @board[pos[0]][pos[1]].flagged
  #     "You can't access that position"
  #   else
  #     @board[pos[0]][pos[1]].revealed = true
  #   end
  #   reveal_safe_zone(pos) if adjacent_bombs(pos).length == 0
  # end
  #
  # def reveal_safe_zone(pos)
  #   @board[pos[0]][pos[1]].revealed = true
  #   (adjacent_coords - adjacent_bombs).each do |pos|
  #     unless adjacent_bombs(pos).length > 1
  #       reveal_safe_zone(pos)
  #     end
  #   end
  # end
  

end