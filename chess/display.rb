require "colorize"
require_relative "cursor"
require_relative "board"

class Display

  # PIECES_SYMBOL = {
  #   :king => ""
  #   }

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system ('clear')
    @board.board.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |col, col_idx|
        pos = [row_idx, col_idx]
        piece = @board[pos]
        sym = piece.symbol
        color = piece.color
        sym = @cursor.cursor_pos == pos ? sym.colorize(:color => :red) : sym.colorize(:color => color)
        print " #{sym}"
      end
      print "\n"
    end
    cursor_pos = @cursor.get_input
    render
  end
end
