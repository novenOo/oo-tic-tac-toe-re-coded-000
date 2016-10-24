class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end
 def input_to_index(position)
  position .to_i-1
 end
 def move(position,value)
   index=input_to_index(position)
   @board[index]=value
 end

def position_taken?(position)
 if @board[position]== " " || @board[position]== "" || @board[position]== nil
   return false
 elsif @board[position]== "X" || @board[position]== "O"
   return true
   end
 end

   def valid_move?(position)
     if position.to_i.between?(1,9)&&!position_taken?(position.to_i-1)
       true
     else
       false
     end
   end
   def turn
     puts "Please enter 1-9:"
     position=gets.strip
     if valid_move?(position)
       move(position,current_player)
       display_board
     else
       turn
     end
   end
   def current_player
     if turn_count%2==0
        return "X"
   else
     return "O"
     end
   end
   def turn_count
    count=0
    @board.each do |item|
    if item=="X" || item=="O"
    count+=1
    end
    end
    return count
    end
    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]]==@board[combo[1]]&&
        @board[combo[1]]==@board[combo[2]]&&
        position_taken?(combo[0])
      end
    end
    def full?
      @board.all? do |itm|
        itm=="X"||itm=="O"
      end
    end
    def draw?
    !won?&&full?
    end
    def over?
      draw?||won?
    end
    def winner
      combo=won?
      if combo
        return @board[combo[0]]
      end
    end
    def play
      while !over?
      turn
    end
      if won?
    puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
end
end
