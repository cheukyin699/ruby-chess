=begin
The Player class keeps track of all the positions all of
their pieces, in a nice map, for easy lookup. This is to go
against the traditional method of having a 2d array, so we
know which piece is which.

The coordinates for the pieces will be in tuple format:
(1, 1) representing the square a1, (2, 1) representing square
b1, and so on.

For the values, symbols will be used.
:pawn :rook :knight :bishop :queen :king
=end
class Player
  attr_accessor :pieces
  @@backrow_pieces = [:rook, :knight, :bishop, :queen, :king,
                      :bishop, :knight, :rook]

  def initialize(color = :white)
    @pieces = Hash.new

    if color == :white
      populate(1, 2)
    else
      populate(8, 7)
    end
  end

  def populate(tier1, tier2)
    for i in 1..8
      @pieces[[i, tier1]] = @@backrow_pieces[i-1]
      @pieces[[i, tier2]] = :pawn
    end
  end

  def move(old_pos, new_pos)
    # This function doesn't bother to check whether the move
    # is legal or not. That logic is called by the board.
    piece = @pieces.delete(old_pos)
    @pieces[new_pos] = piece
  end

  def kill(pos)
    @pieces.delete(pos)
  end

  private :populate
end
