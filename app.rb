require 'rubygems'
require 'bundler/setup'

require 'cuba'
require './mine_sweeper'
require 'json'

Cuba.use Rack::Static,
         urls: %w[/js /css /img /play],
         root: File.expand_path("./public", __dir__)

Cuba.define do

  on post, 'mine_sweeper/:row/:col/:board' do |row, col, board|
    ms       = MineSweeper.new
    ms.board = JSON.parse(URI.decode(board))

    res.write JSON.generate( ms.no_mines_adjacents({r: row.to_i, c: col.to_i}) )
  end

  on post, 'mine_sweeper' do
    ms = MineSweeper.new
    ms.start!

    res.write JSON.generate(ms.board)
  end

end
