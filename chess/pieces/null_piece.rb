require_relative "../piece.rb"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
    @symbol = "🀆"
  end

  def moves

  end

end
