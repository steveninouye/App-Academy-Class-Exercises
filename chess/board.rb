require_relative "piece.rb"

class Board

  def initialize
    @board = create_board
  end

  def create_board
    Array.new(8) {Array.new(8){ [Piece.new]}}
  end

  def move(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos

    piece = @board[start_row][start_col]
    @board[end_row][end_col] = piece

    @board[start_row][start_col] = nil

  end

  # Syntactic Sugar for grid assignment for board
  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, mark)
    @board[row][col] = mark
  end

end
