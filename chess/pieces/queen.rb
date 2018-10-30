require_relative "../modules/slideable"

class Queen
  include SlidingPiece

  protected
  def move_dirs
    available_moves = move("both")
  end
end
