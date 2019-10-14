class Queen < Piece
  def valid_move?(new_x, new_y)
  
    x_travel = x_travel(new_x)
    y_travel = y_travel(new_y)

    # Diagonal
    if (x_travel >= 1 && y_travel >= 1) && diagonal?(x_travel, y_travel) && new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7
      return true

    # Horizontal
    elsif (x_travel >= 1 && y_travel == 0) && x_travel(new_x) && new_x >= 0 && new_x <= 7
      return true

    # Vertical
    elsif (x_travel == 0 && y_travel >= 1) && y_travel(new_y) && new_y >=0 && new_y <= 7
      return true
    else
      return false
    end
      
  end
end