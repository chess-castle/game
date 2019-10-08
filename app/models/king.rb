class King < Piece

  def valid_move?(new_x, new_y)
    if self.x_position - 1 == new_x && self.y_position == new_y        && new_x >= 0  # Left
      return true
    elsif self.x_position + 1 == new_x && self.y_position == new_y     && new_x <= 7  # Right
      return true
    elsif self.x_position == new_x && self.y_position - 1 == new_y     && new_y >= 0  # Up
      return true
    elsif self.x_position == new_x && self.y_position + 1 == new_y     && new_y <= 7  # Down
      return true
    elsif self.x_position + 1 == new_x && self.y_position + 1 == new_y && new_x <= 7 && new_y <= 7  # Down/Right
      return true
    elsif self.x_position + 1 == new_x && self.y_position - 1 == new_y && new_x <= 7 && new_y >= 0  # Up/Right
      return true
    elsif self.x_position - 1 == new_x && self.y_position + 1 == new_y && new_x >= 0 && new_y <= 7  # Down/Left
      return true
    elsif self.x_position - 1 == new_x && self.y_position - 1 == new_y && new_x >= 0 && new_y >= 0  # Up/Left
      return true
    else
      return false
    end
  end
end