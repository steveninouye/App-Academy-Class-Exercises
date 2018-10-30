require_relative "../modules/slideable"
require_relative "../piece"

class Bishop < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "♝"
  end

  protected
  def move_dirs
    available_moves = move("diagonal")
  end
end
