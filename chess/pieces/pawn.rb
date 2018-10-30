require_relative "../piece"

def Pawn < Piece

    def initialize(color, board, pos)
      super(color, board, pos)
      @symbol = "♟"
    end
    
    def move_dirs

    end

  private

    def at_start_row?

    end

    def forward_steps

    end

    def side_attacks

    end

end
