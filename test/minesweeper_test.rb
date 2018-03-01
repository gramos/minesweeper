test 'Get an empty board' do

  empty_board = []

  5.times do |t|
    empty_board[t] = [0, 0, 0, 0, 0, 0]
  end

  puts empty_board[0].inspect
  assert MineSweeper.new == empty_board
end
