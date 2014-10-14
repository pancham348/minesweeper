require './tile'
require './board'
class Game 
  attr_accessor :board 
  def initialize
    @board = Board.new
  end
  
  def run
    until win? || lose?
      @board.display
      puts "Please choose a square: (put input in [x,y] format)"
      @user_input = gets.chomp
      if @user_input.start_with?("f")
        @user_input = @user_input[1..-1].split(',').map { |num| num.to_i}
        @board.board[@user_input[0]][@user_input[1]].flag
      else
        @user_input = @user_input.split(',').map { |num| num.to_i}
        @user_input.delete_if {|item| ('a'..'z').to_a.include?(item)}
        @board.board[@user_input[0]][@user_input[1]].reveal
      end
    end
    
    if win?
      puts "You win!"
    elsif lose?
      puts "You lose!"
    end
    
    puts "Game over!"
  end
  
  def win? 
    @board.board.flatten.all? { |tile| tile.revealed || tile.bomb }
  end
  
  def lose?
    @board.board.flatten.any? { |tile| tile.revealed && tile.bomb }
  end
end

game = Game.new
game.run




