require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include Stepping

  DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0],
              [1, 1], [1, -1], [-1, -1], [-1, 1]]

  def initialize(starting_position)
    super("king", starting_position)
  end

  def move_dirs
    moves
  end

end
