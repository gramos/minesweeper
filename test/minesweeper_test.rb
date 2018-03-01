require_relative '../mine_sweeper'

test 'Get an empty board 6x6 by default' do
  empty_board = []

  6.times do |t|
    empty_board[t] = [0, 0, 0, 0, 0, 0]
  end

  assert MineSweeper.new.board == empty_board
end

test 'Get the neighbors of a cell' do
  ms = MineSweeper.new

  assert ms.neighbors(3, 2) == [ {r: 2, c: 1}, {r: 2, c: 2}, {r: 2, c: 3},
                                 {r: 3, c: 1}, {r: 3, c: 3},
                                 {r: 4, c: 1}, {r: 4, c: 2}, {r: 4, c: 3} ]
end

test 'Get the neighbors of a cell' do
  ms = MineSweeper.new

  assert ms.neighbors(0, 0) == [ {r: 0, c: 1}, {r: 1, c: 0}, {r: 1, c: 1} ]
end


test 'Mine the board with 2 mines per row by default' do
  ms = MineSweeper.new

  ms.mine!

  6.times do |r|
    mine_counter = 0

    6.times do |c|
      mine_counter += 1 if ms.board[r][c] == 'x'
    end

    assert mine_counter == 2
  end
end

# test 'Fill cells with mine counters' do
#   ms = MineSweeper.new

#   ms.mine!
#   board = ms.board
#   mines = (0..ms.board[0].size-1).select { |i| ms.board[0][i] == 'x' }

#   ms.fill_cells!

#   ms.neighbors.each do |n|
#     assert ms.board[ n[:r], n[:c] ] > 0
#   end
# end

