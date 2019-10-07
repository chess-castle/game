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

  private

  def game
    @game ||= Game.where(id: params[:id]).last
  end

  def game_params
    params.require(:game).permit(:name, :black_player_id, :white_player_id)
  end
end
