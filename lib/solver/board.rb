module Solver
  class Board
    def initialize(dimx,dimy)
      @width = dimx
      @height = dimy
      @board=Array.new(dimx * dimy){0}
      @nb_piece=0
    end
    def add(x,y,w,h)
      piece_id = @nb_piece + 1
      # check if piece not go over the right side
      return nil if (x+w) > @width
      # check if piece not go over the bottom
      return nil if (y+h) > @height
      position = x + (y*@width)
      pos_index = (0...h).collect{|line_itt| 
	(position...position+w).collect{|line0| 
          line0 + @width * line_itt}
      }.flatten
      pos_index.each{|i|
        return nil if @board[i] != 0
      } 
      pos_index.each{|i| @board[i]=piece_id }
      return (@nb_piece = piece_id)
    end
    def move(piece,dir)
    end
    def pos
    end
  end
end
