class Piece
  attr_reader :pos, :symbol, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

 # return an array of places a Piece can move to
  def moves

  end
end
