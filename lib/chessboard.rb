require './lib/player.rb'

class Chessboard
  def intialize
    @white_player = Player.new(:white)
    @black_player = Player.new(:black)
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

  def to_s
  end
end
