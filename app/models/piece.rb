class Piece < ApplicationRecord
 #belongs_to :users
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

end
