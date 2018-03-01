class MineSweeper

  attr_reader :board

  def initialize
    @board = []

    6.times do |t|
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

  def mine!
    @board.size.times do |r|
      c1 = rand(6)
      c2 = rand(6)

      while(c2 == c1) do
        c2 = rand(6)
      end

      @board[r][c1] = 'x'
      @board[r][c2] = 'x'
    end
  end
end
