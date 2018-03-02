require 'rubygems'
require 'bundler/setup'

require 'cuba'
require './mine_sweeper'
require 'json'

Cuba.use Rack::Static,
         urls: %w[/js /css /img /static],
         root: File.expand_path("./public", __dir__)

Cuba.define do
  on post, 'mine_sweeper' do
    ms = MineSweeper.new
    ms.start!

    res.write JSON.generate(ms.board)
  end

  on put, 'mine_sweeper/:row/:col', param(:board) do |board|
    ms       = MineSweeper.new
    ms.board = JSON.parse(board)

    res.write JSON.generate( ms.no_mines_adjacents(n) )
  end
end
