class Piece < ApplicationRecord
 #belongs_to :users
 scope :white, -> { where(color: 'white') }
 scope :black, -> { where(color: 'black') }

  def move_to!(new_x, new_y)

   if d=Piece.find_by(:x_position => new_x, :y_position => new_y)
     userID=d.user_id
     gameID=d.game_id
     
    if gameID==self.game_id && self.user_id!=userID # if GAME IS SAME AND Black vs White pieces
     
     self.x_position=new_x
     self.y_position=new_y
     self.save
     d.destroy

    else   # if GAME IS NOT SAME or SAME User's pieces         
      "FAIL"

    end 

   else  # NO PIECE LOCATED THERE 
     self.x_position=new_x
     self.y_position=new_y
     self.save
   end
 
  end 

  def is_obstructed?(new_x, new_y)
    # @game = game_id
    x1 = self.x_position
    y1 = self.y_position
    x2 = new_x
    y2 = new_y
    if diagonal?(x_travel, y_travel) == is occupied(x, y)
      return true
    

  #if both travels are equal you are going diagonally
  def diagonal?(x_travel, y_travel)
    x_travel == y_travel
  end

  # determines horizontal distance travelled by piece
  def x_travel(new_x)
    x_travel = (new_x - x_position).abs
  end

  # determines vertical distance travelled by piece
  def y_travel(new_y)
    y_travel = (new_y - y_position).abs
  end
  
  def can_move_to(new_x, new_y)
    #check if piece moves that way use valid_move?
    #is there anything along the way

  end

  def capture
    #what happens when a piece is captured
  end

  def find_by_game_id(game_id)
    Piece.find_by(:game_id => game_id)
  end

  def color
    #need new column on piece for color
  end

  # determines whether the square with coordinates (x, y) is occupied
  # def occupied?(new_x, new_y)
  #   self.pieces.where(:x_position => new_x, :y_position => new_y).present? 
  #   pieces.each do |piece|
  #     return true if piece.x_position == new_x && piece.y_position == new_y
  #   end
  #   false
  # end

  # determines whether the square with coordinates (x, y) is occupied
  def occupied?(x, y)
    pieces.where(:x_position => x, :y_position => y).present? 
    pieces.each do |piece|
      return true if piece.x_coordinates == x && piece.y_coordinates == y
    end
    false
  end

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      @slope = (y2 - y1).to_f/(x2 - x1).to_f
    end
  end

  # determines whether the path between piece1 and destination is obstructed by another piece
  def is_obstructed?(new_x, new_y)
    # converts the location arrays into easier-to-read x and y terms
    x1 = self.x_position  #x_coordinates[0]
    y1 = self.y_position
    x2 = new_x
    y2 = new_y
    # Determines whether the line between piece1 and the destination is horizontal or
    # vertical. If neither, then it calculates the slope of line between piece1 and destination.
    path = check_path(x1, y1, x2, y2)
    # Iterates through every square between piece1 and destination
    # and checks whether it is occupied
    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    if path == 'vertical' && y1 < y2
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    if path == 'horizontal' || path == 'vertical'
      return false
    end
    if @slope.abs == 1.0 && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end
    if @slope.abs == 1.0 && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end
    if @slope.abs != 1.0
      fail 'path is not a straight line'
    else return false
    end
  end


end
