=begin
The Chessboard class

Handles everything from move validation (beyond the mere sanity tests that some
OTHER classes provide), to piece tracking. Because of it's nature, it is
(as of writing) impossible to find actual legal moves.

Also can save entire game onto some file via command. At least, it handles it.
=end

$n_to_u = {
  0 => ".",
  1 => "♔",
  2 => "♕",
  3 => "♖",
  4 => "♗",
  5 => "♘",
  6 => "♙",
  11 => "♚",
  12 => "♛",
  13 => "♜",
  14 => "♝",
  15 => "♞",
  16 => "♟"
}

class Chessboard
  def initialize
    @board = Array.new(8)
    @board.map! {|_| Array.new(8, 0)}

    initialize_board :white
    initialize_board :black
  end

  def initialize_board(side)
    i = side == :white ? 0 : 7
    add = side == :white ? 0 : 10
    # Represent the board with unique numbers
    @board[i][0] = 3 + add
    @board[i][1] = 5 + add
    @board[i][2] = 4 + add
    @board[i][3] = 2 + add
    @board[i][4] = 1 + add
    @board[i][5] = 4 + add
    @board[i][6] = 5 + add
    @board[i][7] = 3 + add
    @board[side == :white ? i+1 : i-1] = Array.new(8, 6 + add)
  end

  def make_move(m)
    if valid?(m)
      # TODO
    else
      # TODO
    end
  end

  def valid?(move)
    # move has already been initialized by the game; you don't need to do sanity
    # checks. Just do some logic checks and check if the move allows the king to
    # be in check.
    case move.piece
    when :pawn
      valid_pawn? move and king_danger? move
    when :rook
      valid_rook? move and king_danger? move
    when :knight
      valid_knight? move and king_danger? move
    when :bishop
      valid_bishop? move and king_danger? move
    when :queen
      valid_queen? move and king_danger? move
    when :king
      valid_king? move and king_danger? move
    else
      raise "Invalid move"
    end
  end

  def valid_pawn?(move)
    if move.kill and move.from.length == 1 and "abcdefgh".include? move.from
      # You have just killed something
    end
  end

  def valid_rook?(move)
    # TODO
  end

  def valid_knight?(move)
    # TODO
  end

  def valid_bishop?(move)
    # TODO
  end

  def valid_queen?(move)
    # TODO
  end

  def valid_king?(move)
    # TODO
  end

  def save(fn)
  end

  def open(fn)
  end

  def to_s(turn = :white)
    s = @board.map {|r| r.map {|i| $n_to_u[i]}.join}.join("\n")
    if turn == :black
      @board.reverse.map {|r| r.map {|i| $n_to_u[i]}.join}.join("\n")
    else
      @board.map {|r| r.map {|i| $n_to_u[i]}.join}.join("\n")
    end
  end
end
