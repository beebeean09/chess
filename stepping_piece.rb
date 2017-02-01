module Stepping
  def moves
    positions = []
    self.class::DIRECTIONS.each do |delta|
      delta_pos = @current_position.dup
      delta_pos = delta_pos[0]+delta[0], delta_pos[1]+delta[1]
      if delta_pos.all? { |val| val.between?(0,7) }
        positions << delta_pos
      end
    end
    positions
  end
end
