require_relative 'board'
require_relative 'cursor'
require 'colorize'
class Display < Board
  def initialize board
    @cursor = Cursor.new([0,0],board)
    @board = board
  end

  def render
    #printing index
    system("clear")
    SIZE.times do |i|
      print "\t#{i}"
    end
    puts "\n"

    #printing board
    SIZE.times do |i|
      print "#{i}\t"
      SIZE.times do |j|
        if [i, j] == @cursor.cursor_pos
          print "#{@board[i][j]}\t".colorize(background: :blue)
        else
          print "#{@board[i][j]}\t"
        end
        puts "\n\n"if j == SIZE - 1
      end
    end
  end

  def get_input
    @cursor.get_input
  end
end

if __FILE__ == $0
   a = Display.new(Board.new)
   while true
     a.render
     a.get_input
   end
end
