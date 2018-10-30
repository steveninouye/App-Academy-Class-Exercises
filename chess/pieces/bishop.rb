require_relative "../modules/slideable"

class Bishop
  include SlidingPiece

  protected
  def move_dirs
    available_moves = move("diagonal")
  end
end
