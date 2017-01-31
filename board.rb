require_relative 'null_piece'
require 'byebug'
require 'colorize'
class Board

  SIZE = 8
  attr_reader :board
  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
    @position = NullPiece.new
    fill_board
  end

  def move_piece(start_pos, end_pos)
    start_pos = length_check(start_pos,"starting")
    end_pos = length_check(end_pos, "ending")
    start_pos = in_bound(start_pos, "starting")
    end_pos = in_bound(end_pos, "ending")
  end

  def fill_board
    @rook = [[0,0], [0,7], [7,0], [7,7]]
    @knight = [[0,1], [0,6], [7,1], [7,6]]
    @bishop = [[0,2], [0,5], [7,2], [7,5]]
    @queen = [[0,3], [7,3]]
    @king = [[0,4], [7,4]]
    @pawn = []
    (0..7).each do |idx|
      @pawn << [1, idx] << [6, idx]
    end
    @rook.each { |x,y| @board[x][y] = (x < 7 ? "rook".red : "rook".black ) }
    @knight.each { |x,y| @board[x][y] = (x < 7 ? "knight".red : "knight".black) }
    @bishop.each { |x,y| @board[x][y] = (x < 7 ? "bishop".red : "bishop".black) }
    @queen.each { |x,y| @board[x][y] = (x < 7 ? "queen".red : "queen".black) }
    @king.each { |x,y| @board[x][y] = (x < 7 ? "king".red : "king".black) }
    @pawn.each { |x,y| @board[x][y] = (x < 6 ? "pawn".red : "pawn".black) }
  end

  def []=(pos, str)
    x, y = pos
    @board[x][y] = str
  end

  def [](pos)
    x,y = pos
    @board[x][y]
  end

  def length_check pos,str
    begin
      raise if pos.length < 2
      pos
    rescue
      puts "Please provide coordinate (x,y)"
      print "Need #{str} position (x,y): "
      pos = gets.chomp.split(",").map(&:to_i)
      retry
    end
  end

  def coordinate_error str
    print "Provide #{str} position (x,y): "
    STDIN.gets.chomp.split(",").map(&:to_i)
  end

  def in_bound pos
    begin
      x,y = pos
      raise unless x.between?(0,SIZE-1) && y.between?(0,SIZE-1)
      pos
    rescue
      puts "Out of in_bound. Board is 8X8 (0-7)X(0-7)"
      print "Provide valid position (x,y): "
      pos = STDIN.gets.chomp.split(",").map(&:to_i)
      retry
    end
  end
end

board = Board.new
board.move_piece([9],[1,2])
