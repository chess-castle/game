class Pawn < Piece
   def valid_move?(new_x,new_y)

        if d=Piece.find_by_game_id_and_x_position_and_y_position(self.game_id,new_x,new_y)
       
                    exist=true                  
                  else
                    exist=false
                  end


                

                if Piece.find_by_game_id_and_x_position_and_y_position_and_color(self.game_id,self.x_position,self.y_position,"black")

                  if self.y_position-2==new_y && self.x_position==new_x && self.y_position==6 && exist==false
                   t=true
                    
                  elsif self.y_position-1==new_y && self.x_position==new_x && new_y>=0 && exist==false
                   t=true

                  elsif self.y_position-1==new_y && self.x_position-1==new_x && new_y>=0 && new_x>=0 && exist==true && self.user_id!=d.user_id
                    t=true
                   
                  elsif self.y_position-1==new_y && self.x_position+1==new_x && new_y>=0 && new_x<=7 && exist==true && self.user_id!=d.user_id
                   t=true
                   
                  else 
                   t=false

                  end 
  

                  

                elsif Piece.find_by_game_id_and_x_position_and_y_position_and_color(self.game_id,self.x_position,self.y_position,"white")

                  if self.y_position+2==new_y && self.x_position==new_x && self.y_position==1 && exist==false
                   t=true
                    
                  elsif self.y_position+1==new_y && self.x_position==new_x && new_y<=7 && exist==false
                   t=true

                  elsif self.y_position+1==new_y && self.x_position+1==new_x && new_y<=7 && new_x<=7 && exist==true && self.user_id!=d.user_id
                    t=true
                   
                  elsif self.y_position+1==new_y && self.x_position-1==new_x && new_y<=7 && new_x>=0 && exist==true && self.user_id!=d.user_id
                   t=true
                   
                  else 
                   t=false

                  end 

                  else 
                  t=false   

               end  



      return t
      
   end
end