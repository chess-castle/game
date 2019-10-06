class GameboardController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  #eventually enable devise to stop actions without authentication prior

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
  end

  def show 
  end

  def update
    @game = Game.find_by_id(params[:id])

    @game.update_attributes(game_params)
    if @game.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end


  def game_params
    params.require(:game).permit(:black_player_id, :game_id, :white_player_id, :name)
  end
end
