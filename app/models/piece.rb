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
end
