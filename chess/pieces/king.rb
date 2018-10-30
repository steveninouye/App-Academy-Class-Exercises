require_relative "../piece"

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "♚"
  end



  protected
  def move_diffs

  end
end
