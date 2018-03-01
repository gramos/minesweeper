class MineSweeper

  attr_reader :board

  def initialize
    @board = []

    5.times do |t|
      @board[t] = [0, 0, 0, 0, 0, 0]
    end
  end
end
