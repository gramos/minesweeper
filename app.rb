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

end
