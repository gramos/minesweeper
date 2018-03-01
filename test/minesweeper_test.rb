require_relative '../mine_sweeper'

test 'Get an empty board' do
  empty_board = []

  5.times do |t|
    empty_board[t] = [0, 0, 0, 0, 0, 0]
  end

  assert MineSweeper.new.board == empty_board
end

test 'Get the neighbors of a cell' do
  ms = MineSweeper.new

  assert ms.neighbors(3, 2) == [ {f: 2, c: 1}, {f: 2, c: 2}, {f: 2, c: 3},
                                 {f: 3, c: 1}, {f: 3, c: 3},
                                 {f: 4, c: 1}, {f: 4, c: 2}, {f: 4, c: 3} ]
end
