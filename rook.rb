require_relative 'sliding_piece'
require_relative 'piece'

class Rook < Piece
  include Sliding

  DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  def initialize(starting_position)
    super("rook", starting_position)
  end

  def move_dirs
    moves
  end

end
