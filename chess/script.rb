require_relative "board"
require_relative "display"
require_relative "cursor"
b = Board.new
d = Display.new(b)
d.render
