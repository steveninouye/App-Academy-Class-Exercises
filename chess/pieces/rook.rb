require_relative "../modules/slideable"

class Rook
  include SlidingPiece

  protected
  def move_dirs
    available_moves = move("horizontal")
  end
end
