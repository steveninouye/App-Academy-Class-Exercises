# require_relative "piece"
require_relative "display"
require_relative "pieces/null_piece"
require_relative "pieces/pawn"
require_relative "pieces/rook"
require_relative "pieces/knight"
require_relative "pieces/bishop"
require_relative "pieces/queen"
require_relative "pieces/king"

class Board
  attr_reader :board

  BASE_PIECES = {
    0 => Rook,
    1 => Knight,
    2 => Bishop,
    5 => Bishop,
    6 => Knight,
    7 => Rook
  }

  BLACK_ROYALTY = {
    3 => King,
    4 => Queen
  }

  WHITE_ROYALTY = {
    4 => Queen,
    3 => King
  }

  def initialize(board=create_board)
    @board = board
  end

  def in_check?(color)
    find_king(color)
    enemy_color = color == :white ? :black : :white
  end

  def find_king(color)
    @board.each.with_index do |r, ridx|
      row.each_with_index do |c,cidx|
        king_pos = [ridx,cidx] if c.is_a?(King) && c.color == color}
      end
    end
    king_pos
  end



  def create_board

    # starting_board << Array.new(1) {Array.new(8) {Piece.new}}
    starting_board = Array.new(1) {Array.new(8) do |i|
      piece_class = BASE_PIECES.key?(i) ? BASE_PIECES[i] : BLACK_ROYALTY[i]
      piece_class.new(:black, @board, [0,i])
    end }
    starting_board += Array.new(1) {Array.new(8) {|i| Pawn.new(:black, @board, [1,i])}}
    starting_board += Array.new(4) {Array.new(8){ NullPiece.instance }}
    starting_board += Array.new(1) {Array.new(8) {|i| Pawn.new(:green, @board, [6,i])}}
    starting_board += Array.new(1) {Array.new(8) do |i|
      piece_class = BASE_PIECES.key?(i) ? BASE_PIECES[i] : WHITE_ROYALTY[i]
      piece_class.new(:green, @board, [7,i])
    end }

    starting_board
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

  def dup
    Board.new(@board.map {|row| row.map { |pc| pc.class != NullPiece ? pc.dup : pc }})
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
