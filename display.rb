require_relative 'board'
require 'cursor'
require 'colorize'
class Display < Board
  def initialize
    @cursor = Cursor.new([0,0],board)
  end

  def render
    p "hello"
    SIZE.times do |i|
      SIZE.times do |j|
        print "#{@board[i][j]}\t"
        puts "\n\n"if j == SIZE - 1
      end
    end
  end
end
