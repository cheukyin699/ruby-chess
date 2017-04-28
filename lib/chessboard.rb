require './lib/player.rb'

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
    # TODO
  end

  def to_s(turn = :white)
    s = @board.map {|r| r.map(&$n_to_u).join}.join("\n")
    if turn == :black
      @board.reverse.map {|r| r.map(&$n_to_u).join}.join("\n")
    else
      @board.map {|r| r.map(&$n_to_u).join}.join("\n")
    end
  end
end
