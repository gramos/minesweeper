require_relative '../mine_sweeper'

test 'Get an empty board' do
  empty_board = []

  5.times do |t|
    empty_board[t] = [0, 0, 0, 0, 0, 0]
  end

  assert MineSweeper.new.board == empty_board
end
