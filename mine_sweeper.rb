class MineSweeper

  attr_reader :board

  def initialize
    @board = []

    5.times do |t|
      @board[t] = [0, 0, 0, 0, 0, 0]
    end
  end

  def neighbors(row, col)
    [ { f: ( row -1 ), c: (col -1) }, { f: ( row -1 ), c: col },
      { f: ( row -1 ), c: (col +1) },

      { f: ( row ), c: (col -1) }, { f: ( row ), c: col +1},

      { f: ( row +1 ), c: (col -1) }, { f: ( row +1 ), c: col },
      { f: ( row +1 ), c: (col +1) },
    ]
  end
end
