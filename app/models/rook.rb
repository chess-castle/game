class Rook < Piece
  def valid_move?(new_x, new_y)
    x_travel = x_travel(new_x)
    y_travel = y_travel(new_y)

    (x_travel >= 1 && y_travel == 0) || (y_travel >= 1 && x_travel == 0)
  end

end