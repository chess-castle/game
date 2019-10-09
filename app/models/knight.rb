class Knight < Piece

  def valid_move?(new_x,new_y)
        d=false
        if        self.y_position-2==new_y && self.x_position-1==new_x && new_y >= 0 && new_x >= 0
        d=true 
        elsif     self.y_position-2==new_y && self.x_position+1==new_x && new_y >= 0 && new_x <= 7
        d=true
        elsif     self.y_position+2==new_y && self.x_position-1==new_x && new_y <= 7 && new_x >= 0
        d=true
        elsif     self.y_position+2==new_y && self.x_position+1==new_x && new_y <= 7 && new_x <= 7
        d=true
        elsif     self.x_position-2==new_x && self.y_position-1==new_y && new_x >= 0 && new_y >= 0
        d=true
        elsif     self.x_position-2==new_x && self.y_position+1==new_y && new_x >= 0 && new_y <=7       
        d=true
        elsif     self.x_position+2==new_x && self.y_position-1==new_y && new_x <= 7 && new_y >= 0 
        d=true
        elsif     self.x_position+2==new_x && self.y_position+1==new_y && new_x <= 7 && new_y <= 7
        d=true
        else  
        d=false    
       end
   return d
  end

end