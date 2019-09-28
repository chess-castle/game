class CheckObstructionCasesController < ApplicationController

  def is_obstruction
   
      @post = CheckObstructionCase.new(post_params) 
      @post.save              
      @post2=CheckObstructionCase.last

    @PointA=@post2.PointA 
    @PointB=@post2.PointB 

    @X='ABCDEFGH'
    @Y='12345678'

    @position = { 
                  "A1" => "B_Rook",
                  "A2" => "B_Pawn",
                  "A3" => "",
                  "A4" => "",
                  "A5" => "",
                  "A6" => "W_Bishop",
                  "A7" => "",
                  "A8" => "W_Rook",

                  "B1" => "B_Knight",
                  "B2" => "B_Pawn",
                  "B3" => "",
                  "B4" => "",
                  "B5" => "",
                  "B6" => "W_Pawn",
                  "B7" => "",
                  "B8" => "",
                  
                  "C1" => "",
                  "C2" => "",
                  "C3" => "",
                  "C4" => "B_Pawn",
                  "C5" => "",
                  "C6" => "",
                  "C7" => "W_Pawn",
                  "C8" => "",

                  "D1" => "B_King",
                  "D2" => "",
                  "D3" => "",
                  "D4" => "W_Knight",
                  "D5" => "",
                  "D6" => "",
                  "D7" => "W_Pawn",
                  "D8" => "W_King",

                  "E1" => "",
                  "E2" => "B_Pawn",
                  "E3" => "",
                  "E4" => "",
                  "E5" => "",
                  "E6" => "",
                  "E7" => "W_Pawn",
                  "E8" => "W_Queen",

                  "F1" => "B_Bishop",
                  "F2" => "B_Pawn",
                  "F3" => "",
                  "F4" => "",
                  "F5" => "",
                  "F6" => "",
                  "F7" => "W_Pawn",
                  "F8" => "W_Bishop",

                  "G1" => "B_Knight",
                  "G2" => "B_Pawn",
                  "G3" => "",
                  "G4" => "",
                  "G5" => "",
                  "G6" => "",
                  "G7" => "W_Pawn",
                  "G8" => "W_Knight",

                  "H1" => "B_Rook",
                  "H2" => "B_Pawn",
                  "H3" => "",
                  "H4" => "",
                  "H5" => "",
                  "H6" => "B_Bishop",
                  "H7" => "W_Pawn",
                  "H8" => "W_Rook",

                }
      

      render :is_obstruction 

   end

   def input_PointA_PointB
         
   end

    
   private def post_params
    params.require(:post).permit(:PointA,:PointB)
   end 
   

end