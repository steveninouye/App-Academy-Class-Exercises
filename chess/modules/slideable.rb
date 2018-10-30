module SlidingPiece

  def moves(dirs)
    case dirs
    when "diagonal"
      diagonal_dirs
    when "horizontal"
      horizontal_dirs
    when "both"
      horizontal_dirs + diagonal_dirs
    end
  end

  def horizontal_dirs
    horizontal_moves = []
    opposing_color = self.color == :white ? :black : :white

    row, col = pos
    row += 1
    until row > 7 || !@board[row,col].is_a(NullPiece)
      horizontal_moves << [row, col]
      row += 1
    end
    horizontal_moves << [row, col] if row > 7 && @board[row,col].color == opposing_color

    row, col = pos
    row -= 1
    until row < 0 || !@board[row,col].is_a(NullPiece)
      horizontal_moves << [row, col]
      row -= 1
    end
    horizontal_moves << [row, col] if row < 0 && @board[row,col].color == opposing_color

    row, col = pos
    col -= 1
    until col < 0 || !@board[row,col].is_a(NullPiece)
      horizontal_moves << [row, col]
      col -= 1
    end
    horizontal_moves << [row, col] if col < 0 && @board[row,col].color == opposing_color

    row, col = pos
    col += 1
    until col > 7 || !@board[row,col].is_a(NullPiece)
      horizontal_moves << [row, col]
      col += 1
    end
    horizontal_moves << [row, col] if col > 7  && @board[row,col].color == opposing_color

    horizontal_moves
  end

  def diagonal_dirs
    diagonal_moves = []
    opposing_color = self.color == :white ? :black : :white

    row, col = pos
    row += 1
    col += 1
    until row > 7 || col > 7 || !@board[row,col].is_a(NullPiece)
      diagonal_moves << [row, col]
      row += 1
      col += 1
    end
    diagonal_moves << [row, col] if (row > 7 || col > 7)  && @board[row,col].color == opposing_color

    row, col = pos
    row -= 1
    col -= 1
    until row < 0 || col < 0 || !@board[row,col].is_a(NullPiece)
      diagonal_moves << [row, col]
      row -= 1
      col -= 1
    end
    diagonal_moves << [row, col] if (row < 0 || col < 0)  && @board[row,col].color == opposing_color

    row, col = pos
    row += 1
    col -= 1
    until row > 7 || col < 0 || !@board[row,col].is_a(NullPiece)
      diagonal_moves << [row, col]
      row += 1
      col -= 1
    end
    diagonal_moves << [row, col] if (row > 7 || col < 0)  && @board[row,col].color == opposing_color

    row, col = pos
    row -= 1
    col += 1
    until row < 0 || col > 7 || !@board[row,col].is_a(NullPiece)
      diagonal_moves << [row, col]
      row -= 1
      col += 1
    end
    diagonal_moves << [row, col] if (row < 0 || col > 7)  && @board[row,col].color == opposing_color
    diagonal_moves
  end
end
