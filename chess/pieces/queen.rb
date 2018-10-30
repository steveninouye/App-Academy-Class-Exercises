require_relative "../modules/slideable"
require_relative "../piece"

class Queen < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "♛"
  end

  protected
  def move_dirs
    available_moves = move("both")
  end
end
