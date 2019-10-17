class Pawn < Piece
   def valid_move?(new_x,new_y)

         if d=Piece.find_by_game_id_and_x_position_and_y_position(self.game_id,new_x,new_y)
            exist=true
          else
            exist=false
          end
                
          if self.x_position-2==new_x && self.y_position==new_y && self.x_position==6 && exist==false
           t=true
            
          elsif self.x_position-1==new_x && self.y_position==new_y && new_x>=0 && exist==false
           t=true

          elsif self.x_position-1==new_x && self.y_position-1==new_y && new_x>=0 && new_y>=0 && exist==true && self.user_id!=d.user_id
            t=true
           
          elsif self.x_position-1==new_x && self.y_position+1==new_y && new_x>=0 && new_y<=7 && exist==true && self.user_id!=d.user_id
           t=true
           

          else 
           t=false    

        end

      return t
      
   end
end