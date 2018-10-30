require_relative "piece"
require_relative "display"
require_relative "pieces/null_piece"

class Board
  attr_reader :board

  def initialize
    @board = create_board
  end

  def create_board
    top = Array.new(2) {Array.new(8) {Piece.new}}
    mid = Array.new(4) {Array.new(8){ NullPiece.instance }}
    bottom = Array.new(2) {Array.new(8) {Piece.new}}
    top + mid + bottom
  end

  def move(start_pos, end_pos)
    begin
      piece = self[start_pos]
      self[end_pos] = piece
    rescue
      retry
    end
      self[start_pos] = NullPiece.instance
  end

  def valid_pos?(pos)
    self[pos]
  end

  # Syntactic Sugar for grid assignment for board
  def [](pos)
    row, col = pos
    raise "Invalid coordinate" unless (0..7).include?(row) && (0..7).include?(col)
    @board[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    raise "Invalid coordinate" unless (0..7).include?(row) && (0..7).include?(col)
    @board[row][col] = mark
  end

end
