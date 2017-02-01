require_relative 'piece'
require_relative 'sliding_piece'

class Queen < Piece
  include Sliding

  DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0],
              [1, 1], [1, -1], [-1, -1], [-1, 1]]

  def initialize(starting_position)
    super("queen", starting_position)
  end

  def move_dirs
    moves
  end

end
