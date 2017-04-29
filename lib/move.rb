class Move
  attr_accessor :piece, :from, :to, :kill, :type, :promo

  @@PieceMap = {
    'R' => :rook, 'N' => :knight, 'B' => :bishop,
    'Q' => :queen, 'K' => :king
  }

  def initialize(s)
    from_string(s)
  end

  def from_string(s)
    @piece = nil
    @from = nil
    @to = nil
    @kill = false
    @promo = nil

    case s
    when "O-O"
      @type = :kcastle
      @piece = :king
    when "O-O-O"
      @type = :qcastle
      @piece = :queen
    else
      @type = :normal
      #        PIECE            FROM                    KILL    TO              PROMO
      data = /(?<p>[RNBQK])?(?<f>[a-h1-8]|[a-h][1-8])?(?<x>x)?(?<t>[a-h][1-8])(?<promo>=[RNBQ])?/.match(s)

      if data.nil?
        raise "Invalid Move"
      else
        @piece = data[:p].nil? ? :pawn : @@PieceMap[data[:p]]
        @from = data[:f]
        @to = data[:t]
        @kill = not(data[:x].nil?)
        @promo = @@PieceMap[data[:promo][1]] unless data[:promo].nil?

        # Promotional challenges
        if not @promo.nil? and @to[1] != "8"
          raise "Invalid Move"
        end

        @type = :promo unless @promo.nil?
      end
    end
  end

  private :from_string
end
