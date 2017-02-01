require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include Stepping

  DIRECTIONS = [[-1, 2], [1, 2], [2, 1], [2, -1],
              [1, -2], [-1, -2], [-2, -1], [-2, 1]]

  def initialize(starting_position)
    super("knight", starting_position)
  end

  def move_dirs
    moves
  end

end
