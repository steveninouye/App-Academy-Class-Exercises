require_relative "../piece"
require_relative "../modules/stepable"

class Knight < Piece
  include SteppingPiece

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "♞"
  end

  protected
  def move_diffs

  end
end
