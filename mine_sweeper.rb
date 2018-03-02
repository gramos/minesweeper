class MineSweeper

  attr_accessor :board
  attr_accessor :mines

  def initialize
    @board = []
    @mines = []

    6.times do |t|
      @board[t] = [0, 0, 0, 0, 0, 0]
    end
  end

  def start!
    mine!
    fill_cells!
  end

  def neighbors(row, col)
    [ { r: ( row -1 ), c: (col -1) }, { r: ( row -1 ), c: col },
      { r: ( row -1 ), c: (col +1) },

      { r: ( row ), c: (col -1) }, { r: ( row ), c: col +1},

      { r: ( row +1 ), c: (col -1) }, { r: ( row +1 ), c: col },
      { r: ( row +1 ), c: (col +1) },
    ].map{|n|
      row_limit = @board[0].size - 1
      col_limit = @board.size - 1

      n if ( 0..row_limit ).include? n[:r] and
           ( 0..col_limit  ).include? n[:c]
    }.compact
  end

  def no_mines_adjacents(cell, exclude_list = [cell])
    if @board[ cell[:r] ] [ cell[:c] ] == 0
      n_list = neighbors(cell[:r], cell[:c]) - exclude_list
      n      = n_list.pop
      no_mines_adjacents(n, ( exclude_list + [n] ) )
    else
      return exclude_list
    end
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

  def bomb?(r, c)
    @board[r][c] == 'x'
  end

  def fill_cells!
    @mines.each do |m|

      neighbors( m[:r], m[:c] ).each do |n|
        unless bomb?(n[:r], n[:c])
          @board[ n[:r] ] [ n[:c] ] += 1
        end
      end

    end

  end
end
