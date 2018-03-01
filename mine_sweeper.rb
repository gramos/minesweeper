class MineSweeper

  attr_reader :board

  def initialize
    @board = []
    @mines = []

    6.times do |t|
      @board[t] = [0, 0, 0, 0, 0, 0]
    end
  end

  def neighbors(row, col)
    [ { r: ( row -1 ), c: (col -1) }, { r: ( row -1 ), c: col },
      { r: ( row -1 ), c: (col +1) },

      { r: ( row ), c: (col -1) }, { r: ( row ), c: col +1},

      { r: ( row +1 ), c: (col -1) }, { r: ( row +1 ), c: col },
      { r: ( row +1 ), c: (col +1) },
    ].map{|n|
      n if ( 0..@board[0].size ).include? n[:r] and
        ( 0..@board.size ).include? n[:c]
    }.compact
  end

  def mine!
    @board.size.times do |r|
      c1 = rand(6)
      c2 = rand(6)

      while(c2 == c1) do
        c2 = rand(6)
      end

      @mines << {r: r, c: c1}
      @mines << {r: r, c: c2}

      @board[r][c1] = 'x'
      @board[r][c2] = 'x'
    end
  end

  def fill_cells!

    @mines.each do |m|
      puts m.inspect

      neighbors( m[:r], m[:c] ).each do |n|
        puts n.inspect
        @board[ n[:r], n[:c] ] += 1
      end

    end

  end
end
