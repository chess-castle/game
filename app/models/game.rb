class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  scope :avaliable ~>{ where(avaliable: true ) }
  #where(users.length == 1) should be updated?
  scope :unavaliable ~>{ where(avaliable: [nil, false] ) }

  after_create :populate

  def populate
    #setup board
    #white pieces
      #pawns
      (1..8).each do |x|
        Pawn.create(game_id: id, x_position: x, y_position: 7, user_id: white_player_id, peices_type: "Pawn_white")
      end

      #rooks
      [1, 8].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 8, user_id: white_player_id, peices_type: "Rook_white")
      end
   
      #Knights
      [2, 7].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 8, user_id: white_player_id, peices_type: "Knight_white")
      end

      #Bishops
      [3, 6].each do |x|
        Bishop.create(game_id: id, x_position: x, y_position: 8, user_id: white_player_id, peices_type: "Bishop_white")
      end

      #King
      King.create(game_id: id, x_position: 5, y_position: 8, user_id: white_player_id, peices_type: "King_white")
      
      #Queen
      Queen.create(game_id: id, x_position: 4, y_position: 8, user_id: white_player_id, peices_type: "Queen_white")
      


      #black peices
      #white pieces
      #pawns
      (1..8).each do |x|
        Pawn.create(game_id: id, x_position: x, y_position: 2, user_id: black_player_id, peices_type: "Pawn_black")
      end

      #rooks
      [1, 8].each do |x|
        Rook.create(game_id: id, x_position: x, y_position: 1, user_id: black_player_id, peices_type: "Rook_black")
      end
   
      #Knights
      [2, 7].each do |x|
        Knight.create(game_id: id, x_position: x, y_position: 1, user_id: black_player_id, peices_type: "Knight_black")
      end

      #Bishops
      [3, 6].each do |x|
        Bishop.create(game_id: id, x_position: x, y_position: 1, user_id: black_player_id, peices_type: "Bishop_black")
      end

      #King
      King.create(game_id: id, x_position: 5, y_position: 1, user_id: black_player_id, peices_type: "King_black")
      
      #Queen
      Queen.create(game_id: id, x_position: 4, y_position: 1, user_id: black_player_id, peices_type: "Queen_black")

  end

  def white_player
    User.find_by_id(white_player_id)
  end

  def black_player
    User.find_by_id(black_player_id)
  end

end
