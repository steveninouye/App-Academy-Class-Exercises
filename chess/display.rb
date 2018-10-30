require "colorize"
require_relative "cursor"
require_relative "board"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.board.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |col, col_idx|
        pos = [row_idx, col_idx]
        if @board[pos] == @cursor.cursor_pos
          print "X"
        elsif col.is_a?(NullPiece)
          print "-"
        elsif col.is_a?(Piece)
          print "P"
        end
      end
      print "\n"
    end
  end
end
