class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  scope :available, -> { where('white_player_id IS NULL or black_player_id IS NULL') }
  

    after_create :populate

  def populate
    #setup board
    #white pieces
      #pawns
      (0..7).each do |x|
        Pawn.create(game_id: id, x_position: x, y_position: 1, user_id: white_player_id, color: 'white')
      end

      #rooks
      [0, 7].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 0, user_id: white_player_id, color: 'white')
      end
   
      #Knights
      [1, 6].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 0, user_id: white_player_id, color: 'white')
      end

      #Bishops
      [2, 5].each do |x|
      Bishop.create(game_id: id, x_position: x, y_position: 0, user_id: white_player_id, color: 'white')
      end

      #King
      King.create(game_id: id, x_position: 4, y_position: 0, user_id: white_player_id, color: 'white')
      
      #Queen
      Queen.create(game_id: id, x_position: 3, y_position: 0, user_id: white_player_id, color: 'white')
      


      #black peices
     
      #pawns
      (0..7).each do |x|
        Pawn.create(game_id: id, x_position: x, y_position: 6, user_id: black_player_id, color: 'black')
      end

      #rooks
      [0, 7].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 7, user_id: black_player_id, color: 'black')
      end
   
      #Knights
      [1, 6].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 7, user_id: black_player_id, color: 'black')
      end

      #Bishops
      [2, 5].each do |x|
        Bishop.create(game_id: id, x_position: x, y_position: 7, user_id: black_player_id, color: 'black')
      end

      #King
      King.create(game_id: id, x_position: 4, y_position: 7, user_id: black_player_id, color: 'black')
      
      #Queen
      Queen.create(game_id: id, x_position: 3, y_position: 7, user_id: black_player_id, color: 'black')

  end


  def white_player
    User.find_by_id(white_player_id)
  end

  def black_player
    User.find_by_id(black_player_id)
  end

  def whos_turn!
    if current_turn != "white"
      self.update_attribute(:current_turn, "white")
    elsif current_turn != "black"
      self.update_attribute(:current_turn, "black")
    end
  end

  def is_occupied?(x, y) 
    pieces.each do |piece|
      return true if piece.x_position == x && piece.y_position == y
    end
    return false
  end

  def get_piece_at_location(x, y)

  end


  def in_check?
    enemy_pieces = []
    #figure out whos turn it is to know what king to check for check
    if current_turn == "black" 
      @king = pieces.black.find_by_type("King")
      
    else
      @king = pieces.white.find_by_type("King")
      
    end
    puts pieces
    #make an array of peices not matching our color
    enemy_pieces = pieces.where.not(color: current_turn)
    puts enemy_pieces
    #check each peice to see if king position is a valid move
      enemy_pieces.each do |piece|
        if piece.valid_move?(@king.x_position, @king.y_position)
          #need to check if piece is obstructed of not return true.
          return true
        end
        
        return false
      end
  end
end