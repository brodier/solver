module Solver
  class Board
    attr_reader :nb_pieces
    def initialize(dimx,dimy)
      @width = dimx
      @height = dimy
      @board=Array.new(dimx * dimy)
      @nb_pieces=0
    end
    
    def add(x,y,w,h)
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
        return nil unless @board[i].nil?
      } 
      pos_index.each{|i| @board[i]=@nb_pieces }
      @nb_pieces += 1
      return @nb_pieces-1
    end

    def up_op ; -@width ; end
    def rigth_op ; 1 ; end
    def down_op ; @width ; end
    def left_op ; -1 ; end
    def move(piece,dir)
      piece_pos = @board.index(piece)
      check_method = ('check_' + dir).to_sym
      if send(check_method,piece_pos)
        @board.each_index do |i|
          if @board[i] == piece
            @board[i+send((dir + '_op').to_sym)] = @nb_pieces+1
            @board[i] = nil
          end
        end
        @board.each_index do |i|
          @board[i] = piece if @board[i] == @nb_pieces+1
        end
      end
    end
    
    # on first line or upper position is occupied by another piece 
    # then move up is impossible for the piece at this position
    def check_up(i) 
      !(i < @width || (@board[i-@width] && @board[i-@width] != @board[i]))
    end

    # on last column or rigther position is occupied by another piece
    # then move rigth is impossible for the piece at this position
    def check_rigth(i)
      !(((i+1) % @width) == 0 || (@board[i+1] && @board[i+1] != @board[i]))
    end

    # on last line or bottom position is occupied by another piece
    # then move down is impossible for the piece at this position
    def check_down(i)
     !(i+@width > @board.size || (@board[i+@width] && @board[i+@width] != @board[i]))
    end

    # on first column or lefter position is occupied by another piece
    # then move left is impossible for the piece at this position
    def check_left(i)
      !(i % @width == 0 || (@board[i-1] && @board[i-1] != @board[i]))
    end

    def possible_moves
      pmoves = Array.new(@nb_pieces){[:up,:down,:left,:rigth]}
      @board.each_index do |i|
        if @board[i]
          pmoves[@board[i]].delete(:up)    unless check_up(i)
          pmoves[@board[i]].delete(:rigth) unless check_rigth(i)
          pmoves[@board[i]].delete(:down)  unless check_down(i)
          pmoves[@board[i]].delete(:left)  unless check_left(i)
        end
      end
      pmove_hash = {}
      pmoves.map.with_index{|moves,i| 
        [i,moves] unless moves.empty?
      }.compact.each{|k,v| pmove_hash[k]=v}
      pmove_hash 
    end
    
    def board_pos
      return @board, @width, @height
    end
  end
end
