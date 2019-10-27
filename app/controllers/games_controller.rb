class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    @pieces = @game.pieces
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find_by(id: params[:id])
    @pieces = @game.pieces
  end

  def update
  end

  def piece_movement
  
  respond_to :js, :htmls
     
      pID=params[:idP]
      xPOS=params[:xPosition]
      yPOS=params[:yPosition]
      game_ID=params[:game_Id]
  
     if d=Piece.find_by_id_and_game_id(pID,game_ID)
      if d.valid_move?(xPOS.to_i,yPOS.to_i)==true
       d.move_to!(xPOS,yPOS)
      end
     end
      render :show
  end

  private

  def game
    @game ||= Game.where(id: params[:id]).last
  end

  def game_params
    params.require(:game).permit(:name, :black_player_id, :white_player_id, :current_turn)
  end
end
