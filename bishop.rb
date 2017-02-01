require_relative 'sliding_piece'
require_relative 'piece'

class Bishop < Piece
  include Sliding

  DIRECTIONS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

  def initialize(starting_position)
    super("bishop", starting_position)
  end

  def move_dirs
    moves
  end

end
