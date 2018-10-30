class Piece
  attr_reader :pos, :symbol, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def move_into_check?(end_pos)
    board = @board.dup
  end

  def dup
    self.class.new(@color,@board,@pos)
  end

 # return an array of places a Piece can move to
  def moves

  end
end
