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
        Pawn.create(game_id: id, x_position: x, y_position: 7, user_id: white_player_id, color: "white")
      end

      #rooks
      [0, 7].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 7, user_id: white_player_id, color: "white")
      end
   
      #Knights
      [1, 6].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 7, user_id: white_player_id, color: "white")
      end

      #Bishops
      [2, 5].each do |x|
      Bishop.create(game_id: id, x_position: x, y_position: 7, user_id: white_player_id, color: "white")
      end

      #King
      King.create(game_id: id, x_position: 4, y_position: 7, user_id: white_player_id, color: "white")
      
      #Queen
      Queen.create(game_id: id, x_position: 3, y_position: 7, user_id: white_player_id, color: "white")
      


      #black peices
     
      #pawns
      (0..7).each do |x|
        Pawn.create(game_id: id, x_position: x, y_position: 2, user_id: black_player_id, color: "black")
      end

      #rooks
      [0, 7].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 0, user_id: black_player_id, color: "black")
      end
   
      #Knights
      [1, 6].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 0, user_id: black_player_id, color: "black")
      end

      #Bishops
      [2, 5].each do |x|
        Bishop.create(game_id: id, x_position: x, y_position: 0, user_id: black_player_id, color: "black")
      end

      #King
      King.create(game_id: id, x_position: 3, y_position: 0, user_id: black_player_id, color: "black")
      
      #Queen
      Queen.create(game_id: id, x_position: 4, y_position: 0, user_id: black_player_id, color: "black")

  end

  def white_player
    User.find_by_id(white_player_id)
  end

  def black_player
    User.find_by_id(black_player_id)
  end

  def is_occupied(x, y)
    !!get_piece_at_location(x, y)
  end

  def get_piece_at_location(x, y)

  end
end
