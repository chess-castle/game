class Bishop < Piece

  def valid_move?(new_x, new_y)
    #find how far you have to travel.
    x_travel = x_travel(new_x)
    y_travel = y_travel(new_y)

    #returns true if the distance to travel is at least one move away and is diagonal.
    (x_travel >= 1 && y_travel >= 1) && diagonal?(x_travel, y_travel)
  
  end

end